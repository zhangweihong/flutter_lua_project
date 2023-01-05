import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterClip {
  static const List<String> _members = [
    "none",
    "hardEdge",
    "antiAlias",
    "antiAliasWithSaveLayer"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("Clip");
  }

  static Clip get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return Clip.none;
    }
    return Clip.values[idx];
  }
}
