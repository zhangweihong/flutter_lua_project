import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/alignment.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/widget/stackfit.dart';

class FlutterStack {
  static const Map<String, DartFunction> _StackWrap = {"new": _newStack};

  static const Map<String, DartFunction> _StackMembers = {"id": null};

  static int _newStack(LuaState ls) {
    List<Widget> children = <Widget>[];

    var fieldType = ls.getField(-1, "children");
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
          name: 'FlutterStack Error',
          type: ls.typeName(fieldType),
          expected: "",
          source: "stack.dart");
    }
    ls.pop(1);

    Alignment alignment = Alignment.topLeft;
    fieldType = ls.getField(-1, "alignment");
    if (fieldType == LuaType.luaNumber) {
      alignment = FlutterAlignment.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "fit");
    var fit = StackFit.loose;
    if (fieldType == LuaType.luaNumber) {
      fit = FlutterStackFit.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = Stack(children: children, fit: fit, alignment: alignment);
    return 1;
  }

  static int _openContainerLib(LuaState ls) {
    ls.newMetatable("StackClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_StackMembers, 0);

    ls.newLib(_StackWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Stack", _openContainerLib, true);
    ls.pop(1);
  }
}
