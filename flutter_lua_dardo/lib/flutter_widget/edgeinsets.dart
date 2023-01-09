import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:lua_dardo/lua.dart';

class FlutterEdgeInsets {
  static const Map<String, DartFunction> _EdgeInsetsWrap = {
    "only": _edgeInsetOnly,
    "all": _edgeInsetAll
  };

  static int _openEdgeInsetsLib(LuaState ls) {
    ls.newLib(_EdgeInsetsWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("EdgeInsets", _openEdgeInsetsLib, true);
    ls.pop(1);
  }

  static int _edgeInsetOnly(LuaState ls) {
    double top = 0.0, left = 0.0, bottom = 0.0, right = 0.0;
    var fieldType = ls.getField(-1, "top");
    if (fieldType == LuaType.luaNumber) {
      top = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "left");
    if (fieldType == LuaType.luaNumber) {
      left = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "bottom");
    if (fieldType == LuaType.luaNumber) {
      bottom = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "right");
    if (fieldType == LuaType.luaNumber) {
      right = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<EdgeInsets>();
    userdata.data =
        EdgeInsets.only(top: top, left: left, bottom: bottom, right: right);

    return 1;
  }

  static int _edgeInsetAll(LuaState ls) {
    double value = 0;
    var isNum = ls.isNumber(-1);
    if (isNum) {
      value = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'EdgeInsets Value',
          type: "Number ",
          expected: "EdgeInsets All Error",
          source: "FlutterEdgeInsets ");
    }

    Userdata userdata = ls.newUserdata<EdgeInsets>();
    userdata.data = EdgeInsets.all(value);
    return 1;
  }
}
