import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterAlignment {
  static const List<String> _members = [
    "topLeft",
    "topCenter",
    "topRight",
    "centerLeft",
    "center",
    "centerRight",
    "bottomLeft",
    "bottomCenter",
    "bottomRight"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("Alignment");
  }

  static AlignmentGeometry get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return Alignment.topLeft;
    }
    switch (idx) {
      case 0:
        return Alignment.topLeft;
      case 1:
        return Alignment.topCenter;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.centerLeft;
      case 4:
        return Alignment.center;
      case 5:
        return Alignment.centerRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
    }
    return Alignment.topLeft;
  }
}
