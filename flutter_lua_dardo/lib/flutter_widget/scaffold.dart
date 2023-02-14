import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/floatingactionbuttonlocation.dart';
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
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "appBar");
      if (fieldType == LuaType.luaUserdata) {
        appbar = ls.toUserdata(-1).data as AppBar;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "floatingActionButton");
      Widget floatingActionButton;
      if (fieldType == LuaType.luaUserdata) {
        floatingActionButton = ls.toUserdata(-1).data as Widget;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "floatingActionButtonLocation");
      FloatingActionButtonLocation floatingActionButtonLocation;
      if (fieldType == LuaType.luaUserdata) {
        floatingActionButtonLocation =
            FlutterFloatingActionButtonLocation.get(ls.toIntegerX(-1));
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "drawer");
      Widget drawer;
      if (fieldType == LuaType.luaUserdata) {
        drawer = ls.toUserdata(-1).data as Widget;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "onDrawerChanged");
      int onDrawerChangedId = -1;
      if (fieldType == LuaType.luaFunction) {
        onDrawerChangedId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "endDrawer");
      Widget endDrawer;
      if (fieldType == LuaType.luaUserdata) {
        endDrawer = ls.toUserdata(-1).data as Widget;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "bottomNavigationBar");
      Widget bottomNavigationBar;
      if (fieldType == LuaType.luaUserdata) {
        bottomNavigationBar = ls.toUserdata(-1).data as Widget;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "onEndDrawerChanged");
      int onEndDrawerChangedId = -1;
      if (fieldType == LuaType.luaFunction) {
        onEndDrawerChangedId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<Scaffold>();
      userdata.data = Scaffold(
        key: key,
        body: body,
        appBar: appbar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawer: drawer,
        onDrawerChanged: onDrawerChangedId != -1
            ? (value) {
                ls.rawGetI(lua_registryindex, onDrawerChangedId);
                ls.pushBoolean(value);
                ls.pCall(1, 0, 1);
              }
            : null,
        endDrawer: endDrawer,
        onEndDrawerChanged: onEndDrawerChangedId != -1
            ? (value) {
                ls.rawGetI(lua_registryindex, onEndDrawerChangedId);
                ls.pushBoolean(value);
                ls.pCall(1, 0, 1);
              }
            : null,
        bottomNavigationBar: bottomNavigationBar,
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
