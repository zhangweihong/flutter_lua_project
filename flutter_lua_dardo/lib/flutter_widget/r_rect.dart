import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterRRect {
  static const Map<String, DartFunction> _RRectWrap = {
    "fromLTRBXY": _fromLTRBXY,
    "fromLTRBR": _fromLTRBR,
    "fromRectXY": _fromRectXY,
    "fromRectAndRadius": _fromRectAndRadius,
    "fromLTRBAndCorners": _fromLTRBAndCorners,
    "fromRectAndCorners": _fromRectAndCorners,
  };

  static const Map<String, DartFunction> _RRectMeb = {'id': null};

  static int _fromLTRBXY(LuaState ls) {
    var filedType = ls.getField(-1, "left");
    double left = 0;
    if (filedType == LuaType.luaNumber) {
      left = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect left is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "top");
    double top = 0;
    if (filedType == LuaType.luaNumber) {
      top = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect top is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "right");
    double right = 0;
    if (filedType == LuaType.luaNumber) {
      right = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect right is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "bottom");
    double bottom = 0;
    if (filedType == LuaType.luaNumber) {
      bottom = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect bottom is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "radiusX");
    double radiusX = 0;
    if (filedType == LuaType.luaNumber) {
      radiusX = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect radiusX is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "radiusY");
    double radiusY = 0;
    if (filedType == LuaType.luaNumber) {
      radiusY = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect radiusY is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<RRect>();
    userdata.data =
        RRect.fromLTRBXY(left, top, right, bottom, radiusX, radiusY);

    return 1;
  }

  static int _fromLTRBR(LuaState ls) {
    var filedType = ls.getField(-1, "left");
    double left = 0;
    if (filedType == LuaType.luaNumber) {
      left = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromLTRBR left is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "top");
    double top = 0;
    if (filedType == LuaType.luaNumber) {
      top = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromLTRBR top is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "width");
    double width = 0;
    if (filedType == LuaType.luaNumber) {
      width = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect width is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "height");
    double height = 0;
    if (filedType == LuaType.luaNumber) {
      height = ls.toNumberX(-1);  
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromLTRBR height is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "radius");
    Radius _radius = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _radius = Radius.circular(ls.toNumberX(-1));
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromLTRBR radius is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<RRect>();
    userdata.data = RRect.fromLTRBR(left, top, width, height, _radius);
    return 1;
  }

  static int _fromRectXY(LuaState ls) {
    var filedType = ls.getField(-1, "rect");
    Rect rect;
    if (filedType == LuaType.luaUserdata) {
      rect = ls.toUserdata(-1).data as Rect;
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromRectXY rect is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "radiusX");
    double radiusX = 0;
    if (filedType == LuaType.luaNumber) {
      radiusX = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromRectXY radiusX is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "radiusY");
    double radiusY = 0;
    if (filedType == LuaType.luaNumber) {
      radiusY = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromRectXY radiusY is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<RRect>();
    userdata.data = RRect.fromRectXY(rect, radiusX, radiusY);
    return 1;
  }

  static int _fromRectAndRadius(LuaState ls) {
    var filedType = ls.getField(-1, "rect");
    Rect rect;
    if (filedType == LuaType.luaUserdata) {
      rect = ls.toUserdata(-1).data as Rect;
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromRectAndRadius rect is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "radius");
    Radius _radius = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _radius = Radius.circular(ls.toNumberX(-1));
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromRectAndRadius radius is null",
          source: "FlutterRRect");
    }
    ls.pop(1);
    Userdata userdata = ls.newUserdata<RRect>();
    userdata.data = RRect.fromRectAndRadius(rect, _radius);
    return 1;
  }

  static int _fromLTRBAndCorners(LuaState ls) {
    var filedType = ls.getField(-1, "left");
    double left = 0;
    if (filedType == LuaType.luaNumber) {
      left = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromLTRBAndCorners left is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "top");
    double top = 0;
    if (filedType == LuaType.luaNumber) {
      top = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromLTRBAndCorners top is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "right");
    double right = 0;
    if (filedType == LuaType.luaNumber) {
      right = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromLTRBAndCorners right is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "bottom");
    double bottom = 0;
    if (filedType == LuaType.luaNumber) {
      bottom = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromLTRBAndCorners bottom is null",
          source: "FlutterRRect");
    }
    ls.pop(1);

    filedType = ls.getField(-1, "topLeft");
    Radius _topLeft = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _topLeft = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    filedType = ls.getField(-1, "topRight");
    Radius _topRight = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _topRight = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    filedType = ls.getField(-1, "bottomRight");
    Radius _bottomRight = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _bottomRight = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    filedType = ls.getField(-1, "bottomLeft");
    Radius _bottomLeft = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _bottomLeft = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<RRect>();
    userdata.data = RRect.fromLTRBAndCorners(left, top, right, bottom,
        topLeft: _topLeft,
        topRight: _topRight,
        bottomLeft: _bottomLeft,
        bottomRight: _bottomRight);
    return 1;
  }

  static int _fromRectAndCorners(LuaState ls) {
    var filedType = ls.getField(-1, "rect");
    Rect rect;
    if (filedType == LuaType.luaUserdata) {
      rect = ls.toUserdata(-1).data as Rect;
    } else {
      throw ParameterError(
          name: "FlutterRRect",
          type: "",
          expected: "FlutterRRect _fromRectAndCorners rect is null",
          source: "FlutterRRect");
    }
    ls.pop(1);
    filedType = ls.getField(-1, "topLeft");
    Radius _topLeft = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _topLeft = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    filedType = ls.getField(-1, "topRight");
    Radius _topRight = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _topRight = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    filedType = ls.getField(-1, "bottomRight");
    Radius _bottomRight = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _bottomRight = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    filedType = ls.getField(-1, "bottomLeft");
    Radius _bottomLeft = Radius.circular(0);
    if (filedType == LuaType.luaNumber) {
      _bottomLeft = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<RRect>();
    userdata.data = RRect.fromRectAndCorners(rect,
        topLeft: _topLeft,
        topRight: _topRight,
        bottomLeft: _bottomLeft,
        bottomRight: _bottomRight);
    return 1;
  }

  static int _openRRectLib(LuaState ls) {
    ls.newMetatable("RRectClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_RRectMeb, 0);

    ls.newLib(_RRectWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("RRect", _openRRectLib, true);
    ls.pop(1);
  }
}
