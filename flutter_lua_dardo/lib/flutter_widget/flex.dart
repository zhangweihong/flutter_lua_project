import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/cross_axis_align.dart';
import 'package:flutter_lua_dardo/flutter_widget/main_axis_align.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/flutter_widget/textbaseline.dart';
import 'package:flutter_lua_dardo/flutter_widget/textdirection.dart';
import 'package:flutter_lua_dardo/flutter_widget/verticaldirection.dart';
import 'package:lua_dardo/lua.dart';

import 'main_axis_size.dart';

class FlutterFlex {
  static const className = "FlexClass";

  static const Map<String, DartFunction> _flexMembers = {"id": _id};

  static int _id(LuaState ls) {
    Widget p = ls.toUserdata<Object>(1).data;
    ls.pushInteger(identityHashCode(p));
    return 1;
  }

  static void openFlex(LuaState ls) {
    ls.newMetatable(className);
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_flexMembers, 0);
  }

  static bool newFlex<T>(LuaState ls, [String subclass]) {
    var args = ls.getTop();
    if (args == 0 || !ls.isTable(-1)) {
      return false;
    }

    MainAxisSize mainAxisSize;
    MainAxisAlignment mainAxisAlignment;
    CrossAxisAlignment crossAxisAlignment;
    List<Widget> children = <Widget>[];

    var fieldType = ls.getField(-1, "mainAxisSize");
    if (fieldType == LuaType.luaNumber) {
      mainAxisSize = FlutterMainAxisSize.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else if (fieldType == LuaType.luaNil) {
      mainAxisSize = MainAxisSize.max;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'mainAxisSize',
          type: ls.typeName(fieldType),
          expected: "int",
          source: subclass + " newFlex");
    }

    fieldType = ls.getField(-1, "mainAxisAlignment");
    if (fieldType == LuaType.luaNumber) {
      mainAxisAlignment = FlutterMainAxisAlign.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else if (fieldType == LuaType.luaNil) {
      mainAxisAlignment = MainAxisAlignment.start;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'mainAxisAlignment',
          type: ls.typeName(fieldType),
          expected: "int",
          source: subclass + " newFlex");
    }

    fieldType = ls.getField(-1, "crossAxisAlignment");
    if (fieldType == LuaType.luaNumber) {
      crossAxisAlignment = FlutterCrossAxisAlign.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else if (fieldType == LuaType.luaNil) {
      crossAxisAlignment = CrossAxisAlignment.center;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'crossAxisAlignment',
          type: ls.typeName(fieldType),
          expected: "int",
          source: subclass + " newFlex");
    }

    fieldType = ls.getField(-1, "children");
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);

      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          children.add(ls.toUserdata(-1).data as Widget);
        }
        ls.pop(1);
      }
    } else if (fieldType == LuaType.luaNil) {
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'children',
          type: ls.typeName(fieldType),
          expected: "List",
          source: subclass + " newFlex");
    }

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "textDirection");
    TextDirection textDirection;
    if (fieldType == LuaType.luaNumber) {
      textDirection = FlutterTextDirection.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "verticalDirection");
    VerticalDirection verticalDirection = VerticalDirection.down;
    if (fieldType == LuaType.luaNumber) {
      verticalDirection = FlutterVerticalDirection.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "textBaseline");
    TextBaseline textBaseline;
    if (fieldType == LuaType.luaNumber) {
      textBaseline = FlutterTextBaseline.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata u = ls.newUserdata<T>();
    if (T == Column) {
      u.data = Column(
        key: key,
        children: children,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
      );
    } else if (T == Row) {
      u.data = Row(
        key: key,
        children: children,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
      );
    }

    ls.getMetatableAux(className);
    ls.setMetatable(-2);

    return true;
  }
}
