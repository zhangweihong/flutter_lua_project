import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterCrossAxisAlign {
  static const List<String> _members = [
    "start",
    "bottom",
    "center",
    "stretch",
    "baseline"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("CrossAxisAlignment");
  }

  static CrossAxisAlignment get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return CrossAxisAlignment.center;
    }
    return CrossAxisAlignment.values[idx];
  }
}
