import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterRadio {
  static const Map<String, DartFunction> _RadioWrap = {
    "new": _newRadio,
  };

  static const Map<String, DartFunction> _RadioMembers = {"id": null};

  static int _newRadio(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    int value;
    if (fieldType == LuaType.luaNumber) {
      value = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterRadio  value is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "groupValue");
    int groupValue;
    if (fieldType == LuaType.luaNumber) {
      groupValue = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterRadio  groupValue is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onChanged");
    int onChangedId = -1;
    if (fieldType == LuaType.luaFunction) {
      onChangedId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterCheckBox  onChanged is null");
    }

    fieldType = ls.getField(-1, "activeColor");
    var activeColor;
    if (fieldType == LuaType.luaUserdata) {
      activeColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "fillColor");
    var fillColor;
    if (fieldType == LuaType.luaUserdata) {
      fillColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "focusColor");
    var focusColor;
    if (fieldType == LuaType.luaUserdata) {
      focusColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "hoverColor");
    var hoverColor;
    if (fieldType == LuaType.luaUserdata) {
      hoverColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "autofocus");
    bool autofocus = false;
    if (fieldType == LuaType.luaBoolean) {
      autofocus = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "overlayColor");
    var overlayColor;
    if (fieldType == LuaType.luaUserdata) {
      overlayColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "splashRadius");
    var splashRadius;
    if (fieldType == LuaType.luaNumber) {
      splashRadius = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "toggleable");
    bool toggleable = false;
    if (fieldType == LuaType.luaBoolean) {
      toggleable = ls.toBoolean(-1);
    }
    ls.pop(1);

    ls.newUserdata<Radio>().data = Radio(
      key: key,
      value: value,
      groupValue: groupValue,
      toggleable: toggleable,
      onChanged: onChangedId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onChangedId);
              ls.pushInteger(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      activeColor: activeColor,
      fillColor: fillColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      overlayColor: overlayColor,
      autofocus: autofocus,
      splashRadius: splashRadius,
    );
    return 1;
  }

  static int _openRadioLib(LuaState ls) {
    ls.newMetatable("RadioClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_RadioMembers, 0);
    ls.newLib(_RadioWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Radio", _openRadioLib, true);
    ls.pop(1);
  }
}
