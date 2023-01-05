import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/init_widget.dart';

class FlutterAppBar {
  static const className = "AppBarClass";
  static const Map<String, DartFunction> _appBarWrap = {
    "new": _newAppBar,
  };

  static const Map<String, DartFunction> _appBarMembers = {"id": null};

  static int _newAppBar(LuaState ls) {
    var fieldType = ls.getField(-1, "leading");
    Widget leadingW = null;
    Widget titleW = null;
    List<Widget> actions = List.empty(growable: true);
    if (fieldType == LuaType.luaUserdata) {
      leadingW = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "title");
    if (fieldType == LuaType.luaUserdata) {
      titleW = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "actions");
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);

      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          actions.add(ls.toUserdata(-1).data as Widget);
        }
        ls.pop(1);
      }
      ls.pop(1);
    } else {
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

    Userdata userdata = ls.newUserdata<AppBar>();
    userdata.data = AppBar(
      key: key,
      leading: leadingW,
      title: titleW,
      actions: actions,
    );
    return 1;
  }

  static int _openAppBarLib(LuaState ls) {
    ls.newMetatable(className);
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_appBarMembers, 0);

    ls.newLib(_appBarWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("AppBar", _openAppBarLib, true);
    ls.pop(1);
  }
}
