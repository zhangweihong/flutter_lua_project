import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterListTileControlAffinity {
  static const List<String> _members = ["leading", "trailing", "platform"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("ListTileControlAffinity");
  }

  static ListTileControlAffinity get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return ListTileControlAffinity.leading;
    }
    return ListTileControlAffinity.values[idx];
  }
}
