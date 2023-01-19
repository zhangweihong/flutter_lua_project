import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterSpacer {
  static const Map<String, DartFunction> _SpacerWrap = {"new": _newSpace};

  static const Map<String, DartFunction> _SpacerMembers = {"id": null};

  static int _newSpace(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    int flex = 1;
    if (fieldType == LuaType.luaNumber) {
      flex = ls.toIntegerX(-1);
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

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = Spacer(
      key: key,
      flex: flex,
    );
    return 1;
  }

  static int _openSpaceLib(LuaState ls) {
    ls.newMetatable("SpacerClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_SpacerMembers, 0);

    ls.newLib(_SpacerWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Spacer", _openSpaceLib, true);
    ls.pop(1);
  }
}
