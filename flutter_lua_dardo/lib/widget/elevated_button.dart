import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class FlutterElevatedButton {
  static Map<String, DartFunction> _ElevatedBtnWrap = {
    "new": _newElevatedButton
  };

  static int _newElevatedButton(LuaState ls) {
    Widget child;

    var fieldType = ls.getField(-1, "child");
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    } else {
      throw ParameterError(
          name: "FlutterElevatedButton Child Is Null",
          type: "FlutterElevatedButton Error",
          expected: "",
          source: "");
    }
    ls.pop(1);

    int pressId = -1;
    fieldType = ls.getField(-1, "onPressed");
    if (fieldType == LuaType.luaFunction) {
      pressId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "FlutterElevatedButton onPressed Is Null",
          type: "FlutterElevatedButton Error",
          expected: "",
          source: "");
    }

    int long_pressId = -1;
    fieldType = ls.getField(-1, "onLongPress");
    if (fieldType == LuaType.luaFunction) {
      long_pressId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<ElevatedButton>();
    userdata.data = ElevatedButton(
      onLongPress: () {
        if (long_pressId != -1) {
          ls.rawGetI(lua_registryindex, long_pressId);
          ls.pCall(0, 0, 1);
        }
      },
      onPressed: () {
        if (pressId != -1) {
          ls.rawGetI(lua_registryindex, pressId);
          ls.pCall(0, 0, 1);
        }
      },
      child: child,
    );

    return 1;
  }

  static int _openElevatedButtonLib(LuaState ls) {
    ls.newLib(_ElevatedBtnWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("ElevatedButton", _openElevatedButtonLib, true);
    ls.pop(1);
  }
}
