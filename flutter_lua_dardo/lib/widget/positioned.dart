import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class FlutterPositioned {
  static const Map<String, DartFunction> _PositionWrap = {
    "new": _newPositioned
  };

  static const Map<String, DartFunction> _PositionMembers = {"id": null};

  static int _newPositioned(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      throw ParameterError(
          name: 'FlutterContainer child',
          type: ls.typeName(fieldType),
          expected: "Container child",
          source: "FlutterContainer child not Widget");
    }

    double left = null;
    fieldType = ls.getField(-1, "left");
    if (fieldType == LuaType.luaNumber) {
      left = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    double top = null;
    fieldType = ls.getField(-1, "top");
    if (fieldType == LuaType.luaNumber) {
      top = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    double right = null;
    fieldType = ls.getField(-1, "right");
    if (fieldType == LuaType.luaNumber) {
      right = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    double bottom = null;
    fieldType = ls.getField(-1, "bottom");
    if (fieldType == LuaType.luaNumber) {
      bottom = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
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

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = Positioned(
      child: child,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
    );
    return 1;
  }

  static int _openContainerLib(LuaState ls) {
    ls.newMetatable("PositionedClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_PositionMembers, 0);

    ls.newLib(_PositionWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Positioned", _openContainerLib, true);
    ls.pop(1);
  }
}
