import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:vector_math/vector_math_64.dart';

class FlutterMatrix4 {
  static Map<String, DartFunction> _Matrix4wWrap = {
    "zero": _zeroWrap,
    "skew": _skewWrap,
    "skewX": _skewWrapXWrap,
    "skewY": _skewWrapYWrap,
    "diagonal3Values": _diagonal3ValuesWrap,
    // "compose": _composeWrap,
    "rotationX": _rotationXWrap,
    "rotationY": _rotationYWrap,
    "rotationZ": _rotationZWrap,
    "tryInvert": _tryInvertWrap,
    "translationValues": _translationValuesWrap,
    "solve": _solveWrap,
  };

  static int _zeroWrap(LuaState ls) {
    Userdata userdata = ls.newUserdata<Matrix4>();
    userdata.data = Matrix4.zero();
    return 1;
  }

  static int _skewWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "alpha");
      double alpha;
      if (fieldType == LuaType.luaNumber) {
        alpha = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "alpha",
            source: "FlutterMatrix4 _skewWrap alpha is null");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "beta");
      double beta;
      if (fieldType == LuaType.luaNumber) {
        beta = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "beta",
            source: "FlutterMatrix4 beta is null");
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Matrix4>();
      userdata.data = Matrix4.skew(alpha, beta);
    }
    return 1;
  }

  static int _skewWrapXWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "alpha");
      double alpha;
      if (fieldType == LuaType.luaNumber) {
        alpha = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "alpha",
            source: "FlutterMatrix4 _skewWrapX alpha is null");
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Matrix4>();
      userdata.data = Matrix4.skewX(alpha);
    }
    return 1;
  }

  static int _skewWrapYWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "beta");
      double beta;
      if (fieldType == LuaType.luaNumber) {
        beta = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "beta",
            source: "FlutterMatrix4 _skewWrapY beta is null");
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Matrix4>();
      userdata.data = Matrix4.skewY(beta);
    }
    return 1;
  }

  static int _diagonal3ValuesWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "x");
      double x;
      if (fieldType == LuaType.luaNumber) {
        x = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "",
            source: "FlutterMatrix4 _diagonal3ValuesWrap x is null");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "y");
      double y;
      if (fieldType == LuaType.luaNumber) {
        x = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "",
            source: "FlutterMatrix4 _diagonal3ValuesWrap y is null");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "z");
      double z;
      if (fieldType == LuaType.luaNumber) {
        x = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "",
            source: "FlutterMatrix4 _diagonal3ValuesWrap z is null");
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Matrix4>();
      userdata.data = Matrix4.diagonal3Values(x, y, z);
    }
    return 1;
  }

  static int _rotationXWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      double value;
      if (ls.isNumber(-1)) {
        value = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: '',
            expected: "",
            source: "FlutterMatrix4 _rotationXWrap value is null");
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Matrix4>();
      userdata.data = Matrix4.rotationX(value);
    }
    return 1;
  }

  static int _rotationYWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      double value;
      if (ls.isNumber(-1)) {
        value = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: '',
            expected: "",
            source: "FlutterMatrix4 _rotationYWrap value is null");
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Matrix4>();
      userdata.data = Matrix4.rotationY(value);
    }
    return 1;
  }

  static int _rotationZWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      double value;
      if (ls.isNumber(-1)) {
        value = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: '',
            expected: "",
            source: "FlutterMatrix4 _rotationZWrap value is null");
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Matrix4>();
      userdata.data = Matrix4.rotationZ(value);
    }
    return 1;
  }

  static int _translationValuesWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "x");
      double x;
      if (fieldType == LuaType.luaNumber) {
        x = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "",
            source: "FlutterMatrix4 _translationValuesWrap x is null");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "y");
      double y;
      if (fieldType == LuaType.luaNumber) {
        x = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "",
            source: "FlutterMatrix4 _translationValuesWrap y is null");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "z");
      double z;
      if (fieldType == LuaType.luaNumber) {
        x = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: ls.typeName(fieldType),
            expected: "",
            source: "FlutterMatrix4 _translationValuesWrap z is null");
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Matrix4>();
      userdata.data = Matrix4.translationValues(x, y, z);
    }
    return 1;
  }

  static int _tryInvertWrap(LuaState ls) {
    var filedType = ls.getField(-1, "other");
    if (filedType == LuaType.luaUserdata) {
      var other = ls.toUserdata(-1).data as Matrix4;
      ls.pop(1);
      if (other == null) {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: '',
            expected: "",
            source: "FlutterMatrix4 _tryInvertWrap other is null 1");
      }
      Userdata userdata = ls.newUserdata<Matrix4>();
      userdata.data = Matrix4.tryInvert(other);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterMatrix4',
          type: '',
          expected: "",
          source: "FlutterMatrix4 _tryInvertWrap other is null 2");
    }
    return 1;
  }

  static int _solveWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "A");
      Matrix4 A = Matrix4.zero();
      if (fieldType == LuaType.luaUserdata) {
        A = ls.toUserdata(-1).data as Matrix4;
        ls.pop(1);
        if (A == null) {
          throw ParameterError(
              name: 'FlutterMatrix4',
              type: '',
              expected: "",
              source: "FlutterMatrix4 _solveWrap A is null 1");
        }
        fieldType = ls.getField(-1, "x");
        Vector4 x = Vector4.zero();
        if (fieldType == LuaType.luaTable) {
          fieldType = ls.getField(-1, "x");
          double x_v_x = 0;
          if (fieldType == LuaType.luaNumber) {
            x_v_x = ls.toNumberX(-1);
          }
          ls.pop(1);

          fieldType = ls.getField(-1, "y");
          double x_v_y = 0;
          if (fieldType == LuaType.luaNumber) {
            x_v_y = ls.toNumberX(-1);
          }
          ls.pop(1);

          fieldType = ls.getField(-1, "z");
          double x_v_z = 0;
          if (fieldType == LuaType.luaNumber) {
            x_v_z = ls.toNumberX(-1);
          }
          ls.pop(1);

          fieldType = ls.getField(-1, "w");
          double x_v_w = 0;
          if (fieldType == LuaType.luaNumber) {
            x_v_w = ls.toNumberX(-1);
          }
          ls.pop(1);
          x = Vector4(x_v_x, x_v_y, x_v_z, x_v_w);

          fieldType = ls.getField(-1, "b");
          Vector4 b = Vector4.zero();
          if (fieldType == LuaType.luaTable) {
            fieldType = ls.getField(-1, "x");
            double b_v_x = 0;
            if (fieldType == LuaType.luaNumber) {
              b_v_x = ls.toNumberX(-1);
            }
            ls.pop(1);

            fieldType = ls.getField(-1, "y");
            double b_v_y = 0;
            if (fieldType == LuaType.luaNumber) {
              b_v_y = ls.toNumberX(-1);
            }
            ls.pop(1);

            fieldType = ls.getField(-1, "z");
            double b_v_z = 0;
            if (fieldType == LuaType.luaNumber) {
              b_v_z = ls.toNumberX(-1);
            }
            ls.pop(1);

            fieldType = ls.getField(-1, "w");
            double b_v_w = 0;
            if (fieldType == LuaType.luaNumber) {
              b_v_w = ls.toNumberX(-1);
            }
            ls.pop(1);
            b = Vector4(b_v_x, b_v_y, b_v_z, b_v_w);
            Matrix4.solve(A, x, b);
          } else {
            throw ParameterError(
                name: 'FlutterMatrix4',
                type: '',
                expected: "",
                source: "FlutterMatrix4 _solveWrap X is null");
          }
          ls.pop(1);
        } else {
          throw ParameterError(
              name: 'FlutterMatrix4',
              type: '',
              expected: "",
              source: "FlutterMatrix4 _solveWrap X is null");
        }
        ls.pop(1);
      } else {
        throw ParameterError(
            name: 'FlutterMatrix4',
            type: '',
            expected: "",
            source: "FlutterMatrix4 _solveWrap A is null 2");
      }
    }
    return 1;
  }
  // static int _composeWrap(LuaState ls) {
  //   if (ls.getTop() > 0) {
  //     var fieldType = ls.getField(-1, "translation");
  //     Vector3 translation = Vector3.zero();
  //     if (fieldType == LuaType.luaTable) {

  //     }

  //     ls.pop(1);

  //     fieldType = ls.getField(-1, "rotation");
  //     Quaternion rotation = Quaternion.;
  //     ls.pop(1);

  //     fieldType = ls.getField(-1, "scale");
  //     Vector3 scale = Vector3.zero();
  //     ls.pop(1);

  //     Userdata userdata = ls.newUserdata<Matrix4>();
  //     userdata.data = Matrix4.compose(translation, rotation, scale);
  //   }
  //   return 1;
  // }

  static void require(LuaState ls) {
    ls.requireF("Matrix4", _openMatrix4Lib, true);
    ls.pop(1);
  }

  static int _openMatrix4Lib(LuaState ls) {
    ls.newLib(_Matrix4wWrap);
    return 1;
  }
}
