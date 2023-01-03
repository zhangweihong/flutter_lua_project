import 'package:flutter/widgets.dart';
import 'package:flutter_lua_dardo/common/async_fun.dart';
import 'package:flutter_lua_dardo/common/file.dart';
import 'package:lua_dardo/lua.dart';

class FlutterUtils {
  static void open(LuaState ls) {
    ls.register("print", _printWrap);
    ls.register("debugPrint", _debugPrintWrap);
    ls.register("asyncFun", AsyncFun.asyncFun);
    ls.register("delayFun", AsyncFun.delayFun);
    ls.register("readFile", OpFile.readFile);
  }

  static int _debugPrintWrap(LuaState ls) {
    String s = ls.checkString(1);
    debugPrint(s);
    return 0;
  }

  static int _printWrap(LuaState ls) {
    try {
      if (ls.isTable(-1)) {
        var len = ls.len2(-1);
        var str = '';
        for (int i = 1; i <= len; i++) {
          if (ls.rawGetI(-1, i) != LuaType.luaNone) {
            String s = ls.toStr(-1);
            if (i == 1) {
              str = "arg$i.(" + str + s + ")";
            } else {
              str = str + "      arg$i.(" + s + ")";
            }
          }
          ls.pop(1);
        }
        print(str);
      } else {
        ls.checkAny(-1);
        String s = ls.toString2(-1);
        print(s);
      }
    } catch (e) {
      throw e;
    }

    return 0;
  }
}
