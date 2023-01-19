import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
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
    ls.setFuncs(_alignmentMembers, 0);
    ls.setGlobal("Alignment");
  }

  static const Map<String, DartFunction> _alignmentMembers = {
    "new": _newAlignment
  };

  static int _newAlignment(LuaState ls) {
    var fieldType = ls.getField(-1, "x");
    var x;
    if (fieldType == LuaType.luaNumber) {
      x = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "Alignment",
          type: "",
          expected: "Alignment x is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y");
    var y;
    if (fieldType == LuaType.luaNumber) {
      y = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "Alignment",
          type: "",
          expected: "Alignment y is null",
          source: "");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Alignment>();
    userdata.data = Alignment(x, y);
    return 1;
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
