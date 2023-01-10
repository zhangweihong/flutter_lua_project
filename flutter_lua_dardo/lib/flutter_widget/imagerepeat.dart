import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterImageRepeat {
  static const List<String> _members = [
    "repeat",
    "repeatX",
    "repeatY",
    "noRepeat"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("ImageRepeat");
  }

  static ImageRepeat get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return ImageRepeat.noRepeat;
    }
    return ImageRepeat.values[idx];
  }
}
