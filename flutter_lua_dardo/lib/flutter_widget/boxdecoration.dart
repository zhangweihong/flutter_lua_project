import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterBoxDecoration {
  static Map<String, DartFunction> _boxDecorationWrap = {
    "new": _newBoxDecoration
  };

  static int _newBoxDecoration(LuaState ls) {
    Color bgColor = Colors.white;
    var fieldType = ls.getField(-1, "color");
    if (fieldType == LuaType.luaUserdata) {
      bgColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "borderRadius");
    var radius = BorderRadius.zero;
    if (fieldType == LuaType.luaUserdata) {
      radius = ls.toUserdata(-1).data as BorderRadius;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "border");
    Border border;
    if (fieldType == LuaType.luaUserdata) {
      border = ls.toUserdata(-1).data as Border;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "image");
    DecorationImage dImg;
    if (fieldType == LuaType.luaUserdata) {
      dImg = ls.toUserdata(-1).data as DecorationImage;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<BoxDecoration>();
    userdata.data = BoxDecoration(
        color: bgColor, borderRadius: radius, border: border, image: dImg);
    return 1;
  }

  static int _openBoxDecorationLib(LuaState ls) {
    ls.newLib(_boxDecorationWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("BoxDecoration", _openBoxDecorationLib, true);
    ls.pop(1);
  }
}
