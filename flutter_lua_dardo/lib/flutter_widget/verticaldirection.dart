import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterVerticalDirection {
  static const List<String> _members = ["up", "down"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("VerticalDirection");
  }

  static VerticalDirection get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return VerticalDirection.down;
    }
    return VerticalDirection.values[idx];
  }
}
