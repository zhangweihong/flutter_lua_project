import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/drag_start_behavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterSwitch {
  static const Map<String, DartFunction> _SwitchWrap = {
    "new": _newSwitch,
  };

  static const Map<String, DartFunction> _SwitchMembers = {"id": null};

  static int _newSwitch(LuaState ls) {
    var fieldType = ls.getField(-1, "value");
    bool value;
    if (fieldType == LuaType.luaBoolean) {
      value = ls.toBoolean(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterSwitch  value is null");
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
          source: "FlutterSwitch  onChanged is null");
    }

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "activeColor");
    var activeColor;
    if (fieldType == LuaType.luaUserdata) {
      activeColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "activeTrackColor");
    var activeTrackColor;
    if (fieldType == LuaType.luaUserdata) {
      activeTrackColor = ls.toUserdata(-1).data as Color;
    }

    ls.pop(1);
    fieldType = ls.getField(-1, "inactiveThumbColor");
    var inactiveThumbColor;
    if (fieldType == LuaType.luaUserdata) {
      inactiveThumbColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "inactiveTrackColor");
    var inactiveTrackColor;
    if (fieldType == LuaType.luaUserdata) {
      inactiveTrackColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "activeThumbImage");
    Image activeThumbImage;
    if (fieldType == LuaType.luaUserdata) {
      activeThumbImage = ls.toUserdata(-1).data as Image;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "inactiveThumbImage");
    Image inactiveThumbImage;
    if (fieldType == LuaType.luaUserdata) {
      inactiveThumbImage = ls.toUserdata(-1).data as Image;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "thumbColor");
    var thumbColor;
    if (fieldType == LuaType.luaUserdata) {
      thumbColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "trackColor");
    var trackColor;
    if (fieldType == LuaType.luaUserdata) {
      trackColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dragStartBehavior");
    var dragStartBehavior = DragStartBehavior.start;
    if (fieldType == LuaType.luaNumber) {
      dragStartBehavior = FlutterDragStartBehavior.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "thumbColor");
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

    fieldType = ls.getField(-1, "autofocus");
    bool autofocus = false;
    if (fieldType == LuaType.luaBoolean) {
      autofocus = ls.toBoolean(-1);
    }
    ls.pop(1);

    ls.newUserdata().data = Switch(
        key: key,
        value: value,
        onChanged: onChangedId != -1
            ? (value) {
                ls.rawGetI(lua_registryindex, onChangedId);
                ls.pushBoolean(value);
                ls.pCall(1, 0, 1);
              }
            : null,
        activeColor: activeColor,
        activeTrackColor: activeTrackColor,
        inactiveThumbColor: inactiveThumbColor,
        inactiveTrackColor: inactiveTrackColor,
        activeThumbImage:
            activeThumbImage != null ? activeThumbImage.image : null,
        inactiveThumbImage:
            inactiveThumbImage != null ? inactiveThumbImage.image : null,
        thumbColor: thumbColor,
        trackColor: trackColor,
        dragStartBehavior: dragStartBehavior,
        focusColor: focusColor,
        hoverColor: hoverColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
        autofocus: autofocus);
    return 1;
  }

  static int _openSwitchLib(LuaState ls) {
    ls.newMetatable("SwitchClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_SwitchMembers, 0);

    ls.newLib(_SwitchWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Switch", _openSwitchLib, true);
    ls.pop(1);
  }
}
