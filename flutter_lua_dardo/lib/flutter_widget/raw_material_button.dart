import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterRawMaterialButton {
  static const Map<String, DartFunction> _RawMaterialButtonWrap = {
    'new': _newRawMaterialButtonWrap,
  };

  static const Map<String, DartFunction> _RawMaterialButtonMembers = {
    'id': null
  };

  static int _newRawMaterialButtonWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "child");
    Widget child;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onPressed");
    int onPressedId = -1;
    if (fieldType == LuaType.luaFunction) {
      onPressedId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "onLongPress");
    int onLongPressId = -1;
    if (fieldType == LuaType.luaFunction) {
      onLongPressId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "onHighlightChanged");
    int onHighlightChangedId = -1;
    if (fieldType == LuaType.luaFunction) {
      onLongPressId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "textStyle");
    TextStyle textStyle;
    if (fieldType == LuaType.luaUserdata) {
      textStyle = ls.toUserdata(-1).data as TextStyle;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "fillColor");
    Color fillColor;
    if (fieldType == LuaType.luaUserdata) {
      fillColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "focusColor");
    Color focusColor;
    if (fieldType == LuaType.luaUserdata) {
      focusColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "hoverColor");
    Color hoverColor;
    if (fieldType == LuaType.luaUserdata) {
      hoverColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "highlightColor");
    Color highlightColor;
    if (fieldType == LuaType.luaUserdata) {
      highlightColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "splashColor");
    Color splashColor;
    if (fieldType == LuaType.luaUserdata) {
      splashColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "padding");
    var padding = EdgeInsets.zero;
    if (fieldType == LuaType.luaUserdata) {
      padding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "elevation");
    var elevation = 2.0;
    if (fieldType == LuaType.luaNumber) {
      elevation = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "focusElevation");
    var focusElevation = 4.0;
    if (fieldType == LuaType.luaNumber) {
      focusElevation = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "hoverElevation");
    var hoverElevation = 4.0;
    if (fieldType == LuaType.luaNumber) {
      hoverElevation = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "highlightElevation");
    var highlightElevation = 8.0;
    if (fieldType == LuaType.luaNumber) {
      highlightElevation = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "disabledElevation");
    var disabledElevation = 0.0;
    if (fieldType == LuaType.luaNumber) {
      disabledElevation = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "clipBehavior");
    var clipBehavior = Clip.none;
    if (fieldType == LuaType.luaNumber) {
      clipBehavior = FlutterClip.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    ls.newUserdata().data = RawMaterialButton(
      key: key,
      onPressed: onPressedId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onPressedId);
              ls.pCall(0, 0, 1);
            }
          : null,
      onLongPress: onLongPressId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onLongPressId);
              ls.pCall(0, 0, 1);
            }
          : null,
      onHighlightChanged: onHighlightChangedId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onHighlightChangedId);
              ls.pushBoolean(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      textStyle: textStyle,
      child: child,
      fillColor: fillColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      clipBehavior: clipBehavior,
      padding: padding,
    );
    return 1;
  }

  static int _openRawMaterialButtonLib(LuaState ls) {
    ls.newMetatable('RawMaterialButtonClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_RawMaterialButtonMembers, 0);
    ls.newLib(_RawMaterialButtonWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('RawMaterialButton', _openRawMaterialButtonLib, true);
    ls.pop(1);
  }
}
