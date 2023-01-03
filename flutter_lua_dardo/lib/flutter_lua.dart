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
      ls.checkAny(1);
      String s = ls.toString2(1);
      print(s);
    } catch (e) {
      throw e;
    }

    return 0;
  }
}
