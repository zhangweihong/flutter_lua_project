import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/flutter_widget/pathfilltype.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterPath {
  static const Map<String, DartFunction> _PathWrap = {
    'new': _newPathWrap,
    'setFillType': _setFillType,
    'getFillType': _getFillType,
    'moveTo': _moveTo,
    'relativeMoveTo': _relativeMoveTo,
    'lineTo': _lineTo,
    'relativeLineTo': _relativeLineTo,
    'quadraticBezierTo': _quadraticBezierTo,
    'relativeQuadraticBezierTo': _relativeQuadraticBezierTo,
    'cubicTo': _cubicTo,
    'relativeCubicTo': _relativeCubicTo,
    'conicTo': _conicTo,
    'relativeConicTo': _relativeConicTo,
    'arcTo': _arcTo,
    'arcToPoint': _arcToPoint,
    'relativeArcToPoint': _relativeArcToPoint,
    'addRect': _addRect,
    'addOval': _addOval,
    'addArc': _addArc,
    'addPolygon': _addPolygon,
    'addRRect': _addRRect,
    'addPath': _addPath,
    'extendWithPath': _extendWithPath,
    'close': _close,
    'reset': _reset,
    'contains': _contains,
    'getBounds': _getBounds,
    'combine': _combine,
  };
  static const Map<String, DartFunction> _PathMembers = {'id': null};

  static int _newPathWrap(LuaState ls) {
    var path = Path();
    ls.newUserdata().data = path;
    return 1;
  }

  static int _setFillType(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _setFillType path is null");
    }
    ls.pop(1);
    fieldType = ls.getField(-1, "fillType");
    var fillType = PathFillType.nonZero;
    if (fieldType == LuaType.luaNumber) {
      fillType = FlutterPathFillType.get(ls.toIntegerX(-1));
      path.fillType = fillType;
    }
    return 0;
  }

  static int _getFillType(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _setFillType path is null");
    }
    ls.pop(1);
    ls.pushInteger(FlutterPathFillType.indexOf(path.fillType));
    return 1;
  }

  static int _moveTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _moveTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x");
    double x;
    if (fieldType == LuaType.luaNumber) {
      x = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _moveTo x is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y");
    double y;
    if (fieldType == LuaType.luaNumber) {
      x = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _moveTo y is null");
    }
    ls.pop(1);
    path.moveTo(x, y);
    return 0;
  }

  static int _relativeMoveTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeMoveTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dx");
    double dx;
    if (fieldType == LuaType.luaNumber) {
      dx = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeMoveTo dx is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dy");
    double dy;
    if (fieldType == LuaType.luaNumber) {
      dy = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeMoveTo dy is null");
    }
    ls.pop(1);
    path.relativeMoveTo(dx, dy);
    return 0;
  }

  static int _lineTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _lineTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x");
    double x;
    if (fieldType == LuaType.luaNumber) {
      x = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _lineTo x is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y");
    double y;
    if (fieldType == LuaType.luaNumber) {
      x = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _lineTo y is null");
    }
    ls.pop(1);
    path.lineTo(x, y);
    return 0;
  }

  static int _relativeLineTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeLineTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dx");
    double dx;
    if (fieldType == LuaType.luaNumber) {
      dx = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeLineTo dx is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dy");
    double dy;
    if (fieldType == LuaType.luaNumber) {
      dy = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeLineTo dy is null");
    }
    ls.pop(1);

    path.relativeLineTo(dx, dy);
    return 0;
  }

  static int _quadraticBezierTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _quadraticBezierTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x1");
    double x1;
    if (fieldType == LuaType.luaNumber) {
      x1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _quadraticBezierTo x1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x2");
    double x2;
    if (fieldType == LuaType.luaNumber) {
      x2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _quadraticBezierTo x2 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y1");
    double y1;
    if (fieldType == LuaType.luaNumber) {
      y1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _quadraticBezierTo y1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y2");
    double y2;
    if (fieldType == LuaType.luaNumber) {
      y2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _quadraticBezierTo y2 is null");
    }
    ls.pop(1);
    path.quadraticBezierTo(x1, y1, x2, y2);
    return 0;
  }

  static int _relativeQuadraticBezierTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeQuadraticBezierTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x1");
    double x1;
    if (fieldType == LuaType.luaNumber) {
      x1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeQuadraticBezierTo x1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x2");
    double x2;
    if (fieldType == LuaType.luaNumber) {
      x2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeQuadraticBezierTo x2 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y1");
    double y1;
    if (fieldType == LuaType.luaNumber) {
      y1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeQuadraticBezierTo y1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y2");
    double y2;
    if (fieldType == LuaType.luaNumber) {
      y2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeQuadraticBezierTo y2 is null");
    }
    ls.pop(1);
    path.relativeQuadraticBezierTo(x1, y1, x2, y2);
    return 0;
  }

  static int _cubicTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _cubicTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x1");
    double x1;
    if (fieldType == LuaType.luaNumber) {
      x1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _cubicTo x1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x2");
    double x2;
    if (fieldType == LuaType.luaNumber) {
      x2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _cubicTo x2 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x3");
    double x3;
    if (fieldType == LuaType.luaNumber) {
      x3 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _cubicTo x3 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y1");
    double y1;
    if (fieldType == LuaType.luaNumber) {
      y1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _cubicTo y1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y2");
    double y2;
    if (fieldType == LuaType.luaNumber) {
      y2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _cubicTo y2 is null");
    }
    ls.pop(1);
    fieldType = ls.getField(-1, "y3");
    double y3;
    if (fieldType == LuaType.luaNumber) {
      y3 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _cubicTo y3 is null");
    }
    ls.pop(1);
    path.cubicTo(x1, y1, x2, y2, x3, y3);
    return 0;
  }

  static int _relativeCubicTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeCubicTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x1");
    double x1;
    if (fieldType == LuaType.luaNumber) {
      x1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeCubicTo x1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x2");
    double x2;
    if (fieldType == LuaType.luaNumber) {
      x2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeCubicTo x2 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x3");
    double x3;
    if (fieldType == LuaType.luaNumber) {
      x3 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeCubicTo x3 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y1");
    double y1;
    if (fieldType == LuaType.luaNumber) {
      y1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeCubicTo y1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y2");
    double y2;
    if (fieldType == LuaType.luaNumber) {
      y2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeCubicTo y2 is null");
    }
    ls.pop(1);
    fieldType = ls.getField(-1, "y3");
    double y3;
    if (fieldType == LuaType.luaNumber) {
      y3 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeCubicTo y3 is null");
    }
    ls.pop(1);
    path.relativeCubicTo(x1, y1, x2, y2, x3, y3);
    return 0;
  }

  static int _conicTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _cubicTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x1");
    double x1;
    if (fieldType == LuaType.luaNumber) {
      x1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _conicTo x1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x2");
    double x2;
    if (fieldType == LuaType.luaNumber) {
      x2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _conicTo x2 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y1");
    double y1;
    if (fieldType == LuaType.luaNumber) {
      y1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _conicTo y1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y2");
    double y2;
    if (fieldType == LuaType.luaNumber) {
      y2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _conicTo y2 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "w");
    double w;
    if (fieldType == LuaType.luaNumber) {
      w = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _conicTo w is null");
    }
    ls.pop(1);
    path.conicTo(x1, y1, x2, y2, w);
    return 0;
  }

  static int _relativeConicTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeConicTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x1");
    double x1;
    if (fieldType == LuaType.luaNumber) {
      x1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeConicTo x1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "x2");
    double x2;
    if (fieldType == LuaType.luaNumber) {
      x2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeConicTo x2 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y1");
    double y1;
    if (fieldType == LuaType.luaNumber) {
      y1 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeConicTo y1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "y2");
    double y2;
    if (fieldType == LuaType.luaNumber) {
      y2 = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeConicTo y2 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "w");
    double w;
    if (fieldType == LuaType.luaNumber) {
      w = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeConicTo w is null");
    }
    ls.pop(1);
    path.relativeConicTo(x1, y1, x2, y2, w);
    return 0;
  }

  static int _arcTo(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "rect");
    Rect rect;
    if (fieldType == LuaType.luaUserdata) {
      rect = ls.toUserdata(-1).data as Rect;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo rect is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "startAngle");
    double startAngle;
    if (fieldType == LuaType.luaNumber) {
      startAngle = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo startAngle is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "sweepAngle");
    double sweepAngle;
    if (fieldType == LuaType.luaNumber) {
      sweepAngle = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo sweepAngle is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "forceMoveTo");
    bool forceMoveTo;
    if (fieldType == LuaType.luaBoolean) {
      forceMoveTo = ls.toBoolean(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo forceMoveTo is null");
    }
    ls.pop(1);
    path.arcTo(rect, startAngle, sweepAngle, forceMoveTo);
    return 0;
  }

  static int _arcToPoint(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "arcEnd");
    Offset arcEnd;
    if (fieldType == LuaType.luaUserdata) {
      arcEnd = ls.toUserdata(-1).data as Offset;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcToPoint arcEnd is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "radius");
    Radius _radius = Radius.zero;
    if (fieldType == LuaType.luaNumber) {
      _radius = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "rotation");
    double rotation = 0;
    if (fieldType == LuaType.luaNumber) {
      rotation = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "largeArc");
    bool largeArc = false;
    if (fieldType == LuaType.luaBoolean) {
      largeArc = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "clockwise");
    bool clockwise = false;
    if (fieldType == LuaType.luaBoolean) {
      clockwise = ls.toBoolean(-1);
    }
    ls.pop(1);

    path.arcToPoint(
      arcEnd,
      radius: _radius,
      rotation: rotation,
      largeArc: largeArc,
      clockwise: clockwise,
    );
    return 0;
  }

  static int _relativeArcToPoint(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "arcEndDelta");
    Offset arcEndDelta;
    if (fieldType == LuaType.luaUserdata) {
      arcEndDelta = ls.toUserdata(-1).data as Offset;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _relativeArcToPoint arcEndDelta is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "radius");
    Radius _radius = Radius.zero;
    if (fieldType == LuaType.luaNumber) {
      _radius = Radius.circular(ls.toNumberX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "rotation");
    double rotation = 0;
    if (fieldType == LuaType.luaNumber) {
      rotation = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "largeArc");
    bool largeArc = false;
    if (fieldType == LuaType.luaBoolean) {
      largeArc = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "clockwise");
    bool clockwise = false;
    if (fieldType == LuaType.luaBoolean) {
      clockwise = ls.toBoolean(-1);
    }
    ls.pop(1);

    path.relativeArcToPoint(
      arcEndDelta,
      radius: _radius,
      rotation: rotation,
      largeArc: largeArc,
      clockwise: clockwise,
    );
    return 0;
  }

  static int _addRect(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addRect path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "rect");
    Rect rect;
    if (fieldType == LuaType.luaUserdata) {
      rect = ls.toUserdata(-1).data as Rect;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addRect rect is null");
    }
    ls.pop(1);
    path.addRect(rect);
    return 0;
  }

  static int _addOval(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addOval path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "oval");
    Rect oval;
    if (fieldType == LuaType.luaUserdata) {
      oval = ls.toUserdata(-1).data as Rect;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addOval rect is null");
    }
    ls.pop(1);
    path.addOval(oval);
    return 0;
  }

  static int _addArc(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addArc path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "oval");
    Rect oval;
    if (fieldType == LuaType.luaUserdata) {
      oval = ls.toUserdata(-1).data as Rect;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo oval is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "startAngle");
    double startAngle;
    if (fieldType == LuaType.luaNumber) {
      startAngle = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo startAngle is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "sweepAngle");
    double sweepAngle;
    if (fieldType == LuaType.luaNumber) {
      sweepAngle = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo sweepAngle is null");
    }
    ls.pop(1);
    path.addArc(oval, startAngle, sweepAngle);
    return 0;
  }

  static int _addPolygon(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addPolygon path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "points");
    List<Offset> points = List.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          points.add(ls.toUserdata(-1).data as Offset);
        }
        ls.pop(1);
      }
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterPath _addPolygon points is null',
          type: "",
          expected: "",
          source: "");
    }

    fieldType = ls.getField(-1, "close");
    bool close;
    if (fieldType == LuaType.luaBoolean) {
      close = ls.toBoolean(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcTo close is null");
    }
    ls.pop(1);

    path.addPolygon(points, close);
    return 0;
  }

  static int _addRRect(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addPolygon path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "rrect");
    RRect rrect;
    if (fieldType == LuaType.luaUserdata) {
      rrect = ls.toUserdata(-1).data as RRect;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addRRect rrect is null");
    }
    ls.pop(1);
    path.addRRect(rrect);
    return 0;
  }

  static int _addPath(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addPath path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "addPath");
    Path addPath;
    if (fieldType == LuaType.luaUserdata) {
      addPath = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addPath addPath is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "offset");
    Offset offset;
    if (fieldType == LuaType.luaUserdata) {
      offset = ls.toUserdata(-1).data as Offset;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _addPath offset is null");
    }
    ls.pop(1);
    path.addPath(addPath, offset);
    return 0;
  }

  static int _extendWithPath(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _extendWithPath path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "addPath");
    Path addPath;
    if (fieldType == LuaType.luaUserdata) {
      addPath = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _extendWithPath addPath is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "offset");
    Offset offset;
    if (fieldType == LuaType.luaUserdata) {
      offset = ls.toUserdata(-1).data as Offset;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _extendWithPath offset is null");
    }
    ls.pop(1);
    path.extendWithPath(addPath, offset);
    return 0;
  }

  static int _close(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _close path is null");
    }
    ls.pop(1);
    path.close();
    return 0;
  }

  static int _reset(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _reset path is null");
    }
    ls.pop(1);
    path.reset();
    return 0;
  }

  static int _contains(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _contains path is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "point");
    Offset point;
    if (fieldType == LuaType.luaUserdata) {
      point = ls.toUserdata(-1).data as Offset;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _arcToPoint arcEnd is null");
    }
    ls.pop(1);
    ls.pushBoolean(path.contains(point));
    return 1;
  }

  static int _getBounds(LuaState ls) {
    var fieldType = ls.getField(-1, "path");
    Path path;
    if (fieldType == LuaType.luaUserdata) {
      path = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _contains path is null");
    }
    ls.pop(1);
    ls.newUserdata().data = path.getBounds();
    return 1;
  }

  static int _combine(LuaState ls) {
    var fieldType = ls.getField(-1, "path1");
    Path path1;
    if (fieldType == LuaType.luaUserdata) {
      path1 = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _contains path1 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "path2");
    Path path2;
    if (fieldType == LuaType.luaUserdata) {
      path2 = ls.toUserdata(-1).data as Path;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _contains path2 is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "operation");
    PathOperation operation;
    if (fieldType == LuaType.luaNumber) {
      operation = FlutterPathOperation.get(ls.toIntegerX(-1));
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterPath _combine operation is null");
    }
    ls.pop(1);

    ls.newUserdata().data = Path.combine(operation, path1, path2);

    return 1;
  }

  static int _openPathLib(LuaState ls) {
    ls.newMetatable('PathClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_PathMembers, 0);
    ls.newLib(_PathWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('Path', _openPathLib, true);
    ls.pop(1);
  }
}

class FlutterPathOperation {
  static const List<String> _members = [
    "difference",
    "intersect",
    "union",
    "xor",
    "reverseDifference"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("PathOperation");
  }

  static int indexOf(PathOperation po) {
    switch (po) {
      case PathOperation.difference:
        return 0;
      case PathOperation.intersect:
        return 1;
      case PathOperation.union:
        return 2;
      case PathOperation.xor:
        return 3;
      case PathOperation.reverseDifference:
        return 4;
      default:
        return 0;
    }
  }

  static PathOperation get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return PathOperation.difference;
    }
    return PathOperation.values[idx];
  }
}
