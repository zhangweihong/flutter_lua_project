import 'package:flutter/widgets.dart';
import 'package:flutter_lua_dardo/common/async_fun.dart';
import 'package:flutter_lua_dardo/common/file.dart';
import 'package:flutter_lua_dardo/common/helper.dart';
import 'package:flutter_lua_dardo/common/nav.dart';
import 'package:lua_dardo/lua.dart';

class FlutterUtils {
  static void open(LuaState ls) {
    ls.register("print", _printWrap);
    ls.register("debugPrint", _debugPrintWrap);
    ls.register("asyncFun", AsyncFun.asyncFun);
    ls.register("delayFun", AsyncFun.delayFun);
    ls.register("readFile", OpFile.readFile);
    ls.register("saveFile", OpFile.saveFile);
    ls.register("deleteFile", OpFile.deleteFile);
    ls.register("existsFile", OpFile.existsFile);
    ls.register("navPush", Nav.navPush);
    ls.register("navReplace", Nav.navReplace);
    ls.register("navPop", Nav.navPop);
    ls.register("GlobalKey", _globalKey);
    ls.register("navReplaceAndRemoveAll", Nav.navReplaceAndRemoveAll);
    FlutterHelper.require(ls);
  }

  static int _globalKey(LuaState ls) {
    var debugLabel;

    var filedType = ls.getField(-1, "debugLabel");
    if (filedType == LuaType.luaString) {
      debugLabel = ls.toStr(-1);
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<GlobalKey>();
    userdata.data = GlobalKey(debugLabel: debugLabel);
    return 1;
  }

  static int _debugPrintWrap(LuaState ls) {
    try {
      var str = '';
      int i = 0;
      while (ls.getTop() > 0) {
        var s = ls.toStr2(-1);
        if (i == 0) {
          str = s + str;
        } else {
          str = s + "    " + str;
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
          str = s + str;
        } else {
          str = s + "    " + str;
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
