import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/axis.dart';
import 'package:flutter_lua_dardo/widget/clip.dart';
import 'package:flutter_lua_dardo/widget/drag_start_behavior.dart';
import 'package:flutter_lua_dardo/widget/scrollview_keyboard_dismissbehavior.dart';

class FlutterGridView {
  static const Map<String, DartFunction> _GridViewWrap = {
    "builder": _builderGridViewWrap,
  };

  static const Map<String, DartFunction> _GridViewMembers = {"id": null};

  static int _builderGridViewWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "scrollDirection");
    Axis scrollDirection = Axis.vertical;
    if (fieldType == LuaType.luaNumber) {
      scrollDirection = FlutterAxis.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "reverse");
    var reverse = false;
    if (fieldType == LuaType.luaBoolean) {
      reverse = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "primary");
    var primary;
    if (fieldType == LuaType.luaBoolean) {
      primary = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "physics");
    var physics = AlwaysScrollableScrollPhysics();
    if (fieldType == LuaType.luaUserdata) {
      physics = ls.toUserdata(-1).data as ScrollPhysics;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "shrinkWrap");
    var shrinkWrap = false;
    if (fieldType == LuaType.luaBoolean) {
      shrinkWrap = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "addAutomaticKeepAlives");
    var addAutomaticKeepAlives = true;
    if (fieldType == LuaType.luaBoolean) {
      addAutomaticKeepAlives = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "addRepaintBoundaries");
    var addRepaintBoundaries = true;
    if (fieldType == LuaType.luaBoolean) {
      addRepaintBoundaries = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "addSemanticIndexes");
    var addSemanticIndexes = true;
    if (fieldType == LuaType.luaBoolean) {
      addSemanticIndexes = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "cacheExtent");
    double cacheExtent;
    if (fieldType == LuaType.luaNumber) {
      cacheExtent = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "itemBuilder");
    var builderId = -1;
    if (fieldType == LuaType.luaFunction) {
      builderId = ls.ref(lua_registryindex);
    } else if (fieldType == LuaType.luaNil) {
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "semanticChildCount");
    int semanticChildCount;
    if (fieldType == LuaType.luaNumber) {
      semanticChildCount = ls.toIntegerX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dragStartBehavior");
    DragStartBehavior dragStartBehavior = DragStartBehavior.start;
    if (fieldType == LuaType.luaNumber) {
      dragStartBehavior = FlutterDragStartBehavior.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "restorationId");
    var restorationId;
    if (fieldType == LuaType.luaString) {
      restorationId = ls.toStr(restorationId);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "clipBehavior");
    var clipBehavior = Clip.hardEdge;
    if (fieldType == LuaType.luaNumber) {
      clipBehavior = FlutterClip.get(ls.toInteger(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "keyboardDismissBehavior");
    var keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual;
    if (fieldType == LuaType.luaNumber) {
      keyboardDismissBehavior =
          FlutterScrKeyBoardDisBehavior.get(ls.toInteger(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "padding");
    EdgeInsets padding;
    if (fieldType == LuaType.luaUserdata) {
      padding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "controller");
    var controller;
    if (fieldType == LuaType.luaUserdata) {
      controller = ls.toUserdata(-1).data as ScrollController;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "itemCount");
    var itemCount;
    if (fieldType == LuaType.luaNumber) {
      itemCount = ls.toIntegerX(-1);
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

    fieldType = ls.getField(-1, "gridDelegate");
    var gridDelegate;
    if (fieldType == LuaType.luaUserdata) {
      gridDelegate =
          ls.toUserdata(-1).data as SliverGridDelegateWithFixedCrossAxisCount;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<GridView>();
    userdata.data = GridView.builder(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: padding,
        gridDelegate: gridDelegate,
        itemBuilder: (_ctx, index) {
          Widget w;
          if (builderId != -1) {
            ls.rawGetI(lua_registryindex, builderId);
            var userdata = ls.newUserdata<BuildContext>();
            userdata.data = _ctx;
            ls.pushInteger(index);
            ls.pCall(2, 1, 1);
            if (ls.isUserdata(-1)) {
              w = ls.toUserdata<Widget>(-1).data;
            }
            ls.setTop(0);
          }
          return w;
        },
        itemCount: itemCount,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        dragStartBehavior: dragStartBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        clipBehavior: clipBehavior);
    return 1;
  }

  static int _openGridViewLib(LuaState ls) {
    ls.newMetatable("GridViewClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_GridViewMembers, 0);

    ls.newLib(_GridViewWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("GridView", _openGridViewLib, true);
    ls.pop(1);
  }
}
