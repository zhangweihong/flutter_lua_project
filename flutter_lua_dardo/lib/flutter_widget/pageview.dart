import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/axis.dart';
import 'package:flutter_lua_dardo/flutter_widget/commonoverscrollbehavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/drag_start_behavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class FlutterPageController {
  static void register(LuaState ls) {
    ls.register("PageController", _newPageController);
    ls.register("PageJumpTo", _jumpTo);
    ls.register("PageJumpToPage", _jumpToPage);
  }

  static int _jumpTo(LuaState ls) {
    if (ls.getTop() > 0) {
      if (ls.isNumber(-1)) {
        double value;
        value = ls.toNumberX(-1);
        ls.pop(1);
        if (ls.isUserdata(-1)) {
          PageController controller = ls.toUserdata(1).data as PageController;
          ls.pop(1);
          controller.jumpTo(value);
        } else {
          ls.pop(1);
          throw ParameterError(
              name: 'PageJumpTo controller',
              type: "",
              expected: "PageController",
              source: "PageController PageJumpTo controller");
        }
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'PageJumpTo Value',
            type: "",
            expected: "PageController",
            source: "PageController PageJumpTo Value");
      }
    }
    return 0;
  }

  static int _jumpToPage(LuaState ls) {
    if (ls.getTop() > 0) {
      if (ls.isNumber(-1)) {
        int value = 0;
        value = ls.toIntegerX(-1);
        ls.pop(1);
        if (ls.isUserdata(-1)) {
          PageController controller = ls.toUserdata(1).data as PageController;
          ls.pop(1);
          controller.jumpToPage(value);
        } else {
          ls.pop(1);
          throw ParameterError(
              name: 'PageJumpToPage controller',
              type: "",
              expected: "PageController",
              source: "PageController PageJumpToPage controller");
        }
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'PageJumpToPage Value',
            type: "",
            expected: "PageController",
            source: "PageController PageJumpToPage Value");
      }
    }
    return 0;
  }

  static int _newPageController(LuaState ls) {
    var fieldTye = ls.getField(-1, "initialPage");
    int initPage = 0;
    if (fieldTye == LuaType.luaNumber) {
      initPage = ls.toIntegerX(-1);
    }
    ls.pop(1);
    fieldTye = ls.getField(-1, "keepPage");
    bool keepPage = true;
    if (fieldTye == LuaType.luaBoolean) {
      keepPage = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldTye = ls.getField(-1, "viewportFraction");
    double fra = 1;
    if (fieldTye == LuaType.luaNumber) {
      fra = ls.toNumberX(-1);
    }
    ls.pop(1);
    Userdata userdata = ls.newUserdata<PageController>();
    userdata.data = PageController(
        initialPage: initPage, keepPage: keepPage, viewportFraction: fra);
    return 1;
  }
}

class FlutterPageView {
  static const Map<String, DartFunction> _ClipRRectWrap = {
    "new": _newPageViewWrap,
  };

  static const Map<String, DartFunction> _ClipRRectMembers = {"id": null};

  static int _newPageViewWrap(LuaState ls) {
    List<Widget> children = <Widget>[];

    var fieldType = ls.getField(-1, "children");
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

    fieldType = ls.getField(-1, "scrollDirection");
    var scrollDirection = Axis.horizontal;
    if (fieldType == LuaType.luaNumber) {
      scrollDirection = FlutterAxis.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "restorationId");
    var restorationId;
    if (fieldType == LuaType.luaNumber) {
      restorationId = ls.toStr(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "reverse");
    var reverse = false;
    if (fieldType == LuaType.luaBoolean) {
      reverse = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "allowImplicitScrolling");
    var allowImplicitScrolling = false;
    if (fieldType == LuaType.luaBoolean) {
      allowImplicitScrolling = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "dragStartBehavior");
    var dragStartBehavior = DragStartBehavior.start;
    if (fieldType == LuaType.luaNumber) {
      dragStartBehavior = FlutterDragStartBehavior.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "padEnds");
    var padEnds = true;
    if (fieldType == LuaType.luaBoolean) {
      padEnds = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "pageSnapping");
    var pageSnapping = false;
    if (fieldType == LuaType.luaBoolean) {
      pageSnapping = ls.toBoolean(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "onPageChanged");
    int onPageChangedID = -1;
    if (fieldType == LuaType.luaFunction) {
      onPageChangedID = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }
    PageController controller = PageController(initialPage: 0);
    fieldType = ls.getField(-1, "controller");
    if (fieldType == LuaType.luaUserdata) {
      controller = ls.toUserdata(-1).data as PageController;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "physics");
    var physics = AlwaysScrollableScrollPhysics();
    if (fieldType == LuaType.luaUserdata) {
      physics = ls.toUserdata(-1).data as ScrollPhysics;
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

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = PageView(
        key: key,
        children: children,
        dragStartBehavior: dragStartBehavior,
        allowImplicitScrolling: allowImplicitScrolling,
        physics: physics,
        scrollBehavior: OverScrollBehavior(),
        controller: controller,
        scrollDirection: scrollDirection,
        restorationId: restorationId,
        reverse: reverse,
        pageSnapping: pageSnapping,
        onPageChanged: (index) {
          if (onPageChangedID != -1) {
            ls.rawGetI(lua_registryindex, onPageChangedID);
            ls.pushInteger(index);
            ls.pCall(1, 0, 1);
          }
        },
        padEnds: padEnds);
    return 1;
  }

  static int _openPageViewLib(LuaState ls) {
    ls.newMetatable("PageViewClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ClipRRectMembers, 0);

    ls.newLib(_ClipRRectWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("PageView", _openPageViewLib, true);
    ls.pop(1);
    FlutterPageController.register(ls);
  }
}
