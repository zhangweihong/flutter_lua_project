import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/drag_start_behavior.dart';
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

      fieldType = ls.getField(-1, "bottomSheet");
      Widget bottomSheet;
      if (fieldType == LuaType.luaUserdata) {
        bottomSheet = ls.toUserdata(-1).data as Widget;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "backgroundColor");
      var backgroundColor;
      if (fieldType == LuaType.luaUserdata) {
        backgroundColor = ls.toUserdata(-1).data as Color;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "resizeToAvoidBottomInset");
      var resizeToAvoidBottomInset;
      if (fieldType == LuaType.luaBoolean) {
        resizeToAvoidBottomInset = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "primary");
      var primary = true;
      if (fieldType == LuaType.luaBoolean) {
        primary = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "extendBody");
      var extendBody = false;
      if (fieldType == LuaType.luaBoolean) {
        extendBody = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "extendBodyBehindAppBar");
      var extendBodyBehindAppBar = false;
      if (fieldType == LuaType.luaBoolean) {
        extendBodyBehindAppBar = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "drawerScrimColor");
      var drawerScrimColor;
      if (fieldType == LuaType.luaUserdata) {
        drawerScrimColor = ls.toUserdata(-1).data as Color;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "drawerEdgeDragWidth");
      var drawerEdgeDragWidth;
      if (fieldType == LuaType.luaNumber) {
        drawerEdgeDragWidth = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "drawerEnableOpenDragGesture");
      var drawerEnableOpenDragGesture = true;
      if (fieldType == LuaType.luaBoolean) {
        drawerEnableOpenDragGesture = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "endDrawerEnableOpenDragGesture");
      var endDrawerEnableOpenDragGesture = true;
      if (fieldType == LuaType.luaBoolean) {
        endDrawerEnableOpenDragGesture = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "restorationId");
      var restorationId;
      if (fieldType == LuaType.luaString) {
        restorationId = ls.toStr(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "drawerDragStartBehavior");
      var drawerDragStartBehavior = DragStartBehavior.start;
      if (fieldType == LuaType.luaNumber) {
        drawerDragStartBehavior =
            FlutterDragStartBehavior.get(ls.toIntegerX(-1));
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
        bottomSheet: bottomSheet,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        primary: primary,
        drawerDragStartBehavior: drawerDragStartBehavior,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        drawerScrimColor: drawerScrimColor,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        restorationId: restorationId,
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
