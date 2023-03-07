import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterAnimationStatus {
  static const List<String> _members = [
    "dismissed",
    "forward",
    "reverse",
    "completed"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("AnimationStatus");
  }

  static AnimationStatus get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return AnimationStatus.forward;
    }
    return AnimationStatus.values[idx];
  }
}
