import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterDragStartBehavior {
  static const List<String> _members = ["down", "start"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("DragStartBehavior");
  }

  static DragStartBehavior get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return DragStartBehavior.start;
    }
    return DragStartBehavior.values[idx];
  }
}
