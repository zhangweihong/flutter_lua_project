import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/brightness.dart';
import 'package:flutter_lua_dardo/index.dart';

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
    fieldType = ls.getField(-1, "automaticallyImplyLeading");
    bool automaticallyImplyLeading = true;
    if (fieldType == LuaType.luaBoolean) {
      automaticallyImplyLeading = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "flexibleSpace");
    Widget flexibleSpace;
    if (fieldType == LuaType.luaUserdata) {
      flexibleSpace = ls.toUserdata(-1) as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "bottom");
    var bottom;
    if (fieldType == LuaType.luaUserdata) {
      bottom = ls.toUserdata(-1) as PreferredSizeWidget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "elevation");
    double elevation;
    if (fieldType == LuaType.luaNumber) {
      elevation = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "scrolledUnderElevation");
    double scrolledUnderElevation;
    if (fieldType == LuaType.luaNumber) {
      scrolledUnderElevation = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "shadowColor");
    Color shadowColor;
    if (fieldType == LuaType.luaUserdata) {
      shadowColor = ls.toUserdata(-1) as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "surfaceTintColor");
    Color surfaceTintColor;
    if (fieldType == LuaType.luaUserdata) {
      shadowColor = ls.toUserdata(-1) as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "backgroundColor");
    Color backgroundColor;
    if (fieldType == LuaType.luaUserdata) {
      backgroundColor = ls.toUserdata(-1) as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "foregroundColor");
    Color foregroundColor;
    if (fieldType == LuaType.luaUserdata) {
      foregroundColor = ls.toUserdata(-1) as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "brightness");
    Brightness brightness;
    if (fieldType == LuaType.luaUserdata) {
      brightness = FlutterBrightness.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<AppBar>();
    userdata.data = AppBar(
        key: key,
        leading: leadingW,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: titleW,
        actions: actions,
        flexibleSpace: flexibleSpace,
        bottom: bottom,
        elevation: elevation,
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        brightness: brightness);
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
