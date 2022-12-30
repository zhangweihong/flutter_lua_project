import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterBorder {
  static const Map<String, DartFunction> _BorderWrap = {
    "new": _borderNew,
    "all": _borderAll
  };

  static int _openBorderLib(LuaState ls) {
    ls.newLib(_BorderWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Border", _openBorderLib, true);
    ls.pop(1);
  }

  static BorderSide getBorderSide(LuaState ls) {
    double width = 1;
    Color color = const Color(0xFF000000);
    var fieldType = ls.getField(-1, "width");
    if (fieldType == LuaType.luaNumber) {
      width = ls.toNumberX(-1);
    }
    ls.pop(1);
    fieldType = ls.getField(-1, "color");
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);
    return BorderSide(style: BorderStyle.solid, width: width, color: color);
  }

  static int _borderNew(LuaState ls) {
    BorderSide top_side = BorderSide.none;
    var fieldType = ls.getField(-1, "top");
    if (fieldType == LuaType.luaTable) {
      top_side = getBorderSide(ls);
    }
    ls.pop(1);
    BorderSide bottom_side = BorderSide.none;
    fieldType = ls.getField(-1, "bottom");
    if (fieldType == LuaType.luaTable) {
      bottom_side = getBorderSide(ls);
    }
    ls.pop(1);
    BorderSide left_side = BorderSide.none;
    fieldType = ls.getField(-1, "left");
    if (fieldType == LuaType.luaTable) {
      left_side = getBorderSide(ls);
    }
    ls.pop(1);
    BorderSide right_side = BorderSide.none;
    fieldType = ls.getField(-1, "right");
    if (fieldType == LuaType.luaTable) {
      right_side = getBorderSide(ls);
    }
    ls.pop(1);
    Userdata userdata = ls.newUserdata<Border>();
    userdata.data = Border(
        top: top_side, bottom: bottom_side, left: left_side, right: right_side);
    return 1;
  }

  static int _borderAll(LuaState ls) {
    double width = 1;
    Color color = const Color(0xFF000000);
    var fieldType = ls.getField(-1, "width");
    if (fieldType == LuaType.luaNumber) {
      width = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "color");
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Border>();
    userdata.data =
        Border.all(style: BorderStyle.solid, width: width, color: color);
    return 1;
  }
}
