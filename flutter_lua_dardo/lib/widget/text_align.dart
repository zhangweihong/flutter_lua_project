import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterTextAlign {
  static const List<String> _members = [
    "left",
    "right",
    "center",
    "justify",
    "fitHeight",
    "start",
    "end",
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("TextAlign");
  }

  static TextAlign get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return TextAlign.left;
    }
    return TextAlign.values[idx];
  }
}
