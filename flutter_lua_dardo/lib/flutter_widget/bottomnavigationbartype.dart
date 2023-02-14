import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterBottomNavigationBarType {
  static const List<String> _members = ["fixed", "shifting"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("BottomNavigationBarType");
  }

  static BottomNavigationBarType get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return BottomNavigationBarType.fixed;
    }
    return BottomNavigationBarType.values[idx];
  }
}
