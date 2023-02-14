import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FLutterBottomNavigationBarItem {
  static const Map<String, DartFunction> _BottomNavigationBarItemWrap = {
    "new": _newBottomNavigationBarItem
  };

  static const Map<String, DartFunction> _BottomNavigationBarItemMembers = {
    "id": null
  };

  static int _newBottomNavigationBarItem(LuaState ls) {
    var fieldType = ls.getField(-1, "icon");
    var icon = null;
    if (fieldType == LuaType.luaUserdata) {
      icon = ls.toUserdata(-1).data as Widget;
    } else {
      throw ParameterError(
          name: "FLutterBottomNavigationBarItem",
          type: "",
          expected: "FLutterBottomNavigationBarItem icon erro",
          source: "");
    }
    ls.pop(1);

    var label = null;
    fieldType = ls.getField(-1, "label");
    if (fieldType == LuaType.luaString) {
      label = ls.toStr(-1);
    }
    ls.pop(1);

    var backgroundColor = null;
    fieldType = ls.getField(-1, "backgroundColor");
    if (fieldType == LuaType.luaUserdata) {
      backgroundColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    var tooltip = null;
    fieldType = ls.getField(-1, "tooltip");
    if (fieldType == LuaType.luaString) {
      tooltip = ls.toStr(-1);
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<BottomNavigationBarItem>();
    userdata.data = BottomNavigationBarItem(
        icon: icon,
        label: label,
        backgroundColor: backgroundColor,
        tooltip: tooltip);
    return 1;
  }

  static int _openNavigationBarItemLib(LuaState ls) {
    ls.newMetatable("NavigationBarItemClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_BottomNavigationBarItemMembers, 0);

    ls.newLib(_BottomNavigationBarItemWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("BottomNavigationBarItem", _openNavigationBarItemLib, true);
    ls.pop(1);
  }
}
