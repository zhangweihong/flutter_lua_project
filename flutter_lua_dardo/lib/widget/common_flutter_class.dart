import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';
import 'package:lua_dardo/lua.dart';

class FlutterMainAxisSize {
  static const List<String> _members = [
    "min",
    "max",
  ];
  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("MainAxisSize");
  }

  static MainAxisSize get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return MainAxisSize.max;
    }
    return MainAxisSize.values[idx];
  }
}

class FlutterMainAxisAlign {
  static const List<String> _members = [
    "start",
    "bottom",
    "center",
    "spaceBetween",
    "spaceAround",
    "spaceEvenly"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("MainAxisAlignment");
  }

  static MainAxisAlignment get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return MainAxisAlignment.start;
    }
    return MainAxisAlignment.values[idx];
  }
}

class FlutterIconData {
  static const List<String> _members = [
    "ac_unit",
    "arrow_back",
    "arrow_downward",
    "arrow_forward",
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("Icons");
  }

  static IconData get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return null;
    }
    switch (idx) {
      case 0:
        return Icons.ac_unit;
      case 1:
        return Icons.arrow_back;
      case 2:
        return Icons.arrow_downward;
      case 3:
        return Icons.arrow_forward;
      default:
        return null;
    }
  }
}

class FlutterCrossAxisAlign {
  static const List<String> _members = [
    "start",
    "bottom",
    "center",
    "stretch",
    "baseline"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("CrossAxisAlignment");
  }

  static CrossAxisAlignment get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return CrossAxisAlignment.center;
    }
    return CrossAxisAlignment.values[idx];
  }
}

class FlutterBoxFit {
  static const List<String> _members = [
    "fill",
    "contain",
    "cover",
    "fitWidth",
    "fitHeight",
    "none",
    "scaleDown",
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("BoxFit");
  }

  static BoxFit get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return BoxFit.fill;
    }
    return BoxFit.values[idx];
  }
}

class FlutterFontWeight {
  static const List<String> _members = [
    "w100",
    "w200",
    "w300",
    "w400",
    "w500",
    "w600",
    "w700",
    "w800",
    "w900",
    "normal",
    "bold"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("FontWeight");
  }

  static FontWeight get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return FontWeight.normal;
    }
    if (idx == _members.length - 2) {
      idx = 3;
    }
    if (idx == _members.length - 1) {
      idx = 6;
    }
    return FontWeight.values[idx];
  }
}

class FlutterAlignment {
  static const List<String> _members = [
    "topLeft",
    "topCenter",
    "topRight",
    "centerLeft",
    "center",
    "centerRight",
    "bottomLeft",
    "bottomCenter",
    "bottomRight"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("Alignment");
  }

  static AlignmentGeometry get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return Alignment.topLeft;
    }
    switch (idx) {
      case 0:
        return Alignment.topLeft;
      case 1:
        return Alignment.topCenter;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.centerLeft;
      case 4:
        return Alignment.center;
      case 5:
        return Alignment.centerRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
    }
    return Alignment.topLeft;
  }
}

class FlutterColors {
  static void require(LuaState ls) {
    ls.register("Color", _colorsWrap);
  }

  static int _colorsWrap(LuaState ls) {
    String s = ls.checkString(1);
    int color = 0xffffffff;
    if (s.isNotEmpty) {
      if (s.indexOf("#") == 0) {
        s = s.replaceAll("#", "");
        if (s.length < 9) {
          int endLen = 8 - s.length;
          for (var i = 0; i < endLen; i++) {
            s = "f" + s;
          }
        }

        s = "0x" + s;
        color = int.tryParse(s);
      } else {
        throw Exception("Color is Error No #");
      }

      Userdata userdata = ls.newUserdata<Color>();
      userdata.data = Color(color);
    }
    return 1;
  }
}

class FlutterEdgeInsets {
  static const Map<String, DartFunction> _EdgeInsetsWrap = {
    "only": _edgeInsetOnly,
    "all": _edgeInsetAll
  };

  static int _openEdgeInsetsLib(LuaState ls) {
    ls.newLib(_EdgeInsetsWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("EdgeInsets", _openEdgeInsetsLib, true);
    ls.pop(1);
  }

  static int _edgeInsetOnly(LuaState ls) {
    double top, left, bottom, right = 0;
    var fieldType = ls.getField(-1, "top");
    if (fieldType == LuaType.luaNumber) {
      top = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "left");
    if (fieldType == LuaType.luaNumber) {
      left = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "bottom");
    if (fieldType == LuaType.luaNumber) {
      bottom = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "right");
    if (fieldType == LuaType.luaNumber) {
      right = ls.toNumberX(-1);
      ls.pop(1);
    } else {}

    Userdata userdata = ls.newUserdata<EdgeInsets>();
    userdata.data =
        EdgeInsets.only(top: top, left: left, bottom: bottom, right: right);

    return 1;
  }

  static int _edgeInsetAll(LuaState ls) {
    double value = 0;
    var isNum = ls.isNumber(-1);
    if (isNum) {
      value = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      throw ParameterError(
          name: 'EdgeInsets Value',
          type: "Number ",
          expected: "EdgeInsets All Error",
          source: "FlutterEdgeInsets ");
    }

    Userdata userdata = ls.newUserdata<EdgeInsets>();
    userdata.data = EdgeInsets.all(value);
    return 1;
  }
}

class FlutterBorder {
  static const Map<String, DartFunction> _BorderWrap = {
    "new": _borderNew,
    "all": _borderAll
  };

  static int _openBorderLib(LuaState ls) {
    ls.newLib(_BorderWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Border", _openBorderLib, true);
    ls.pop(1);
  }

  static BorderSide getBorderSide(LuaState ls) {
    double width = 1;
    Color color = const Color(0xFF000000);
    var fieldType = ls.getField(-1, "width");
    if (fieldType == LuaType.luaNumber) {
      width = ls.toNumberX(-1);
    }
    ls.pop(1);
    fieldType = ls.getField(-1, "color");
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);
    return BorderSide(style: BorderStyle.solid, width: width, color: color);
  }

  static int _borderNew(LuaState ls) {
    BorderSide top_side = BorderSide.none;
    var fieldType = ls.getField(-1, "top");
    if (fieldType == LuaType.luaTable) {
      top_side = getBorderSide(ls);
    }
    ls.pop(1);
    BorderSide bottom_side = BorderSide.none;
    fieldType = ls.getField(-1, "bottom");
    if (fieldType == LuaType.luaTable) {
      bottom_side = getBorderSide(ls);
    }
    ls.pop(1);
    BorderSide left_side = BorderSide.none;
    fieldType = ls.getField(-1, "left");
    if (fieldType == LuaType.luaTable) {
      left_side = getBorderSide(ls);
    }
    ls.pop(1);
    BorderSide right_side = BorderSide.none;
    fieldType = ls.getField(-1, "right");
    if (fieldType == LuaType.luaTable) {
      right_side = getBorderSide(ls);
    }
    ls.pop(1);
    Userdata userdata = ls.newUserdata<Border>();
    userdata.data = Border(
        top: top_side, bottom: bottom_side, left: left_side, right: right_side);
    return 1;
  }

  static int _borderAll(LuaState ls) {
    double width = 1;
    Color color = const Color(0xFF000000);
    var fieldType = ls.getField(-1, "width");
    if (fieldType == LuaType.luaNumber) {
      width = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "color");
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Border>();
    userdata.data =
        Border.all(style: BorderStyle.solid, width: width, color: color);
    return 1;
  }
}

class FlutterBorderRadius {
  static const Map<String, DartFunction> _BorderRadiusWrap = {
    "only": _borderRadiusOnly,
    "all": _borderRadiusAll
  };

  static int _openBorderRadiusLib(LuaState ls) {
    ls.newLib(_BorderRadiusWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("BorderRadius", _openBorderRadiusLib, true);
    ls.pop(1);
  }

  static int _borderRadiusOnly(LuaState ls) {
    double tl, tr, bl, br = 0;
    var fieldType = ls.getField(-1, "topLeft");
    if (fieldType == LuaType.luaNumber) {
      tl = ls.toNumberX(-1);
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "topRight");
    if (fieldType == LuaType.luaNumber) {
      tr = ls.toNumberX(-1);
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "bottomLeft");
    if (fieldType == LuaType.luaNumber) {
      bl = ls.toNumberX(-1);
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "bottomRight");
    if (fieldType == LuaType.luaNumber) {
      br = ls.toNumberX(-1);
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<BorderRadius>();
    userdata.data = BorderRadius.only(
        topLeft: Radius.circular(tl),
        topRight: Radius.circular(tr),
        bottomLeft: Radius.circular(bl),
        bottomRight: Radius.circular(br));

    return 1;
  }

  static int _borderRadiusAll(LuaState ls) {
    double value = 0;
    bool isNum = ls.isNumber(-1);
    if (isNum) {
      value = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    Userdata userdata = ls.newUserdata<BorderRadius>();
    userdata.data = BorderRadius.all(Radius.circular(value));
    return 1;
  }
}

class FlutterBoxDecoration {
  static Map<String, DartFunction> _boxDecorationWrap = {
    "new": _newBoxDecoration
  };

  static int _newBoxDecoration(LuaState ls) {
    Color bgColor = Colors.white;
    var fieldType = ls.getField(-1, "color");
    if (fieldType == LuaType.luaUserdata) {
      bgColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "borderRadius");
    var radius = BorderRadius.zero;
    if (fieldType == LuaType.luaUserdata) {
      radius = ls.toUserdata(-1).data as BorderRadius;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "border");
    Border border;
    if (fieldType == LuaType.luaUserdata) {
      border = ls.toUserdata(-1).data as Border;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<BoxDecoration>();
    userdata.data =
        BoxDecoration(color: bgColor, borderRadius: radius, border: border);
    return 1;
  }

  static int _openBoxDecorationLib(LuaState ls) {
    ls.newLib(_boxDecorationWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("BoxDecoration", _openBoxDecorationLib, true);
    ls.pop(1);
  }
}
