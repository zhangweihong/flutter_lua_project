import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterDatePickerEntryMode {
  static const List<String> _members = [
    "calendar",
    "input",
    "calendarOnly",
    "inputOnly"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("DatePickerEntryMode");
  }

  static DatePickerEntryMode get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return DatePickerEntryMode.calendar;
    }
    return DatePickerEntryMode.values[idx];
  }
}
