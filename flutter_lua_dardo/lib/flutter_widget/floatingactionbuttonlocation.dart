import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterFloatingActionButtonLocation {
  static const List<String> _members = [
    "startTop",
    "miniStartTop",
    "centerTop",
    "miniCenterTop",
    "endTop",
    "miniEndTop",
    "startFloat",
    "miniStartFloat",
    "centerFloat",
    "miniCenterFloat",
    "endFloat",
    "miniEndFloat",
    "startDocked",
    "miniStartDocked",
    "centerDocked",
    "miniCenterDocked",
    "endDocked",
    "miniEndDocked",
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("FloatingActionButtonLocation");
  }

  static FloatingActionButtonLocation get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return null;
    }
    switch (idx) {
      case 0:
        return FloatingActionButtonLocation.startTop;
      case 1:
        return FloatingActionButtonLocation.miniStartTop;
      case 2:
        return FloatingActionButtonLocation.centerTop;
      case 3:
        return FloatingActionButtonLocation.miniCenterTop;
      case 4:
        return FloatingActionButtonLocation.endTop;
      case 5:
        return FloatingActionButtonLocation.miniEndTop;
      case 6:
        return FloatingActionButtonLocation.startFloat;
      case 7:
        return FloatingActionButtonLocation.miniStartFloat;
      case 8:
        return FloatingActionButtonLocation.centerFloat;
      case 9:
        return FloatingActionButtonLocation.miniCenterFloat;
      case 10:
        return FloatingActionButtonLocation.endFloat;
      case 11:
        return FloatingActionButtonLocation.miniEndFloat;
      case 12:
        return FloatingActionButtonLocation.startDocked;
      case 13:
        return FloatingActionButtonLocation.miniStartDocked;
      case 14:
        return FloatingActionButtonLocation.centerDocked;
      case 15:
        return FloatingActionButtonLocation.miniCenterDocked;
      case 16:
        return FloatingActionButtonLocation.endDocked;
      case 17:
        return FloatingActionButtonLocation.miniEndDocked;
      default:
        return null;
    }
  }
}
