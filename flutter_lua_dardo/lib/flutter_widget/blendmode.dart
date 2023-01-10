import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterBlendMode {
  static const List<String> _members = [
    "clear",
    "src",
    "dst",
    "srcOver",
    "dstOver",
    "srcIn",
    "dstIn",
    "srcOut",
    "dstOut",
    "srcATop",
    "dstATop",
    "xor",
    "plus",
    "modulate",
    "screen",
    "overlay",
    "darken",
    "lighten",
    "colorDodge",
    "colorBurn",
    "hardLight",
    "softLight",
    "difference",
    "exclusion",
    "multiply",
    "hue",
    "saturation",
    "color",
    "luminosity",
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("BlendMode");
  }

  static BlendMode get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return BlendMode.clear;
    }
    return BlendMode.values[idx];
  }
}
