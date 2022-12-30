import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterBoxFit {
  static const List<String> _members = [
    "fill",
    "contain",
    "cover",
    "fitWidth",
    "fitHeight",
    "none",
    "scaleDown",
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("BoxFit");
  }

  static BoxFit get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return BoxFit.fill;
    }
    return BoxFit.values[idx];
  }
}
