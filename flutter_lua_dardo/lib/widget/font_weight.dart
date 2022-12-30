import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterFontWeight {
  static const List<String> _members = [
    "w100",
    "w200",
    "w300",
    "w400",
    "w500",
    "w600",
    "w700",
    "w800",
    "w900",
    "normal",
    "bold"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("FontWeight");
  }

  static FontWeight get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return FontWeight.normal;
    }
    if (idx == _members.length - 2) {
      idx = 3;
    }
    if (idx == _members.length - 1) {
      idx = 6;
    }
    return FontWeight.values[idx];
  }
}
