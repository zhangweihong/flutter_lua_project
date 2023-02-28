import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:lua_dardo/lua.dart';

class FlutterAlignmentDirectional {
  static const List<String> _members = [
    "topStart",
    "topCenter",
    "topEnd",
    "centerStart",
    "center",
    "centerEnd",
    "bottomStart",
    "bottomCenter",
    "bottomEnd"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }
    ls.setFuncs(_AlignmentDirectionalMembers, 0);
    ls.setGlobal("AlignmentDirectional");
  }

  static const Map<String, DartFunction> _AlignmentDirectionalMembers = {
    "new": _newAlignmentDirectional
  };

  static int _newAlignmentDirectional(LuaState ls) {
    var fieldType = ls.getField(-1, "x");
    var x;
    if (fieldType == LuaType.luaNumber) {
      x = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "AlignmentDirectional",
          type: "",
          expected: "AlignmentDirectional x is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y");
    var y;
    if (fieldType == LuaType.luaNumber) {
      y = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "AlignmentDirectional",
          type: "",
          expected: "AlignmentDirectional y is null",
          source: "");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<AlignmentDirectional>();
    userdata.data = AlignmentDirectional(x, y);
    return 1;
  }

  static AlignmentDirectional get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return AlignmentDirectional.topStart;
    }
    switch (idx) {
      case 0:
        return AlignmentDirectional.topStart;
      case 1:
        return AlignmentDirectional.topCenter;
      case 2:
        return AlignmentDirectional.topEnd;
      case 3:
        return AlignmentDirectional.centerStart;
      case 4:
        return AlignmentDirectional.center;
      case 5:
        return AlignmentDirectional.centerEnd;
      case 6:
        return AlignmentDirectional.bottomStart;
      case 7:
        return AlignmentDirectional.bottomCenter;
      case 8:
        return AlignmentDirectional.bottomEnd;
    }
    return AlignmentDirectional.topStart;
  }
}
