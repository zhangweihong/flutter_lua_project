import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterDatePickerMode {
  static const List<String> _members = ["day", "year"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("DatePickerMode");
  }

  static DatePickerMode get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return DatePickerMode.day;
    }
    return DatePickerMode.values[idx];
  }
}
