import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class FlutterClipRRect {
  static const Map<String, DartFunction> _ClipRRectWrap = {
    "new": _newClipRRectWrap,
  };

  static const Map<String, DartFunction> _ClipRRectMembers = {"id": null};

  static int _newClipRRectWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterContainer child',
          type: ls.typeName(fieldType),
          expected: "Container child",
          source: "FlutterContainer child not Widget");
    }

    fieldType = ls.getField(-1, "borderRadius");
    var radius = BorderRadius.zero;
    if (fieldType == LuaType.luaUserdata) {
      radius = ls.toUserdata(-1).data as BorderRadius;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = ClipRRect(
      borderRadius: radius,
      child: child,
    );

    return 1;
  }

  static int _openClipRRectLib(LuaState ls) {
    ls.newMetatable("ClipRRectClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ClipRRectMembers, 0);

    ls.newLib(_ClipRRectWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("ClipRRect", _openClipRRectLib, true);
    ls.pop(1);
  }
}
