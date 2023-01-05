import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class FlutterIconButton {
  static Map<String, DartFunction> _iconButtonWrap = {"new": _newIconButton};

  static int _newIconButton(LuaState ls) {
    Icon icon;

    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "icon");
      if (fieldType == LuaType.luaUserdata) {
        icon = ls.toUserdata(-1).data as Icon;
      } else {
        throw ParameterError(
            name: "FlutterIconButton Icon Null",
            type: "Icon Is Null",
            expected: "icon not find",
            source: "");
      }
      ls.pop(1);
      double iconSize = 24;
      fieldType = ls.getField(-1, "iconSize");
      if (fieldType == LuaType.luaNumber) {
        iconSize = ls.toNumber(-1);
      }
      ls.pop(1);
      int pressId = -1;
      fieldType = ls.getField(-1, "onPressed");
      if (fieldType == LuaType.luaFunction) {
        pressId = ls.ref(lua_registryindex);
      } else {
        throw ParameterError(
            name: "FlutterIconButton onPressed Null",
            type: "onPressed Is Null",
            expected: "onPressed not find",
            source: "");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<IconButton>();
      userdata.data = IconButton(
          key: key,
          iconSize: iconSize,
          onPressed: pressId != -1
              ? () {
                  ls.rawGetI(lua_registryindex, pressId);
                  ls.pCall(0, 0, 1);
                }
              : null,
          icon: icon);
    }

    return 1;
  }

  static int _openIconButtonLib(LuaState ls) {
    ls.newLib(_iconButtonWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("IconButton", _openIconButtonLib, true);
    ls.pop(1);
  }
}
