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
    ls.register("saveFile", OpFile.saveFile);
  }

  static int _debugPrintWrap(LuaState ls) {
    try {
      var str = '';
      int i = 0;
      while (ls.getTop() > 0) {
        var s = ls.toStr2(-1);
        if (i == 0) {
          str = str + s;
        } else {
          str = str + "    " + s;
        }
        i++;
        ls.pop(1);
      }
      debugPrint(str);
    } catch (e) {
      throw e;
    }
    return 0;
  }

  static int _printWrap(LuaState ls) {
    try {
      var str = '';
      int i = 0;
      while (ls.getTop() > 0) {
        var s = ls.toStr2(-1);
        if (i == 0) {
          str = str + s;
        } else {
          str = str + "    " + s;
        }
        i++;
        ls.pop(1);
      }
      print(str);
    } catch (e) {
      throw e;
    }

    return 0;
  }
}
