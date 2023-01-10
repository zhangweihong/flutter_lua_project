import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/animation/curves.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterCurvedAnimation {
  static void require(LuaState ls) {
    ls.register("CurvedAnimation", _AnimationWrap);
  }

  static int _AnimationWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var parent;
      var fieldType = ls.getField(-1, "parent");
      if (fieldType == LuaType.luaUserdata) {
        parent = ls.toUserdata(-1).data as Animation<double>;
      } else {
        throw ParameterError(
            name: "FlutterCurvedAnimation",
            type: "",
            expected: "FlutterCurvedAnimation parent is null",
            source: "FlutterCurvedAnimation");
      }
      ls.pop(1);

      var curve;
      fieldType = ls.getField(-1, "curve");
      if (fieldType == LuaType.luaNumber) {
        curve = FlutterCurves.get(ls.toIntegerX(-1));
      } else {
        throw ParameterError(
            name: "FlutterCurvedAnimation",
            type: "",
            expected: "FlutterCurvedAnimation curve is null",
            source: "FlutterCurvedAnimation");
      }
      ls.pop(1);

      var reverseCurve;
      fieldType = ls.getField(-1, "reverseCurve");
      if (fieldType == LuaType.luaNumber) {
        reverseCurve = FlutterCurves.get(ls.toIntegerX(-1));
      }
      ls.pop(1);

      var c = CurvedAnimation(
          parent: parent, curve: curve, reverseCurve: reverseCurve);
      ls.newUserdata<CurvedAnimation>().data = c;
    }

    return 1;
  }
}
