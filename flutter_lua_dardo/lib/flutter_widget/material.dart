import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterMaterialType {
  static const List<String> _members = [
    "canvas",
    "card",
    "circle",
    "button",
    "transparency"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("MaterialType");
  }

  static MaterialType get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return MaterialType.canvas;
    }
    return MaterialType.values[idx];
  }
}

class FlutterMaterial {
  static const Map<String, DartFunction> _MaterialWrap = {
    'new': _newMaterialWrap,
  };

  static const Map<String, DartFunction> _MaterialMembers = {'id': null};

  static int _newMaterialWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "type");
    var type = MaterialType.canvas;
    if (fieldType == LuaType.luaNumber) {
      type = FlutterMaterialType.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "elevation");
    double elevation = 0;
    if (fieldType == LuaType.luaNumber) {
      elevation = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "color");
    var color;
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "shadowColor");
    var shadowColor;
    if (fieldType == LuaType.luaUserdata) {
      shadowColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "surfaceTintColor");
    var surfaceTintColor;
    if (fieldType == LuaType.luaUserdata) {
      surfaceTintColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "textStyle");
    var textStyle;
    if (fieldType == LuaType.luaUserdata) {
      textStyle = ls.toUserdata(-1).data as TextStyle;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "borderRadius");
    BorderRadius borderRadius;
    if (fieldType == LuaType.luaUserdata) {
      borderRadius = ls.toUserdata(-1).data as BorderRadius;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "borderOnForeground");
    bool borderOnForeground = true;
    if (fieldType == LuaType.luaBoolean) {
      borderOnForeground = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "clipBehavior");
    var clipBehavior = Clip.none;
    if (fieldType == LuaType.luaNumber) {
      clipBehavior = FlutterClip.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "child");
    Widget child;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "animationDuration");
    var animationDuration = Duration(milliseconds: 200);
    if (fieldType == LuaType.luaNumber) {
      animationDuration = Duration(milliseconds: ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    ls.newUserdata().data = Material(
      key: key,
      type: type,
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      textStyle: textStyle,
      borderRadius: borderRadius,
      borderOnForeground: borderOnForeground,
      clipBehavior: clipBehavior,
      animationDuration: animationDuration,
      child: child,
    );
    return 1;
  }

  static int _openMaterialLib(LuaState ls) {
    ls.newMetatable('MaterialClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_MaterialMembers, 0);
    ls.newLib(_MaterialWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('Material', _openMaterialLib, true);
    ls.pop(1);
  }
}
