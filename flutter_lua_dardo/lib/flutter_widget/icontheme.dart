import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterIconThemeData {
  static const Map<String, DartFunction> _IconThemeDataWrap = {
    "new": _newIconThemeData
  };

  static const Map<String, DartFunction> _IconThemeDataMembers = {"id": null};

  static int _newIconThemeData(LuaState ls) {
    Color color = Color(0xFF000000);
    double opacity = 1.0;
    double size = 24.0;
    var shadows = null;

    var fieldType = ls.getField(-1, "color");
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1) as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "opacity");
    if (fieldType == LuaType.luaNumber) {
      opacity = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "size");
    if (fieldType == LuaType.luaNumber) {
      size = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "shadows");
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      shadows = List<Shadow>.empty(growable: true);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          shadows.add(ls.toUserdata(-1).data as Shadow);
        }
        ls.pop(1);
      }
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<IconThemeData>();
    userdata.data = IconThemeData(
        color: color, opacity: opacity, size: size, shadows: shadows);
    return 1;
  }

  static int _openIconThemeDataLib(LuaState ls) {
    ls.newMetatable("IconThemeDataClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_IconThemeDataMembers, 0);

    ls.newLib(_IconThemeDataWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("IconThemeData", _openIconThemeDataLib, true);
    ls.pop(1);
  }
}
