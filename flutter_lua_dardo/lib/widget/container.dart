import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/align.dart';
import 'package:flutter_lua_dardo/widget/alignment.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class FlutterContainer {
  static const Map<String, DartFunction> _ContainerWrap = {
    "new": _newContainer
  };

  static const Map<String, DartFunction> _ContainerMembers = {"id": null};

  static int _newContainer(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      throw ParameterError(
          name: 'FlutterContainer child',
          type: ls.typeName(fieldType),
          expected: "Container child",
          source: "FlutterContainer child not Widget");
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

    var margin = EdgeInsets.all(0);
    fieldType = ls.getField(-1, "margin");
    if (fieldType == LuaType.luaUserdata) {
      margin = ls.toUserdata(-1).data as EdgeInsets;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    var padding = EdgeInsets.all(0);
    fieldType = ls.getField(-1, "padding");
    if (fieldType == LuaType.luaUserdata) {
      padding = ls.toUserdata(-1).data as EdgeInsets;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "alignment");
    var alignment = Alignment.topLeft;
    if (fieldType == LuaType.luaNumber) {
      alignment = FlutterAlignment.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    BoxConstraints constraints =
        BoxConstraints.tightFor(width: width, height: height);
    fieldType = ls.getField(-1, "decoration");
    if (fieldType == LuaType.luaNil) {
      ls.pop(1);
      Color _color = Colors.white;
      fieldType = ls.getField(-1, "color");
      if (fieldType == LuaType.luaUserdata) {
        _color = ls.toUserdata(-1).data as Color;
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      Userdata userdata = ls.newUserdata<Widget>();
      userdata.data = Container(
        child: child,
        margin: margin,
        padding: padding,
        color: _color,
      );
    } else if (fieldType == LuaType.luaUserdata) {
      Decoration decoration = ls.toUserdata(-1).data as BoxDecoration;
      ls.pop(1);
      Userdata userdata = ls.newUserdata<Widget>();

      userdata.data = Container(
        alignment: alignment,
        constraints: constraints,
        child: child,
        margin: margin,
        padding: padding,
        decoration: decoration,
      );
    }
    return 1;
  }

  static int _openContainerLib(LuaState ls) {
    ls.newMetatable("ContainerClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ContainerMembers, 0);

    ls.newLib(_ContainerWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Container", _openContainerLib, true);
    ls.pop(1);
  }
}
