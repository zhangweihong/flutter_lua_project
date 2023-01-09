import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/flex.dart';
import 'package:lua_dardo/lua.dart';

class FlutterColumn {
  static const className = "FlutterColumn";
  static const Map<String, DartFunction> _columnFunc = {
    "new": _newColumn,
  };

  static int _newColumn(LuaState ls) {
    if (FlutterFlex.newFlex<Column>(ls, className)) {
      return 1;
    }
    throw Exception("Failed to instantiate FlutterFlex!");
  }

  static int _openRowLib(LuaState ls) {
    FlutterFlex.openFlex(ls);

    ls.newLib(_columnFunc);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Column", _openRowLib, true);
    ls.pop(1);
  }
}
