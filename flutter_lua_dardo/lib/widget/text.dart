import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lua_dardo/widget/font_weight.dart';
import 'package:flutter_lua_dardo/widget/text_align.dart';
import 'package:lua_dardo/lua.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'parameter_exception.dart';

class FlutterText {
  static const Map<String, DartFunction> _TextWrap = {
    "new": _newText,
    "rich": null
  };

  static const Map<String, DartFunction> _TextMembers = {"id": null};
  static int _newText(LuaState ls) {
    String first;
    if (ls.isString(-1)) {
      first = ls.toStr(-1);
    } else if (ls.isTable(-1)) {
      first = ls.toStr(-2);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'first',
          type: 'TextStyleType',
          expected: "String",
          source: "FlutterText _assetText");
    }
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "style");
      double _fontSize = 14;
      Color _colors = Colors.black;
      FontWeight _fontWeight = FontWeight.normal;
      String _fontFamily = "Arial";
      if (fieldType == LuaType.luaTable) {
        fieldType = ls.getField(-1, "fontSize");
        if (fieldType == LuaType.luaNumber) {
          _fontSize = ls.toNumberX(-1);
          ls.pop(1);
        } else {
          ls.pop(1);
          throw ParameterError(
              name: 'fontSize',
              type: 'TextStyleType',
              expected: "String",
              source: "FlutterText fontSize");
        }
        fieldType = ls.getField(-1, "fontWeight");
        if (fieldType == LuaType.luaNumber) {
          _fontWeight = FlutterFontWeight.get(ls.toIntegerX(-1));
          ls.pop(1);
        } else {
          ls.pop(1);
        }

        fieldType = ls.getField(-1, "fontFamily");
        if (fieldType == LuaType.luaString) {
          _fontFamily = ls.toStr(-1);
          ls.pop(1);
        } else {
          ls.pop(1);
        }

        fieldType = ls.getField(-1, "color");
        if (fieldType == LuaType.luaUserdata) {
          _colors = ls.toUserdata(-1).data as Color;
          ls.pop(1);
        } else {
          ls.pop(1);
        }
      } else if (fieldType == LuaType.luaNil) {
        ls.pop(1);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'textStyle',
            type: ls.typeName(fieldType),
            expected: "style",
            source: "Text");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "textAlign");
      TextAlign al = TextAlign.left;
      if (fieldType == LuaType.luaNumber) {
        al = FlutterTextAlign.get(ls.toIntegerX(-1));
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      Userdata u = ls.newUserdata<Text>();
      u.data = Text(
        first,
        textAlign: al,
        style: TextStyle(
            fontFamily: _fontFamily,
            color: _colors,
            fontSize: _fontSize,
            fontWeight: _fontWeight),
      );
    }

    return 1;
  }

  static int _openTextLib(LuaState ls) {
    ls.newMetatable("TextClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_TextMembers, 0);

    ls.newLib(_TextWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Text", _openTextLib, true);
    ls.pop(1);
  }
}
