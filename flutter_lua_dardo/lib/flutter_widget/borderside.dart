import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/borderstyle.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterBorderSide {
  static int _openBorderSideLib(LuaState ls) {
    ls.newMetatable("BorderSideClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_BorderSideMembers, 0);

    ls.newLib(_BorderSideWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("BorderSide", _openBorderSideLib, true);
    ls.pop(1);
  }

  static const Map<String, DartFunction> _BorderSideWrap = {
    "new": _newBorderSide,
  };

  static const Map<String, DartFunction> _BorderSideMembers = {"id": null};

  static int _newBorderSide(LuaState ls) {
    if (ls.getTop() > 1) {
      var fieldType = ls.getField(-1, "color");
      var color = Color(0xFF000000);
      if (fieldType == LuaType.luaUserdata) {
        color = ls.toUserdata(-1).data as Color;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "width");
      var width = 1.0;
      if (fieldType == LuaType.luaNumber) {
        width = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "style");
      var style;
      if (fieldType == LuaType.luaNumber) {
        style = FlutterBorderStyle.get(ls.toIntegerX(-1));
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<BorderSide>();
      userdata.data = BorderSide(color: color, width: width, style: style);
    }

    return 1;
  }
}
