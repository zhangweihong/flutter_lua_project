import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterIconData {
  static const List<String> _members = [
    "ac_unit",
    "arrow_back",
    "arrow_downward",
    "arrow_forward",
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("Icons");
  }

  static IconData get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return null;
    }
    switch (idx) {
      case 0:
        return Icons.ac_unit;
      case 1:
        return Icons.arrow_back;
      case 2:
        return Icons.arrow_downward;
      case 3:
        return Icons.arrow_forward;
      default:
        return null;
    }
  }
}
