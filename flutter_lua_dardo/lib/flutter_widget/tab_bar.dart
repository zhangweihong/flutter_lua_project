import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/drag_start_behavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterTabController {
  static void register(LuaState ls) {
    ls.register("TabController", _newTabController);
  }

  static int _newTabController(LuaState ls) {
    int initialIndex = 0;
    int animationDuration = 0;
    TickerProvider vsync;
    int len = 0;
    var fieldTye = ls.getField(-1, "initialIndex");
    if (fieldTye == LuaType.luaNumber) {
      initialIndex = ls.toIntegerX(-1);
    }
    ls.pop(1);

    fieldTye = ls.getField(-1, "animationDuration");
    if (fieldTye == LuaType.luaNumber) {
      animationDuration = ls.toIntegerX(-1);
    }
    ls.pop(1);

    fieldTye = ls.getField(-1, "vsync");
    if (fieldTye == LuaType.luaUserdata) {
      vsync = ls.toUserdata(-1).data as TickerProvider;
    } else {
      throw ParameterError(
          name: "FlutterTabController",
          type: "",
          expected: "FlutterTabController vsync is null",
          source: "");
    }
    ls.pop(1);

    fieldTye = ls.getField(-1, "length");
    if (fieldTye == LuaType.luaNumber) {
      len = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "FlutterTabController",
          type: "",
          expected: "FlutterTabController length is null",
          source: "");
    }
    ls.pop(1);

    ls.newUserdata<TabController>().data = TabController(
        initialIndex: initialIndex,
        animationDuration: Duration(milliseconds: animationDuration),
        length: len,
        vsync: vsync);
    return 1;
  }
}

class FlutterTabBar {
  static const Map<String, DartFunction> _TabBarWrap = {
    'new': _newTabBarWrap,
  };

  static const Map<String, DartFunction> _TabBarMembers = {'id': null};

  static int _newTabBarWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "tabs");
    List<Widget> tabs = List.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          tabs.add(ls.toUserdata(-1).data as Widget);
        }
        ls.pop(1);
      }
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterTabBar tabs is null',
          type: ls.typeName(fieldType),
          expected: "",
          source: "tab_bar.dart");
    }

    var controller = null;
    fieldType = ls.getField(-1, "controller");
    if (fieldType == LuaType.luaUserdata) {
      controller = ls.toUserdata(-1).data as TabController;
    } else {
      throw ParameterError(
          name: 'FlutterTabBar controller is null',
          type: ls.typeName(fieldType),
          expected: "",
          source: "tab_bar.dart");
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

    bool isScrollable = false;
    fieldType = ls.getField(-1, "isScrollable");
    if (fieldType == LuaType.luaBoolean) {
      isScrollable = ls.toBoolean(-1);
    }
    ls.pop(1);

    var padding;
    fieldType = ls.getField(-1, "padding");
    if (fieldType == LuaType.luaUserdata) {
      padding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    var indicatorPadding = EdgeInsets.zero;
    fieldType = ls.getField(-1, "indicatorPadding");
    if (fieldType == LuaType.luaUserdata) {
      indicatorPadding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    var labelPadding;
    fieldType = ls.getField(-1, "labelPadding");
    if (fieldType == LuaType.luaUserdata) {
      labelPadding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    var indicatorColor;
    fieldType = ls.getField(-1, "indicatorColor");
    if (fieldType == LuaType.luaUserdata) {
      indicatorColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    var labelColor;
    fieldType = ls.getField(-1, "labelColor");
    if (fieldType == LuaType.luaUserdata) {
      labelColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    var unselectedLabelColor;
    fieldType = ls.getField(-1, "unselectedLabelColor");
    if (fieldType == LuaType.luaUserdata) {
      unselectedLabelColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    var labelStyle;
    fieldType = ls.getField(-1, "labelStyle");
    if (fieldType == LuaType.luaUserdata) {
      labelStyle = ls.toUserdata(-1).data as TextStyle;
    }
    ls.pop(1);

    var unselectedLabelStyle;
    fieldType = ls.getField(-1, "unselectedLabelStyle");
    if (fieldType == LuaType.luaUserdata) {
      unselectedLabelStyle = ls.toUserdata(-1).data as TextStyle;
    }
    ls.pop(1);

    var dragStartBehavior = DragStartBehavior.start;
    fieldType = ls.getField(-1, "dragStartBehavior");
    if (fieldType == LuaType.luaUserdata) {
      dragStartBehavior = FlutterDragStartBehavior.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    var onTapId = -1;
    fieldType = ls.getField(-1, "onTap");
    if (fieldType == LuaType.luaFunction) {
      onTapId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    bool automaticIndicatorColorAdjustment = true;
    fieldType = ls.getField(-1, "automaticIndicatorColorAdjustment");
    if (fieldType == LuaType.luaBoolean) {
      automaticIndicatorColorAdjustment = ls.toBoolean(-1);
    }
    ls.pop(1);

    double indicatorWeight = 2.0;
    fieldType = ls.getField(-1, "indicatorWeight");
    if (fieldType == LuaType.luaNumber) {
      indicatorWeight = ls.toNumberX(-1);
    }
    ls.pop(1);

    ls.newUserdata().data = TabBar(
      key: key,
      tabs: tabs,
      controller: controller,
      isScrollable: isScrollable,
      padding: padding,
      indicatorColor: indicatorColor,
      automaticIndicatorColorAdjustment: automaticIndicatorColorAdjustment,
      indicatorWeight: indicatorWeight,
      indicatorPadding: indicatorPadding,
      labelColor: labelColor,
      labelStyle: labelStyle,
      labelPadding: labelPadding,
      unselectedLabelColor: unselectedLabelColor,
      unselectedLabelStyle: unselectedLabelStyle,
      dragStartBehavior: dragStartBehavior,
      onTap: onTapId != -1
          ? (index) {
              ls.rawGetI(lua_registryindex, onTapId);
              ls.pushInteger(index);
              ls.pCall(1, 0, 1);
            }
          : null,
    );
    return 1;
  }

  static int _openTabBarLib(LuaState ls) {
    ls.newMetatable('TabBarClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_TabBarMembers, 0);
    ls.newLib(_TabBarWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('TabBar', _openTabBarLib, true);
    ls.pop(1);
    FlutterTabController.register(ls);
  }
}
