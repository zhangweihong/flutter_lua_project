import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterFontStyle {
  static const List<String> _members = ["normal", "italic"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("FontStyle");
  }

  static FontStyle get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return FontStyle.normal;
    }
    return FontStyle.values[idx];
  }
}
