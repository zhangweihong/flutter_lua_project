import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterRoundedRectangleBorder {
  static int _openRoundedRectangleBorderLib(LuaState ls) {
    ls.newMetatable("RoundedRectangleBorderClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_RoundedRectangleBorderMembers, 0);

    ls.newLib(_RoundedRectangleBorderWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("RoundedRectangleBorder", _openRoundedRectangleBorderLib, true);
    ls.pop(1);
  }

  static const Map<String, DartFunction> _RoundedRectangleBorderWrap = {
    "new": _newRoundedRectangleBorder,
  };

  static const Map<String, DartFunction> _RoundedRectangleBorderMembers = {
    "id": null
  };

  static int _newRoundedRectangleBorder(LuaState ls) {
    if (ls.getTop() > 1) {
      var fieldType = ls.getField(-1, "side");
      var side = BorderSide.none;
      if (fieldType == LuaType.luaUserdata) {
        side = ls.toUserdata(-1).data as BorderSide;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "borderRadius");
      var borderRadius = BorderRadius.zero;
      if (fieldType == LuaType.luaUserdata) {
        borderRadius = ls.toUserdata(-1).data as BorderRadius;
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<RoundedRectangleBorder>();
      userdata.data =
          RoundedRectangleBorder(side: side, borderRadius: borderRadius);
    }

    return 1;
  }
}
