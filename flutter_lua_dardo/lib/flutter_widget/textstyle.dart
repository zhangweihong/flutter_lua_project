import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/font_weight.dart';
import 'package:flutter_lua_dardo/flutter_widget/fontstyle.dart';
import 'package:flutter_lua_dardo/flutter_widget/textbaseline.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterTextStyle {
  static const Map<String, DartFunction> _TextStyleWrap = {
    "new": _newTextStyle,
  };

  static const Map<String, DartFunction> _TextStyleMembers = {"id": null};

  static int _newTextStyle(LuaState ls) {
    var fieldType = ls.getField(-1, "inherit");
    bool inherit = true;
    if (fieldType == LuaType.luaBoolean) {
      inherit = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "color");
    Color color;
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1).data as Color;
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

    fieldType = ls.getField(-1, "fontSize");
    double fontSize;
    if (fieldType == LuaType.luaNumber) {
      fontSize = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "fontWeight");
    FontWeight fontWeight;
    if (fieldType == LuaType.luaNumber) {
      fontWeight = FlutterFontWeight.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "fontStyle");
    FontStyle fontStyle;
    if (fieldType == LuaType.luaNumber) {
      fontStyle = FlutterFontStyle.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "letterSpacing");
    double letterSpacing;
    if (fieldType == LuaType.luaNumber) {
      letterSpacing = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "wordSpacing");
    double wordSpacing;
    if (fieldType == LuaType.luaNumber) {
      wordSpacing = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "textBaseline");
    TextBaseline textBaseline;
    if (fieldType == LuaType.luaNumber) {
      textBaseline = FlutterTextBaseline.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "height");
    double height;
    if (fieldType == LuaType.luaNumber) {
      height = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata u = ls.newUserdata<TextStyle>();
    u.data = TextStyle(
      inherit: inherit,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
    );
    return 1;
  }

  static int _openTextStyleLib(LuaState ls) {
    ls.newMetatable("TextStyleClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_TextStyleMembers, 0);

    ls.newLib(_TextStyleWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("TextStyle", _openTextStyleLib, true);
    ls.pop(1);
  }
}
