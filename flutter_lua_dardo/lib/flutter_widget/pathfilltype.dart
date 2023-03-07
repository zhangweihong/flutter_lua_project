import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterPathFillType {
  static const List<String> _members = ["nonZero", "evenOdd"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("PathFillType");
  }

  static int indexOf(PathFillType pf) {
    switch (pf) {
      case PathFillType.nonZero:
        return 0;
      case PathFillType.evenOdd:
        return 1;
      default:
        return 0;
    }
  }

  static PathFillType get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return PathFillType.nonZero;
    }
    return PathFillType.values[idx];
  }
}
