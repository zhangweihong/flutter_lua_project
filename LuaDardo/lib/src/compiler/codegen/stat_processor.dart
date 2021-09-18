import '../ast/block.dart';
import '../ast/exp.dart';
import '../ast/stat.dart';
import 'block_processor.dart';
import 'exp_helper.dart';
import 'exp_processor.dart';
import 'funcinfo.dart';

class StatProcessor {

  static void processStat(FuncInfo fi, Stat node) {
    if (node is FuncCallStat) {
      processFuncCallStat(fi, node);
    } else if (node is BreakStat) {
      processBreakStat(fi, node);
    } else if (node is DoStat) {
      processDoStat(fi, node);
    } else if (node is WhileStat) {
      processWhileStat(fi, node);
    } else if (node is RepeatStat) {
      processRepeatStat(fi, node);
    } else if (node is IfStat) {
      processIfStat(fi, node);
    } else if (node is ForNumStat) {
      processForNumStat(fi,node);
    } else if (node is ForInStat) {
      processForInStat(fi, node);
    } else if (node is AssignStat) {
      processAssignStat(fi, node);
    } else if (node is LocalVarDeclStat) {
      processLocalVarDeclStat(fi, node);
    } else if (node is LocalFuncDefStat) {
      processLocalFuncDefStat(fi, node);
    } else if (node is LabelStat
    || node is GotoStat) {
      throw Exception("label and goto statements are not supported!");
    }
  }

  static void processLocalFuncDefStat(FuncInfo fi, LocalFuncDefStat node) {
    int r = fi.addLocVar(node.name, fi.pc()+2);
    ExpProcessor.processFuncDefExp(fi, node.exp, r);
  }

  static void processFuncCallStat(FuncInfo fi, FuncCallStat node) {
    int r = fi.allocReg();
    ExpProcessor.processFuncCallExp(fi, node.exp, r, 0);
    fi.freeReg();
  }

  static void processBreakStat(FuncInfo fi, BreakStat node) {
    int pc = fi.emitJmp(node.line, 0, 0);
    fi.addBreakJmp(pc);
  }

  static void processDoStat(FuncInfo fi, DoStat node) {
    fi.enterScope(false);
    BlockProcessor.processBlock(fi, node.block);
    fi.closeOpenUpvals(node.block.lastLine);
    fi.exitScope(fi.pc() + 1);
  }

  /*
               ______________
              /  false? jmp  |
             /               |
    while exp do block end <-'
          ^           \
          |___________/
               jmp
    */
  static void processWhileStat(FuncInfo fi, WhileStat node) {
    int pcBeforeExp = fi.pc();

    int oldRegs = fi.usedRegs;
    int a = ExpProcessor.expToOpArg(fi, node.exp, ExpProcessor.ARG_REG).arg;
    fi.usedRegs = oldRegs;

    int line = ExpHelper.lastLineOf(node.exp);
    fi.emitTest(line, a, 0);
    int pcJmpToEnd = fi.emitJmp(line, 0, 0);

    fi.enterScope(true);
    BlockProcessor.processBlock(fi, node.block);
    fi.closeOpenUpvals(node.block.lastLine);
    fi.emitJmp(node.block.lastLine, 0, pcBeforeExp-fi.pc()-1);
    fi.exitScope(fi.pc());

    fi.fixSbx(pcJmpToEnd, fi.pc()-pcJmpToEnd);
  }

  /*
            ______________
           |  false? jmp  |
           V              /
    repeat block until exp
    */
  static void processRepeatStat(FuncInfo fi, RepeatStat node) {
    fi.enterScope(true);

    int pcBeforeBlock = fi.pc();
    BlockProcessor.processBlock(fi, node.block);

    int oldRegs = fi.usedRegs;
    int a = ExpProcessor.expToOpArg(fi, node.exp, ExpProcessor.ARG_REG).arg;
    fi.usedRegs = oldRegs;

    int line = ExpHelper.lastLineOf(node.exp);
    fi.emitTest(line, a, 0);
    fi.emitJmp(line, fi.getJmpArgA(), pcBeforeBlock-fi.pc()-1);
    fi.closeOpenUpvals(line);

    fi.exitScope(fi.pc() + 1);
  }

  /*
             _________________       _________________       _____________
            / false? jmp      |     / false? jmp      |     / false? jmp  |
           /                  V    /                  V    /              V
    if exp1 then block1 elseif exp2 then block2 elseif true then block3 end <-.
                       \                       \                       \      |
                        \_______________________\_______________________\_____|
                        jmp                     jmp                     jmp
    */
  static void processIfStat(FuncInfo fi, IfStat node) {
    var pcJmpToEnds = List<int>(node.exps.length);
    int pcJmpToNextExp = -1;

    for (int i = 0; i < node.exps.length; i++) {
      Exp exp = node.exps[i];
      if (pcJmpToNextExp >= 0) {
        fi.fixSbx(pcJmpToNextExp, fi.pc()-pcJmpToNextExp);
      }

      int oldRegs = fi.usedRegs;
      int a = ExpProcessor.expToOpArg(fi, exp, ExpProcessor.ARG_REG).arg;
      fi.usedRegs = oldRegs;

      int line = ExpHelper.lastLineOf(exp);
      fi.emitTest(line, a, 0);
      pcJmpToNextExp = fi.emitJmp(line, 0, 0);

      Block block = node.blocks[i];
      fi.enterScope(false);
      BlockProcessor.processBlock(fi, block);
      fi.closeOpenUpvals(block.lastLine);
      fi.exitScope(fi.pc() + 1);
      if (i < node.exps.length-1) {
        pcJmpToEnds[i] = fi.emitJmp(block.lastLine, 0, 0);
      } else {
        pcJmpToEnds[i] = pcJmpToNextExp;
      }
    }

    for (int pc in pcJmpToEnds) {
      fi.fixSbx(pc, fi.pc()-pc);
    }
  }

  static void processForNumStat(FuncInfo fi, ForNumStat node) {
    String forIndexVar = "(for index)";
    String forLimitVar = "(for limit)";
    String forStepVar = "(for step)";

    fi.enterScope(true);

    LocalVarDeclStat lvdStat = LocalVarDeclStat(0,
        [forIndexVar, forLimitVar, forStepVar],
        [node.InitExp, node.LimitExp, node.StepExp]);
    processLocalVarDeclStat(fi, lvdStat);
    fi.addLocVar(node.varName, fi.pc()+2);

    int a = fi.usedRegs - 4;
    int pcForPrep = fi.emitForPrep(node.lineOfDo, a, 0);
    BlockProcessor.processBlock(fi, node.block);
    fi.closeOpenUpvals(node.block.lastLine);
    int pcForLoop = fi.emitForLoop(node.lineOfFor, a, 0);

    fi.fixSbx(pcForPrep, pcForLoop-pcForPrep-1);
    fi.fixSbx(pcForLoop, pcForPrep-pcForLoop);

    fi.exitScope(fi.pc());
    fi.fixEndPC(forIndexVar, 1);
    fi.fixEndPC(forLimitVar, 1);
    fi.fixEndPC(forStepVar, 1);
  }

  static void processForInStat(FuncInfo fi, ForInStat node) {
    String forGeneratorVar = "(for generator)";
    String forStateVar = "(for state)";
    String forControlVar = "(for control)";

    fi.enterScope(true);

    LocalVarDeclStat lvdStat = LocalVarDeclStat(0,
        [forGeneratorVar, forStateVar, forControlVar],
        node.expList
    );
    processLocalVarDeclStat(fi, lvdStat);
    for (String name in node.nameList) {
    fi.addLocVar(name, fi.pc()+2);
    }

    int pcJmpToTFC = fi.emitJmp(node.lineOfDo, 0, 0);
    BlockProcessor.processBlock(fi, node.block);
    fi.closeOpenUpvals(node.block.lastLine);
    fi.fixSbx(pcJmpToTFC, fi.pc()-pcJmpToTFC);

    int line = ExpHelper.lineOf(node.expList[0]);
    int rGenerator = fi.slotOfLocVar(forGeneratorVar);
    fi.emitTForCall(line, rGenerator, node.nameList.length);
    fi.emitTForLoop(line, rGenerator+2, pcJmpToTFC-fi.pc()-1);

    fi.exitScope(fi.pc() - 1);
    fi.fixEndPC(forGeneratorVar, 2);
    fi.fixEndPC(forStateVar, 2);
    fi.fixEndPC(forControlVar, 2);
  }

  static void processLocalVarDeclStat(FuncInfo fi, LocalVarDeclStat node) {
    List<Exp> exps = ExpHelper.removeTailNils(node.expList);
    int nExps = exps.length;
    int nNames = node.nameList.length;

    int oldRegs = fi.usedRegs;
    if (nExps == nNames) {
      for(Exp exp in exps) {
        int a = fi.allocReg();
        ExpProcessor.processExp(fi, exp, a, 1);
      }
    } else if (nExps > nNames) {
      for (int i = 0; i < exps.length; i++) {
        Exp exp = exps[i];
        int a = fi.allocReg();
        if (i == nExps-1 && ExpHelper.isVarargOrFuncCall(exp)) {
          ExpProcessor.processExp(fi, exp, a, 0);
        } else {
          ExpProcessor.processExp(fi, exp, a, 1);
        }
      }
    } else { // nNames > nExps
      bool multRet = false;
      for (int i = 0; i < exps.length; i++) {
        Exp exp = exps[i];
        int a = fi.allocReg();
        if (i == nExps-1 && ExpHelper.isVarargOrFuncCall(exp)) {
          multRet = true;
          int n = nNames - nExps + 1;
          ExpProcessor.processExp(fi, exp, a, n);
          fi.allocRegs(n - 1);
        } else {
          ExpProcessor.processExp(fi, exp, a, 1);
        }
      }
      if (!multRet) {
        int n = nNames - nExps;
        int a = fi.allocRegs(n);
        fi.emitLoadNil(node.lastLine, a, n);
      }
    }

    fi.usedRegs = oldRegs;
    int startPC = fi.pc() + 1;
    for (String name in node.nameList) {
    fi.addLocVar(name, startPC);
    }
  }

  static void processAssignStat(FuncInfo fi, AssignStat node) {
    List<Exp> exps = ExpHelper.removeTailNils(node.expList);
    int nExps = exps.length;
    int nVars = node.varList.length;

    var tRegs = List<int>(nVars);
    var kRegs = List<int>(nVars);
    var vRegs = List<int>(nVars);
    int oldRegs = fi.usedRegs;

    for (int i = 0; i < node.varList.length; i++) {
      Exp exp = node.varList[i];
      if (exp is TableAccessExp) {
        TableAccessExp taExp = exp;
        tRegs[i] = fi.allocReg();
        ExpProcessor.processExp(fi, taExp.prefixExp, tRegs[i], 1);
        kRegs[i] = fi.allocReg();
        ExpProcessor.processExp(fi, taExp.keyExp, kRegs[i], 1);
      } else {
        String name = (exp as NameExp).name;
        if (fi.slotOfLocVar(name) < 0 && fi.indexOfUpval(name) < 0) {
          // global var
          kRegs[i] = -1;
          if (fi.indexOfConstant(name) > 0xFF) {
            kRegs[i] = fi.allocReg();
          }
        }
      }
    }
    for (int i = 0; i < nVars; i++) {
      vRegs[i] = fi.usedRegs + i;
    }

    if (nExps >= nVars) {
      for (int i = 0; i < exps.length; i++) {
        Exp exp = exps[i];
        int a = fi.allocReg();
        if (i >= nVars && i == nExps-1 && ExpHelper.isVarargOrFuncCall(exp)) {
          ExpProcessor.processExp(fi, exp, a, 0);
        } else {
          ExpProcessor.processExp(fi, exp, a, 1);
        }
      }
    } else { // nVars > nExps
      bool multRet = false;
      for (int i = 0; i < exps.length; i++) {
        Exp exp = exps[i];
        int a = fi.allocReg();
        if (i == nExps-1 && ExpHelper.isVarargOrFuncCall(exp)) {
          multRet = true;
          int n = nVars - nExps + 1;
          ExpProcessor.processExp(fi, exp, a, n);
          fi.allocRegs(n - 1);
        } else {
          ExpProcessor.processExp(fi, exp, a, 1);
        }
      }
      if (!multRet) {
        int n = nVars - nExps;
        int a = fi.allocRegs(n);
        fi.emitLoadNil(node.lastLine, a, n);
      }
    }

    int lastLine = node.lastLine;
    for (int i = 0; i < node.varList.length; i++) {
      Exp exp = node.varList[i];
      if (! (exp is NameExp)) {
        fi.emitSetTable(lastLine, tRegs[i], kRegs[i], vRegs[i]);
        continue;
      }

      NameExp nameExp = exp as NameExp;
      String varName = nameExp.name;
      int a = fi.slotOfLocVar(varName);
      if (a >= 0) {
        fi.emitMove(lastLine, a, vRegs[i]);
        continue;
      }

      int b = fi.indexOfUpval(varName);
      if (b >= 0) {
        fi.emitSetUpval(lastLine, vRegs[i], b);
        continue;
      }

      a = fi.slotOfLocVar("_ENV");
      if (a >= 0) {
        if (kRegs[i] < 0) {
          b = 0x100 + fi.indexOfConstant(varName);
          fi.emitSetTable(lastLine, a, b, vRegs[i]);
        } else {
          fi.emitSetTable(lastLine, a, kRegs[i], vRegs[i]);
        }
        continue;
      }

      // global var
      a = fi.indexOfUpval("_ENV");
      if (kRegs[i] < 0) {
        b = 0x100 + fi.indexOfConstant(varName);
        fi.emitSetTabUp(lastLine, a, b, vRegs[i]);
      } else {
        fi.emitSetTabUp(lastLine, a, kRegs[i], vRegs[i]);
      }
    }

    // todo
    fi.usedRegs = oldRegs;
  }

}
