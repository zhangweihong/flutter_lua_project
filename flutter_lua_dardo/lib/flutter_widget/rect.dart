import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterRect {
  static const Map<String, DartFunction> _RectWrap = {
    "fromLTRB": _fromLTRBRect,
    "fromLTWH": _fromLTWHRect,
    "fromCircle": _fromCircleRect,
    "fromCenter": _fromCenterRect,
    "fromPoints": _fromPointsRect,
  };

  static const Map<String, DartFunction> _RectMeb = {'id': null};

  static int _fromLTRBRect(LuaState ls) {
    var filedType = ls.getField(-1, "left");
    double left = 0;
    if (filedType == LuaType.luaNumber) {
      left = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect left is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "top");
    double top = 0;
    if (filedType == LuaType.luaNumber) {
      top = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect top is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "right");
    double right = 0;
    if (filedType == LuaType.luaNumber) {
      right = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect right is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "bottom");
    double bottom = 0;
    if (filedType == LuaType.luaNumber) {
      bottom = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect bottom is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Rect>();
    userdata.data = Rect.fromLTRB(left, top, right, bottom);

    return 1;
  }

  static int _fromLTWHRect(LuaState ls) {
    var filedType = ls.getField(-1, "left");
    double left = 0;
    if (filedType == LuaType.luaNumber) {
      left = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect left is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "top");
    double top = 0;
    if (filedType == LuaType.luaNumber) {
      top = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect top is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "width");
    double width = 0;
    if (filedType == LuaType.luaNumber) {
      width = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect width is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "height");
    double height = 0;
    if (filedType == LuaType.luaNumber) {
      height = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect height is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Rect>();
    userdata.data = Rect.fromLTWH(left, top, width, height);
    return 1;
  }

  static int _fromCircleRect(LuaState ls) {
    var filedType = ls.getField(-1, "center");
    Offset center;
    if (filedType == LuaType.luaUserdata) {
      center = ls.toUserdata(-1).data as Offset;
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect center is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "radius");
    double radius = 0;
    if (filedType == LuaType.luaNumber) {
      radius = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect radius is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Rect>();
    userdata.data = Rect.fromCircle(center: center, radius: radius);
    return 1;
  }

  static int _fromCenterRect(LuaState ls) {
    var filedType = ls.getField(-1, "center");
    Offset center;
    if (filedType == LuaType.luaUserdata) {
      center = ls.toUserdata(-1).data as Offset;
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect center is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "width");
    double width = 0;
    if (filedType == LuaType.luaNumber) {
      width = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect width is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "height");
    double height = 0;
    if (filedType == LuaType.luaNumber) {
      height = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect height is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Rect>();
    userdata.data =
        Rect.fromCenter(center: center, width: width, height: height);
    return 1;
  }

  static int _fromPointsRect(LuaState ls) {
    var filedType = ls.getField(-1, "a");
    Offset a;
    if (filedType == LuaType.luaUserdata) {
      a = ls.toUserdata(-1).data as Offset;
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect a is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "b");
    Offset b;
    if (filedType == LuaType.luaUserdata) {
      b = ls.toUserdata(-1).data as Offset;
    } else {
      throw ParameterError(
          name: "FlutterRect",
          type: "",
          expected: "FlutterRect b is null",
          source: "FlutterRect");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Rect>();
    userdata.data = Rect.fromPoints(a, b);
    return 1;
  }

  static int _openRectLib(LuaState ls) {
    ls.newMetatable("RectClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_RectMeb, 0);

    ls.newLib(_RectWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Rect", _openRectLib, true);
    ls.pop(1);
  }
}
