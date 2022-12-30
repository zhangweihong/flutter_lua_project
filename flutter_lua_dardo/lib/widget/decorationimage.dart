import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/widget/box_fit.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';
import 'package:lua_dardo/lua.dart';

class FlutterDecorationImage {
  static const Map<String, DartFunction> _DecorationImageWrap = {
    "new": _newDecorationImage
  };

  static int _openBorderRadiusLib(LuaState ls) {
    ls.newLib(_DecorationImageWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("DecorationImage", _openBorderRadiusLib, true);
    ls.pop(1);
  }

  static int _newDecorationImage(LuaState ls) {
    var fieldType = ls.getField(-1, "image");
    Image img;
    if (fieldType == LuaType.luaUserdata) {
      img = ls.toUserdata(-1).data as Image;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterDecorationImage Image',
          type: ls.typeName(fieldType),
          expected: "FlutterDecorationImage Image Ex",
          source: "FlutterDecorationImage Error");
    }

    fieldType = ls.getField(-1, "fit");
    BoxFit fit = BoxFit.scaleDown;
    if (fieldType == LuaType.luaNumber) {
      fit = FlutterBoxFit.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<DecorationImage>();
    userdata.data = DecorationImage(image: img.image, fit: fit);
    return 1;
  }
}
