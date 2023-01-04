import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class Nav {
  static int navPush(LuaState ls) {
    var fieldType = ls.getField(-1, "ctx");
    BuildContext context;
    if (fieldType == LuaType.luaUserdata) {
      context = ls.toUserdata(-1).data as BuildContext;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "NavPush context Null",
          type: "NavPush",
          expected: "NavPush",
          source: "NavPush context Null");
    }
    fieldType = ls.getField(-1, "widget");
    Widget w;
    if (fieldType == LuaType.luaUserdata) {
      w = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "NavPush next Null",
          type: "NavPush",
          expected: "NavPush",
          source: "NavPush next Null");
    }
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return w;
      },
    ));
    return 0;
  }
}
