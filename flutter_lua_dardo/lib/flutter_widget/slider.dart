import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterSlider {
  static const Map<String, DartFunction> _SliderWrap = {"new": _newSlider};

  static const Map<String, DartFunction> _SliderMembers = {"id": null};

  static int _newSlider(LuaState ls) {
    var fieldType = ls.getField(-1, "value");
    var value;
    if (fieldType == LuaType.luaNumber) {
      value = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterSlider  value is null");
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
          source: "FlutterSlider  onChanged is null");
    }

    fieldType = ls.getField(-1, "onChangeStart");
    int onChangedStartId = -1;
    if (fieldType == LuaType.luaFunction) {
      onChangedStartId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "onChangeEnd");
    int onChangeEndId = -1;
    if (fieldType == LuaType.luaFunction) {
      onChangeEndId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "semanticFormatterCallback");
    int semanticFormatterCallbackId = -1;
    if (fieldType == LuaType.luaFunction) {
      semanticFormatterCallbackId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "min");
    double min = 0;
    if (fieldType == LuaType.luaNumber) {
      min = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "max");
    double max = 1;
    if (fieldType == LuaType.luaNumber) {
      max = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "divisions");
    int divisions;
    if (fieldType == LuaType.luaNumber) {
      divisions = ls.toIntegerX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "label");
    var label;
    if (fieldType == LuaType.luaString) {
      label = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "activeColor");
    var activeColor;
    if (fieldType == LuaType.luaUserdata) {
      activeColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "inactiveColor");
    var inactiveColor;
    if (fieldType == LuaType.luaUserdata) {
      inactiveColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "thumbColor");
    var thumbColor;
    if (fieldType == LuaType.luaUserdata) {
      thumbColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "autofocus");
    bool autofocus = false;
    if (fieldType == LuaType.luaBoolean) {
      autofocus = ls.toBoolean(-1);
    }
    ls.pop(1);

    ls.newUserdata<Slider>().data = Slider(
      value: value,
      onChanged: onChangedId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onChangedId);
              ls.pushNumber(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      onChangeStart: onChangedStartId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onChangedStartId);
              ls.pushNumber(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      onChangeEnd: onChangeEndId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onChangeEndId);
              ls.pushNumber(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      min: min,
      max: max,
      divisions: divisions,
      label: label,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      thumbColor: thumbColor,
      semanticFormatterCallback: semanticFormatterCallbackId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, semanticFormatterCallbackId);
              ls.pushNumber(value);
              ls.pCall(1, 1, 1);
              var str = "";
              if (ls.isString(-1)) {
                str = ls.toStr(-1);
              }
              return str;
            }
          : null,
      autofocus: autofocus,
    );
    return 1;
  }

  static int _openSliderLib(LuaState ls) {
    ls.newMetatable("SliderClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_SliderMembers, 0);

    ls.newLib(_SliderWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Slider", _openSliderLib, true);
    ls.pop(1);
  }
}
