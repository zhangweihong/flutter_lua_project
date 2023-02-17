import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterBorderRadius {
  static const Map<String, DartFunction> _BorderRadiusWrap = {
    "only": _borderRadiusOnly,
    "all": _borderRadiusAll
  };

  static int _openBorderRadiusLib(LuaState ls) {
    ls.newLib(_BorderRadiusWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("BorderRadius", _openBorderRadiusLib, true);
    ls.pop(1);
  }

  static int _borderRadiusOnly(LuaState ls) {
    double tl = 0;
    double tr = 0;
    double bl = 0;
    double br = 0;
    var fieldType = ls.getField(-1, "topLeft");
    if (fieldType == LuaType.luaNumber) {
      tl = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "topRight");
    if (fieldType == LuaType.luaNumber) {
      tr = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "bottomLeft");
    if (fieldType == LuaType.luaNumber) {
      bl = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "bottomRight");
    if (fieldType == LuaType.luaNumber) {
      br = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<BorderRadius>();
    userdata.data = BorderRadius.only(
        topLeft: Radius.circular(tl),
        topRight: Radius.circular(tr),
        bottomLeft: Radius.circular(bl),
        bottomRight: Radius.circular(br));

    return 1;
  }

  static int _borderRadiusAll(LuaState ls) {
    double value = 0;
    bool isNum = ls.isNumber(-1);
    if (isNum) {
      value = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    Userdata userdata = ls.newUserdata<BorderRadius>();
    userdata.data = BorderRadius.all(Radius.circular(value));
    return 1;
  }
}
