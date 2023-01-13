import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/font_weight.dart';
import 'package:flutter_lua_dardo/flutter_widget/fontstyle.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterStrutStyle {
  static const Map<String, DartFunction> _TextStyleWrap = {
    "new": _newStrutStyle,
  };

  static const Map<String, DartFunction> _TextStyleMembers = {"id": null};

  static int _newStrutStyle(LuaState ls) {
    var fieldType = ls.getField(-1, "fontSize");
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

    fieldType = ls.getField(-1, "fontFamily");
    String fontFamily;
    if (fieldType == LuaType.luaString) {
      fontFamily = ls.toStr(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "fontFamilyFallback");
    var fontFamilyFallback;
    if (fieldType == LuaType.luaTable) {
      fontFamilyFallback = List.empty(growable: true);
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaString) {
          fontFamilyFallback.add(ls.toStr(-1));
        }
        ls.pop(1);
      }
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

    fieldType = ls.getField(-1, "height");
    double height;
    if (fieldType == LuaType.luaNumber) {
      height = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "leading");
    double leading;
    if (fieldType == LuaType.luaNumber) {
      leading = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "forceStrutHeight");
    var forceStrutHeight;
    if (fieldType == LuaType.luaBoolean) {
      forceStrutHeight = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "debugLabel");
    var debugLabel;
    if (fieldType == LuaType.luaString) {
      debugLabel = ls.toStr(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata u = ls.newUserdata<StrutStyle>();
    u.data = StrutStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      leading: leading,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      forceStrutHeight: forceStrutHeight,
      debugLabel: debugLabel,
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
