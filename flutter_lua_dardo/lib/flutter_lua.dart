import 'package:flutter/widgets.dart';
import 'package:flutter_lua_dardo/common/async_fun.dart';
import 'package:flutter_lua_dardo/common/event_bus.dart';
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
    ls.register("Offset", _OffsetWrap);
    ls.register("FractionalOffset", _FractionalOffsetWrap);
    ls.register("Size", _SizeWrap);
    ls.register("GlobalKey", _globalKey);
    ls.register("ValueKey", _valueKey);
    ls.register("navReplaceAndRemoveAll", Nav.navReplaceAndRemoveAll);
    FlutterHelper.require(ls);
    FlutterEventBus.require(ls);
  }

  static int _OffsetWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      double dx = 0;
      double dy = 0;

      var fieldType = ls.getField(-1, "dx");
      if (fieldType == LuaType.luaNumber) {
        dx = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "dy");
      if (fieldType == LuaType.luaNumber) {
        dy = ls.toNumberX(-1);
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Offset>();
      userdata.data = Offset(dx, dy);
    }

    return 1;
  }

  static int _FractionalOffsetWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      double dx = 0;
      double dy = 0;

      var fieldType = ls.getField(-1, "dx");
      if (fieldType == LuaType.luaNumber) {
        dx = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "dy");
      if (fieldType == LuaType.luaNumber) {
        dy = ls.toNumberX(-1);
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Offset>();
      userdata.data = Offset(dx, dy);
    }
    return 1;
  }

  static int _SizeWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      double width = 0;
      double height = 0;

      var fieldType = ls.getField(-1, "width");
      if (fieldType == LuaType.luaNumber) {
        width = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "height");
      if (fieldType == LuaType.luaNumber) {
        height = ls.toNumberX(-1);
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Offset>();
      userdata.data = Size(width, height);
    }

    return 1;
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

  static int _valueKey(LuaState ls) {
    Userdata userdata = ls.newUserdata<ValueKey>();
    var value;

    var filedType = ls.getField(-1, "value");
    if (filedType == LuaType.luaString) {
      value = ls.toStr(-1);
    }
    ls.pop(1);
    userdata.data = ValueKey(value);
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
      debugPrint("Lua: $str");
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
      print("Lua：$str");
    } catch (e) {
      throw e;
    }

    return 0;
  }
}
