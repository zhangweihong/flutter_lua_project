import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterCurves {
  static const List<String> _members = [
    "linear",
    "decelerate",
    "bounceIn",
    "bounceInOut",
    "bounceOut",
    "ease",
    "easeIn",
    "easeInBack",
    "easeInCirc",
    "easeInCubic",
    "easeInExpo",
    "easeInOut",
    "easeInOutBack",
    "easeInOutCirc",
    "easeInOutCubic",
    "easeInOutCubicEmphasized",
    "easeInOutExpo",
    "easeInOutQuad",
    "easeOutQuart",
    "easeInOutQuint",
    "easeInOutSine",
    "easeInQuad",
    "easeInQuart",
    "easeInOutQuint",
    "easeOutSine",
    "easeInToLinear",
    "easeOut",
    "easeOutBack",
    "easeOutCirc",
    "easeOutCubic",
    "easeOutExpo",
    "easeOutQuad",
    "elasticIn",
    "elasticInOut",
    "elasticOut",
    "fastLinearToSlowEaseIn",
    "linearToEaseOut",
    "slowMiddle",
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("Curves");
  }

  static Curve get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return Curves.linear;
    }

    switch (idx) {
      case 0:
        return Curves.linear;
      case 1:
        return Curves.decelerate;
      case 2:
        return Curves.bounceIn;
      case 3:
        return Curves.bounceInOut;
      case 4:
        return Curves.bounceOut;
      case 5:
        return Curves.ease;
      case 6:
        return Curves.easeIn;
      case 7:
        return Curves.easeInBack;
      case 8:
        return Curves.easeInCirc;
      case 9:
        return Curves.easeInCubic;
      case 10:
        return Curves.easeInExpo;
      case 11:
        return Curves.easeInOut;
      case 12:
        return Curves.easeInOutBack;
      case 13:
        return Curves.easeInOutCirc;
      case 14:
        return Curves.easeInOutCubic;
      case 15:
        return Curves.easeInOutCubicEmphasized;
      case 16:
        return Curves.easeInOutExpo;
      case 17:
        return Curves.easeInOutQuad;
      case 18:
        return Curves.easeOutQuart;
      case 19:
        return Curves.easeInOutQuint;
      case 20:
        return Curves.easeInOutSine;
      case 21:
        return Curves.easeInQuad;
      case 22:
        return Curves.easeInQuart;
      case 23:
        return Curves.easeInOutQuint;
      case 24:
        return Curves.easeOutSine;
      case 25:
        return Curves.easeInToLinear;
      case 26:
        return Curves.easeOut;
      case 27:
        return Curves.easeOutBack;
      case 28:
        return Curves.easeOutCirc;
      case 30:
        return Curves.easeOutCubic;
      case 31:
        return Curves.easeOutExpo;
      case 32:
        return Curves.easeOutQuad;
      case 33:
        return Curves.elasticIn;
      case 34:
        return Curves.elasticInOut;
      case 35:
        return Curves.elasticOut;
      case 36:
        return Curves.fastLinearToSlowEaseIn;
      case 37:
        return Curves.linearToEaseOut;
      case 38:
        return Curves.slowMiddle;
      default:
        return Curves.linear;
    }
  }
}
