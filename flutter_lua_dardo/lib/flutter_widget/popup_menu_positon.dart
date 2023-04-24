import 'package:flutter_lua_dardo/index.dart';

import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterPopupMenuPosition {
  static const List<String> _members = [
    "over",
    "under",
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("PopupMenuPosition");
  }

  static PopupMenuPosition get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return PopupMenuPosition.over;
    }
    return PopupMenuPosition.values[idx];
  }
}
