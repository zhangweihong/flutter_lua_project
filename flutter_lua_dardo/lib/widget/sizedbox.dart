import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class FlutterSizedBox {
  static const Map<String, DartFunction> _SizedBoxWrap = {"new": _newSizedBox};

  static const Map<String, DartFunction> _SizedBoxMembers = {"id": null};

  static int _newSizedBox(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterSizedBox child',
          type: ls.typeName(fieldType),
          expected: "SizedBox child",
          source: "FlutterSizedBox child not Widget");
    }
    double width = null;
    fieldType = ls.getField(-1, "width");
    if (fieldType == LuaType.luaNumber) {
      width = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    double height = null;
    fieldType = ls.getField(-1, "height");
    if (fieldType == LuaType.luaNumber) {
      height = ls.toNumberX(-1);
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

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = SizedBox(
      key: key,
      width: width,
      height: height,
      child: child,
    );
    return 1;
  }

  static int _openSizedBoxLib(LuaState ls) {
    ls.newMetatable("SizedBoxClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_SizedBoxMembers, 0);

    ls.newLib(_SizedBoxWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("SizedBox", _openSizedBoxLib, true);
    ls.pop(1);
  }
}
