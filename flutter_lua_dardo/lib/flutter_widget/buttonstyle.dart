import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/align.dart';
import 'package:flutter_lua_dardo/flutter_widget/alignment.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterButtonStyle {
  static const Map<String, DartFunction> _ButtonStyleWrap = {
    "new": _newButtonStyle,
  };

  static const Map<String, DartFunction> _ButtonStyleMembers = {"id": null};

  static int _newButtonStyle(LuaState ls) {
    var fieldType = ls.getField(-1, "textStyle");
    var textStyle;
    if (fieldType == LuaType.luaUserdata) {
      textStyle = ls.toUserdata(-1).data as TextStyle;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "backgroundColor");
    Color backgroundColor;
    if (fieldType == LuaType.luaUserdata) {
      backgroundColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "foregroundColor");
    Color foregroundColor;
    if (fieldType == LuaType.luaUserdata) {
      foregroundColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "overlayColor");
    Color overlayColor;
    if (fieldType == LuaType.luaUserdata) {
      overlayColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "shadowColor");
    Color shadowColor;
    if (fieldType == LuaType.luaUserdata) {
      shadowColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "surfaceTintColor");
    Color surfaceTintColor;
    if (fieldType == LuaType.luaUserdata) {
      surfaceTintColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "elevation");
    double elevation;
    if (fieldType == LuaType.luaNumber) {
      elevation = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "padding");
    EdgeInsetsGeometry padding;
    if (fieldType == LuaType.luaUserdata) {
      padding = ls.toUserdata(-1).data as EdgeInsetsGeometry;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "minimumSize");
    Size minimumSize;
    if (fieldType == LuaType.luaUserdata) {
      minimumSize = ls.toUserdata(-1).data as Size;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "fixedSize");
    Size fixedSize;
    if (fieldType == LuaType.luaUserdata) {
      fixedSize = ls.toUserdata(-1).data as Size;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "maximumSize");
    Size maximumSize;
    if (fieldType == LuaType.luaUserdata) {
      maximumSize = ls.toUserdata(-1).data as Size;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "side");
    BorderSide side;
    if (fieldType == LuaType.luaUserdata) {
      side = ls.toUserdata(-1).data as BorderSide;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "shape");
    OutlinedBorder shape;
    if (fieldType == LuaType.luaUserdata) {
      shape = ls.toUserdata(-1).data as OutlinedBorder;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "animationDuration");
    int animationDurationMilliSec;
    if (fieldType == LuaType.luaNumber) {
      animationDurationMilliSec = ls.toIntegerX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "alignment");
    Alignment alignment;
    if (fieldType == LuaType.luaNumber) {
      alignment = FlutterAlignment.get(ls.toIntegerX(-1));
    } else if (fieldType == LuaType.luaUserdata) {
      alignment = ls.toUserdata(-1).data as Alignment;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "enableFeedback");
    bool enableFeedback;
    if (fieldType == LuaType.luaBoolean) {
      enableFeedback = ls.toBoolean(-1);
    }
    ls.pop(1);

    Userdata u = ls.newUserdata<ButtonStyle>();
    u.data = ButtonStyle(
        textStyle: MaterialStateProperty.all(textStyle),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        overlayColor: MaterialStateProperty.all(overlayColor),
        shadowColor: MaterialStateProperty.all(shadowColor),
        surfaceTintColor: MaterialStateProperty.all(surfaceTintColor),
        elevation: MaterialStateProperty.all(elevation),
        padding: MaterialStateProperty.all(padding),
        minimumSize: MaterialStateProperty.all(minimumSize),
        fixedSize: MaterialStateProperty.all(fixedSize),
        maximumSize: MaterialStateProperty.all(maximumSize),
        side: MaterialStateProperty.all(side),
        shape: MaterialStateProperty.all(shape),
        animationDuration: animationDurationMilliSec != null
            ? Duration(
                milliseconds: animationDurationMilliSec,
              )
            : null,
        alignment: alignment,
        enableFeedback: enableFeedback);
    return 1;
  }

  static int _openButtonStyleLib(LuaState ls) {
    ls.newMetatable("ButtonStyleClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ButtonStyleMembers, 0);

    ls.newLib(_ButtonStyleWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("ButtonStyle", _openButtonStyleLib, true);
    ls.pop(1);
  }
}
