import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterMainAxisAlign {
  static const List<String> _members = [
    "start",
    "bottom",
    "center",
    "spaceBetween",
    "spaceAround",
    "spaceEvenly"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("MainAxisAlignment");
  }

  static MainAxisAlignment get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return MainAxisAlignment.start;
    }
    return MainAxisAlignment.values[idx];
  }
}
