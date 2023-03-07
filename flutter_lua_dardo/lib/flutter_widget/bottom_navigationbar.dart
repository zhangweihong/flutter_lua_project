import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/bottom_navigationbartype.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterBottomNavigationBar {
  static const Map<String, DartFunction> _BottomNavigationBarWrap = {
    "new": _newBottomNavigationBar
  };

  static const Map<String, DartFunction> _BottomNavigationBarMembers = {
    "id": null
  };

  static int _newBottomNavigationBar(LuaState ls) {
    var fieldType = ls.getField(-1, "items");
    var items = List<BottomNavigationBarItem>.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          items.add(ls.toUserdata(-1).data as BottomNavigationBarItem);
        }
        ls.pop(1);
      }
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

    int onTapId = -1;
    fieldType = ls.getField(-1, "onTap");
    if (fieldType == LuaType.luaFunction) {
      onTapId = ls.ref(lua_registryindex); //自带pop
    } else if (fieldType == LuaType.luaNil) {
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "currentIndex");
    int currentIndex = 0;
    if (fieldType == LuaType.luaNumber) {
      currentIndex = ls.toIntegerX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "elevation");
    double elevation = 0;
    if (fieldType == LuaType.luaNumber) {
      elevation = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "type");
    var type;
    if (fieldType == LuaType.luaNumber) {
      type = FlutterBottomNavigationBarType.get(ls.toInteger(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "fixedColor");
    var fixedColor;
    if (fieldType == LuaType.luaUserdata) {
      fixedColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "backgroundColor");
    var backgroundColor;
    if (fieldType == LuaType.luaUserdata) {
      backgroundColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "selectedItemColor");
    var selectedItemColor;
    if (fieldType == LuaType.luaUserdata) {
      selectedItemColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "iconSize");
    double iconSize = 24;
    if (fieldType == LuaType.luaNumber) {
      iconSize = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "unselectedItemColor");
    var unselectedItemColor;
    if (fieldType == LuaType.luaUserdata) {
      unselectedItemColor = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "selectedIconTheme");
    var selectedIconTheme;
    if (fieldType == LuaType.luaUserdata) {
      selectedIconTheme = ls.toUserdata(-1).data as IconThemeData;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "unselectedIconTheme");
    var unselectedIconTheme;
    if (fieldType == LuaType.luaUserdata) {
      unselectedIconTheme = ls.toUserdata(-1).data as IconThemeData;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "selectedFontSize");
    double selectedFontSize = 14;
    if (fieldType == LuaType.luaNumber) {
      selectedFontSize = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "unselectedFontSize");
    double unselectedFontSize = 12;
    if (fieldType == LuaType.luaNumber) {
      unselectedFontSize = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "selectedLabelStyle");
    var selectedLabelStyle;
    if (fieldType == LuaType.luaNumber) {
      selectedLabelStyle = ls.toUserdata(-1).data as TextStyle;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "unselectedLabelStyle");
    var unselectedLabelStyle;
    if (fieldType == LuaType.luaNumber) {
      unselectedLabelStyle = ls.toUserdata(-1).data as TextStyle;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "showSelectedLabels");
    var showSelectedLabels;
    if (fieldType == LuaType.luaBoolean) {
      showSelectedLabels = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "showUnselectedLabels");
    var showUnselectedLabels;
    if (fieldType == LuaType.luaBoolean) {
      showUnselectedLabels = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "enableFeedback");
    var enableFeedback;
    if (fieldType == LuaType.luaBoolean) {
      enableFeedback = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<BottomNavigationBar>();
    userdata.data = BottomNavigationBar(
      key: key,
      items: items,
      currentIndex: currentIndex,
      elevation: elevation,
      type: type,
      onTap: onTapId == -1
          ? null
          : (index) {
              ls.rawGetI(lua_registryindex, onTapId);
              ls.pushInteger(index);
              ls.pCall(1, 0, 1);
            },
      fixedColor: fixedColor,
      backgroundColor: backgroundColor,
      iconSize: iconSize,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      selectedFontSize: selectedFontSize,
      unselectedFontSize: unselectedFontSize,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      enableFeedback: enableFeedback,
    );
    return 1;
  }

  static int _openBottomNavigationBarLib(LuaState ls) {
    ls.newMetatable("BottomNavigationBarClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_BottomNavigationBarMembers, 0);

    ls.newLib(_BottomNavigationBarWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("BottomNavigationBar", _openBottomNavigationBarLib, true);
    ls.pop(1);
  }
}
