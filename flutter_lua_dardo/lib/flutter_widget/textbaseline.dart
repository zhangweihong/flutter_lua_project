import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterTextBaseline {
  static const List<String> _members = ["alphabetic", "ideographic"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("TextBaseline");
  }

  static TextBaseline get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return TextBaseline.alphabetic;
    }
    return TextBaseline.values[idx];
  }
}
