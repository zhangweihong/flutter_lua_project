import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/text_align.dart';
import 'package:lua_dardo/lua.dart';
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
      var style;
      if (fieldType == LuaType.luaUserdata) {
        style = ls.toUserdata(-1).data as TextStyle;
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

      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      Userdata u = ls.newUserdata<Text>();
      u.data = Text(
        first,
        key: key,
        textAlign: al,
        style: style,
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
