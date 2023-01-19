import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterAspectRatio {
  static const Map<String, DartFunction> _AspectRatioWrap = {
    "new": _newAspectRatio
  };

  static const Map<String, DartFunction> _AspectRatioMembers = {"id": null};

  static int _newAspectRatio(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    double aspectRatio = null;
    fieldType = ls.getField(-1, "aspectRatio");
    if (fieldType == LuaType.luaNumber) {
      aspectRatio = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data =
        AspectRatio(key: key, child: child, aspectRatio: aspectRatio);
    return 1;
  }

  static int _openAspectRatioLib(LuaState ls) {
    ls.newMetatable("AspectRatioClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_AspectRatioMembers, 0);

    ls.newLib(_AspectRatioWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("AspectRatio", _openAspectRatioLib, true);
    ls.pop(1);
  }
}
