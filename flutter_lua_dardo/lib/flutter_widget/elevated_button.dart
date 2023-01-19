import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

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

    int hoverId = -1;
    fieldType = ls.getField(-1, "onHover");
    if (fieldType == LuaType.luaFunction) {
      hoverId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    int focusId = -1;
    fieldType = ls.getField(-1, "onFocusChange");
    if (fieldType == LuaType.luaFunction) {
      focusId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "autofocus");
    bool autofocus = false;
    if (fieldType == LuaType.luaBoolean) {
      autofocus = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "clipBehavior");
    Clip clipBehavior = Clip.none;
    if (fieldType == LuaType.luaNumber) {
      clipBehavior = FlutterClip.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "style");
    ButtonStyle style;
    if (fieldType == LuaType.luaUserdata) {
      style = ls.toUserdata(-1).data as ButtonStyle;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<ElevatedButton>();
    userdata.data = ElevatedButton(
      key: key,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      style: style,
      onLongPress: long_pressId != -1
          ? () {
              ls.rawGetI(lua_registryindex, long_pressId);
              ls.pCall(0, 0, 1);
            }
          : null,
      onPressed: pressId != -1
          ? () {
              ls.rawGetI(lua_registryindex, pressId);
              ls.pCall(0, 0, 1);
            }
          : null,
      onHover: hoverId != -1
          ? (h) {
              ls.rawGetI(lua_registryindex, hoverId);
              ls.pushBoolean(h);
              ls.pCall(1, 0, 1);
            }
          : null,
      onFocusChange: focusId != -1
          ? (f) {
              ls.rawGetI(lua_registryindex, focusId);
              ls.pushBoolean(f);
              ls.pCall(1, 0, 1);
            }
          : null,
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
