import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/axis.dart';
import 'package:flutter_lua_dardo/widget/clip.dart';
import 'package:flutter_lua_dardo/widget/drag_start_behavior.dart';
import 'package:flutter_lua_dardo/widget/scrollview_keyboard_dismissbehavior.dart';

class FlutterListView {
  static const Map<String, DartFunction> _ListViewWrap = {
    "new": _newListViewWrap,
    "builder": _builderListViewWrap,
    "separated": _separatedListViewWrap,
    "custom": _customListViewWrap,
  };

  static const Map<String, DartFunction> _ListViewMembers = {"id": null};

  static int _builderListViewWrap(LuaState ls) {
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

    fieldType = ls.getField(-1, "itemExtent");
    double itemExtent;
    if (fieldType == LuaType.luaNumber) {
      itemExtent = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "prototypeItem");
    Widget prototypeItem;
    if (fieldType == LuaType.luaUserdata) {
      prototypeItem = ls.toUserdata(-1).data as Widget;
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

    Userdata userdata = ls.newUserdata<ListView>();
    userdata.data = ListView.builder(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      itemExtent: itemExtent,
      prototypeItem: prototypeItem,
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
      addSemanticIndexes: addSemanticIndexes,
      addRepaintBoundaries: addRepaintBoundaries,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
    );
    return 1;
  }

  static int _customListViewWrap(LuaState ls) {
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

    fieldType = ls.getField(-1, "cacheExtent");
    double cacheExtent;
    if (fieldType == LuaType.luaNumber) {
      cacheExtent = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "itemExtent");
    double itemExtent;
    if (fieldType == LuaType.luaNumber) {
      itemExtent = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "prototypeItem");
    Widget prototypeItem;
    if (fieldType == LuaType.luaUserdata) {
      prototypeItem = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "children");
    List<Widget> children = <Widget>[];
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          children.add(ls.toUserdata(-1).data as Widget);
        }
        ls.pop(1);
      }
      ls.pop(1);
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

    fieldType = ls.getField(-1, "childrenDelegate");
    var childrenDelegate;
    if (fieldType == LuaType.luaUserdata) {
      childrenDelegate = ls.toUserdata(-1).data as SliverChildBuilderDelegate;
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<ListView>();
    userdata.data = ListView.custom(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      childrenDelegate: childrenDelegate,
      itemExtent: itemExtent,
      prototypeItem: prototypeItem,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
    );
    return 1;
  }

  static int _separatedListViewWrap(LuaState ls) {
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

    fieldType = ls.getField(-1, "separatorBuilder");
    var spBuilderId = -1;
    if (fieldType == LuaType.luaFunction) {
      spBuilderId = ls.ref(lua_registryindex);
    } else if (fieldType == LuaType.luaNil) {
      ls.pop(1);
    } else {
      ls.pop(1);
    }

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

    Userdata userdata = ls.newUserdata<ListView>();
    userdata.data = ListView.separated(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
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
      separatorBuilder: (_ctx, index) {
        Widget w;
        if (spBuilderId != -1) {
          ls.rawGetI(lua_registryindex, spBuilderId);
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
      addSemanticIndexes: addSemanticIndexes,
      addRepaintBoundaries: addRepaintBoundaries,
      cacheExtent: cacheExtent,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
    );
    return 1;
  }

  static int _newListViewWrap(LuaState ls) {
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

    fieldType = ls.getField(-1, "itemExtent");
    double itemExtent;
    if (fieldType == LuaType.luaNumber) {
      itemExtent = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "prototypeItem");
    Widget prototypeItem;
    if (fieldType == LuaType.luaUserdata) {
      prototypeItem = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "children");
    List<Widget> children = <Widget>[];
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          children.add(ls.toUserdata(-1).data as Widget);
        }
        ls.pop(1);
      }
      ls.pop(1);
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

    Userdata userdata = ls.newUserdata<ListView>();
    userdata.data = ListView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      itemExtent: itemExtent,
      prototypeItem: prototypeItem,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addSemanticIndexes: addSemanticIndexes,
      addRepaintBoundaries: addRepaintBoundaries,
      cacheExtent: cacheExtent,
      children: children,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
    );
    return 1;
  }

  static int _openListViewLib(LuaState ls) {
    ls.newMetatable("ListViewClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ListViewMembers, 0);

    ls.newLib(_ListViewWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("ListView", _openListViewLib, true);
    ls.pop(1);
  }
}
