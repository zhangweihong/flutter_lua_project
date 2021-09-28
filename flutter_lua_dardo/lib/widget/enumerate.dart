import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    if (s.isNotEmpty) {
      Userdata userdata = ls.newUserdata<Color>();
      int color = int.tryParse(s.replaceAll("#", "0x"));
      userdata.data = Color(color);
    }
    return 1;
  }
}
