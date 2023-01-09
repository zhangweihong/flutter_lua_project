import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterCenter {
  static const Map<String, DartFunction> _CenterWrap = {"new": _newContainer};

  static const Map<String, DartFunction> _CenterMembers = {"id": null};

  static int _newContainer(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    double widthFactor = null;
    fieldType = ls.getField(-1, "widthFactor");
    if (fieldType == LuaType.luaNumber) {
      widthFactor = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    double heightFactor = null;
    fieldType = ls.getField(-1, "heightFactor");
    if (fieldType == LuaType.luaNumber) {
      heightFactor = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = Center(
        key: key,
        child: child,
        widthFactor: widthFactor,
        heightFactor: heightFactor);
    return 1;
  }

  static int _openCenterLib(LuaState ls) {
    ls.newMetatable("CenterClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_CenterMembers, 0);

    ls.newLib(_CenterWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Center", _openCenterLib, true);
    ls.pop(1);
  }
}
