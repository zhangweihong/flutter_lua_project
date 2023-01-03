import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterStackFit {
  static const List<String> _members = ["loose", "expand", "passthrough"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("StackFit");
  }

  static StackFit get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return StackFit.loose;
    }
    switch (idx) {
      case 0:
        return StackFit.loose;
      case 1:
        return StackFit.expand;
      case 2:
        return StackFit.passthrough;
    }
    return StackFit.loose;
  }
}
