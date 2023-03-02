import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterCheckbox {
  static const Map<String, DartFunction> _CheckBoxWrap = {
    "new": _newCheckBox,
  };

  static const Map<String, DartFunction> _CheckBoxMembers = {"id": null};

  static int _newCheckBox(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    bool value;
    if (fieldType == LuaType.luaBoolean) {
      value = ls.toBoolean(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterCheckBox  value is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "tristate");
    bool tristate = false;
    if (fieldType == LuaType.luaBoolean) {
      tristate = ls.toBoolean(-1);
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

    fieldType = ls.getField(-1, "checkColor");
    var checkColor;
    if (fieldType == LuaType.luaUserdata) {
      checkColor = ls.toUserdata(-1).data as Color;
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

    fieldType = ls.getField(-1, "side");
    var side;
    if (fieldType == LuaType.luaUserdata) {
      side = ls.toUserdata(-1).data as BorderSide;
    }
    ls.pop(1);

    ls.newUserdata<Checkbox>().data = Checkbox(
      key: key,
      value: value,
      tristate: tristate,
      onChanged: onChangedId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onChangedId);
              ls.pushBoolean(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      activeColor: activeColor,
      fillColor: fillColor,
      checkColor: checkColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      overlayColor: overlayColor,
      splashRadius: splashRadius,
      side: side,
      autofocus: autofocus,
    );
    return 1;
  }

  static int _openCheckBoxLib(LuaState ls) {
    ls.newMetatable("CheckboxClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_CheckBoxMembers, 0);
    ls.newLib(_CheckBoxWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Checkbox", _openCheckBoxLib, true);
    ls.pop(1);
  }
}
