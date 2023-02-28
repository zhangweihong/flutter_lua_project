import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/axis.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/flutter_widget/drag_start_behavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/scrollphysics.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterSingleChildScrollView {
  static const Map<String, DartFunction> _SingleChildScrollViewWrap = {
    "new": _newSingleChildScrollView
  };

  static const Map<String, DartFunction> _SingleChildScrollViewMembers = {
    "id": null
  };

  static int _newSingleChildScrollView(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "scrollDirection");
    Axis scrollDirection = Axis.vertical;
    if (fieldType == LuaType.luaNumber) {
      scrollDirection = FlutterAxis.get(ls.toIntegerX(-1));
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

    fieldType = ls.getField(-1, "primary");
    var primary;
    if (fieldType == LuaType.luaBoolean) {
      primary = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "reverse");
    var reverse = false;
    if (fieldType == LuaType.luaBoolean) {
      reverse = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "padding");
    var padding;
    if (fieldType == LuaType.luaUserdata) {
      padding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "physics");
    var physics;
    if (fieldType == LuaType.luaUserdata) {
      physics = ls.toUserdata(-1).data as ScrollPhysics;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "controller");
    var controller;
    if (fieldType == LuaType.luaUserdata) {
      controller = ls.toUserdata(-1).data as ScrollController;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dragStartBehavior");
    DragStartBehavior dragStartBehavior = DragStartBehavior.start;
    if (fieldType == LuaType.luaNumber) {
      dragStartBehavior = FlutterDragStartBehavior.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "clipBehavior");
    Clip clipBehavior = Clip.hardEdge;
    if (fieldType == LuaType.luaNumber) {
      clipBehavior = FlutterClip.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "restorationId");
    var restorationId;
    if (fieldType == LuaType.luaString) {
      restorationId = ls.toStr(-1);
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = SingleChildScrollView(
      key: key,
      child: child,
      reverse: reverse,
      padding: padding,
      scrollDirection: scrollDirection,
      primary: primary,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
    );
    return 1;
  }

  static int _openSingleChildScrollViewLib(LuaState ls) {
    ls.newMetatable("SingleChildScrollViewClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_SingleChildScrollViewMembers, 0);

    ls.newLib(_SingleChildScrollViewWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("SingleChildScrollView", _openSingleChildScrollViewLib, true);
    ls.pop(1);
  }
}
