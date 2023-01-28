import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterShadow {
  static const Map<String, DartFunction> _ShadowWrap = {"new": _newShadow};

  static const Map<String, DartFunction> _ShadowMembers = {"id": null};

  static int _newShadow(LuaState ls) {
    Color color = Color(0xFF000000);
    Offset offset = Offset.zero;
    double blurRadius = 0;
    var fieldType = ls.getField(-1, "color");
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1) as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "offset");
    if (fieldType == LuaType.luaUserdata) {
      offset = ls.toUserdata(-1) as Offset;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "blurRadius");
    if (fieldType == LuaType.luaNumber) {
      blurRadius = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<Shadow>();
    userdata.data =
        Shadow(color: color, offset: offset, blurRadius: blurRadius);
    return 1;
  }

  static int _openShadowLib(LuaState ls) {
    ls.newMetatable("ShadowClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ShadowMembers, 0);

    ls.newLib(_ShadowWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Shadow", _openShadowLib, true);
    ls.pop(1);
  }
}
