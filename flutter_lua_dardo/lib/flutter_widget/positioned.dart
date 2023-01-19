import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/textdirection.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class FlutterPositioned {
  static const Map<String, DartFunction> _PositionedWrap = {
    "new": _newPositioned,
    "fromRect": _fromRectPositioned,
    "fill": _fillPositioned,
    "directional": _directionalPositioned,
  };

  static const Map<String, DartFunction> _PositionedMembers = {"id": null};

  static int _newPositioned(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: '_newPositioned child',
          type: ls.typeName(fieldType),
          expected: "",
          source: "_newPositioned child not Widget");
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

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = Positioned(
      key: key,
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

  static int _fromRectPositioned(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: '_fromRectPositioned child',
          type: ls.typeName(fieldType),
          expected: "",
          source: "_fromRectPositioned child not Widget");
    }

    fieldType = ls.getField(-1, "rect");
    var rect;
    if (fieldType == LuaType.luaUserdata) {
      rect = ls.toUserdata(-1).data as Rect;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: '_fromRectPositioned',
          type: ls.typeName(fieldType),
          expected: "_fromRectPositioned rect is null",
          source: "_fromRectPositioned");
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
    userdata.data = Positioned.fromRect(key: key, rect: rect, child: child);

    return 1;
  }

  static int _fillPositioned(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: '_fillPositioned child',
          type: ls.typeName(fieldType),
          expected: "",
          source: "_fillPositioned child not Widget");
    }

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "left");
    double left = 0;
    if (fieldType == LuaType.luaUserdata) {
      left = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "top");
    double top = 0;
    if (fieldType == LuaType.luaUserdata) {
      top = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "right");
    double right = 0;
    if (fieldType == LuaType.luaUserdata) {
      right = ls.toNumberX(-1);
    }
    ls.pop(1);
    fieldType = ls.getField(-1, "bottom");
    double bottom = 0;
    if (fieldType == LuaType.luaUserdata) {
      bottom = ls.toNumberX(-1);
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = Positioned.fill(
      key: key,
      child: child,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );

    return 1;
  }

  static int _directionalPositioned(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: '_directionalPositioned child',
          type: ls.typeName(fieldType),
          expected: "",
          source: "_directionalPositioned child not Widget");
    }

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    double start = null;
    fieldType = ls.getField(-1, "start");
    if (fieldType == LuaType.luaNumber) {
      start = ls.toNumberX(-1);
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

    double end = null;
    fieldType = ls.getField(-1, "_end");
    if (fieldType == LuaType.luaNumber) {
      end = ls.toNumberX(-1);
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

    fieldType = ls.getField(-1, "textDirection");
    var textDirection = null;
    if (fieldType == LuaType.luaNumber) {
      textDirection = FlutterTextDirection.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: '_directionalPositioned textDirection',
          type: ls.typeName(fieldType),
          expected: "",
          source: "_directionalPositioned textDirection not Widget");
    }

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = Positioned.directional(
      key: key,
      textDirection: textDirection,
      child: child,
      start: start,
      top: top,
      end: end,
      bottom: bottom,
      width: width,
      height: height,
    );
    return 1;
  }

  static int _openPositionedLib(LuaState ls) {
    ls.newMetatable("PositionedClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_PositionedMembers, 0);

    ls.newLib(_PositionedWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Positioned", _openPositionedLib, true);
    ls.pop(1);
  }
}
