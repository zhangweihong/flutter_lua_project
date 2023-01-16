import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterTextWidthBasis {
  static const List<String> _members = ["parent", "longestLine"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("TextWidthBasis");
  }

  static TextWidthBasis get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return TextWidthBasis.parent;
    }
    return TextWidthBasis.values[idx];
  }
}
