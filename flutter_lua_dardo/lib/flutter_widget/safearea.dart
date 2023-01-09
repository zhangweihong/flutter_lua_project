import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterSafeArea {
  static const Map<String, DartFunction> _safeAreaWrap = {"new": _newSafeArea};

  static const Map<String, DartFunction> _SafeAreaMembers = {"id": null};

  static int _newSafeArea(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "child");
      Widget child = null;
      if (fieldType == LuaType.luaUserdata) {
        child = ls.toUserdata(-1).data as Widget;
        ls.pop(1);
      } else {
        ls.pop(1);
        new ParameterError(
            name: "FlutterSafeArea",
            type: "",
            expected: "FlutterScaffold child is null",
            source: "FlutterSafeArea");
      }

      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "minimum");
      EdgeInsets minimum = EdgeInsets.zero;
      if (fieldType == LuaType.luaUserdata) {
        minimum = ls.toUserdata(-1) as EdgeInsets;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "maintainBottomViewPadding");
      bool maintainBottomViewPadding = false;
      if (fieldType == LuaType.luaBoolean) {
        maintainBottomViewPadding = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "left");
      bool left = true;
      if (fieldType == LuaType.luaBoolean) {
        left = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "right");
      bool right = true;
      if (fieldType == LuaType.luaBoolean) {
        right = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "top");
      bool top = true;
      if (fieldType == LuaType.luaBoolean) {
        top = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "bottom");
      bool bottom = true;
      if (fieldType == LuaType.luaBoolean) {
        bottom = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<SafeArea>();
      userdata.data = SafeArea(
          child: child,
          key: key,
          minimum: minimum,
          left: left,
          right: right,
          top: top,
          bottom: bottom,
          maintainBottomViewPadding: maintainBottomViewPadding);
    }
    return 1;
  }

  static int _openScaffoldLib(LuaState ls) {
    ls.newMetatable("SafeAreaClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_SafeAreaMembers, 0);
    ls.newLib(_safeAreaWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("SafeArea", _openScaffoldLib, true);
    ls.pop(1);
  }
}
