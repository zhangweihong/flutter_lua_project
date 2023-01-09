import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class FlutterScaffold {
  static const Map<String, DartFunction> _scafflodWrap = {"new": _newScaffold};

  static const Map<String, DartFunction> _ScafflodMembers = {"id": null};

  static int _newScaffold(LuaState ls) {
    if (ls.getTop() > 0) {
      Widget body = null;
      Widget appbar = null;
      var fieldType = ls.getField(-1, "body");
      if (fieldType == LuaType.luaUserdata) {
        body = ls.toUserdata(-1).data as Widget;
        ls.pop(1);
      } else {
        ls.pop(1);
        new ParameterError(
            name: "FlutterScaffold body",
            type: "body Error",
            expected: "FlutterScaffold body null",
            source: "FlutterScaffold");
      }
      fieldType = ls.getField(-1, "appBar");
      if (fieldType == LuaType.luaUserdata) {
        appbar = ls.toUserdata(-1).data as AppBar;
        ls.pop(1);
      } else {
        appbar = null;
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<Scaffold>();
      userdata.data = Scaffold(
        key: key,
        body: body,
        appBar: appbar,
      );
    }

    return 1;
  }

  static int _openScaffoldLib(LuaState ls) {
    ls.newMetatable("ScafflodClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ScafflodMembers, 0);
    ls.newLib(_scafflodWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Scaffold", _openScaffoldLib, true);
    ls.pop(1);
  }
}
