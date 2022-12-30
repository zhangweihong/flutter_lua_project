import 'package:flutter/material.dart';
import 'package:lua_dardo/lua.dart';

class FlutterColors {
  static void require(LuaState ls) {
    ls.register("Color", _colorsWrap);
  }

  static int _colorsWrap(LuaState ls) {
    String s = ls.checkString(1);
    int color = 0xffffffff;
    if (s.isNotEmpty) {
      if (s.indexOf("#") == 0) {
        s = s.replaceAll("#", "");
        if (s.length < 9) {
          int endLen = 8 - s.length;
          for (var i = 0; i < endLen; i++) {
            s = "f" + s;
          }
        }

        s = "0x" + s;
        color = int.tryParse(s);
      } else {
        throw Exception("Color is Error No #");
      }

      Userdata userdata = ls.newUserdata<Color>();
      userdata.data = Color(color);
    }
    return 1;
  }
}
