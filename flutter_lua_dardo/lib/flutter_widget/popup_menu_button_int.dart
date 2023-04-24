import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/flutter_widget/popup_menu_positon.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterPopupMenuButton {
  static const Map<String, DartFunction> _PopupMenuButtonWrap = {
    'new': _newPopupMenuButtonWrap,
  };

  static const Map<String, DartFunction> _PopupMenuButtonMembers = {'id': null};

  static int _newPopupMenuButtonWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "items");
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
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterPopupMenuButton children is null',
          type: "FlutterPopupMenuButton",
          expected: "",
          source: "popup_menu_button_int.dart");
    }

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "onSelected");
    int onSelectedId = -1;
    if (fieldType == LuaType.luaFunction) {
      onSelectedId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "onCanceled");
    int onCanceledId = -1;
    if (fieldType == LuaType.luaFunction) {
      onCanceledId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "child");
    Widget child;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "tooltip");
    String tooltip;
    if (fieldType == LuaType.luaString) {
      tooltip = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "initialValue");
    var initialValue;
    if (fieldType == LuaType.luaNumber) {
      initialValue = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "elevation");
    double elevation;
    if (fieldType == LuaType.luaNumber) {
      elevation = ls.toNumber(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "iconSize");
    double iconSize;
    if (fieldType == LuaType.luaNumber) {
      iconSize = ls.toNumber(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "offset");
    Offset offset = Offset.zero;
    if (fieldType == LuaType.luaUserdata) {
      offset = ls.toUserdata(-1).data as Offset;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "splashRadius");
    double splashRadius;
    if (fieldType == LuaType.luaNumber) {
      splashRadius = ls.toNumber(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "padding");
    var padding = const EdgeInsets.all(8.0);
    if (fieldType == LuaType.luaUserdata) {
      padding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "position");
    var position = PopupMenuPosition.over;
    if (fieldType == LuaType.luaNumber) {
      position = FlutterPopupMenuPosition.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "icon");
    Widget icon;
    if (fieldType == LuaType.luaUserdata) {
      icon = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "enabled");
    bool enabled = true;
    if (fieldType == LuaType.luaBoolean) {
      enabled = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "color");
    Color color;
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    ls.newUserdata().data = PopupMenuButton<int>(
      key: key,
      child: child,
      position: position,
      tooltip: tooltip,
      elevation: elevation,
      icon: icon,
      iconSize: iconSize,
      splashRadius: splashRadius,
      padding: padding,
      offset: offset,
      enabled: enabled,
      color: color,
      initialValue: initialValue,
      itemBuilder: ((context) {
        var ls = List<PopupMenuItem<int>>.empty(growable: true);
        for (var i = 0; i < children.length; i++) {
          ls.add(PopupMenuItem(
            child: children[i],
            value: i,
          ));
        }
        return ls;
      }),
      onSelected: onSelectedId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onSelectedId);
              ls.pushInteger(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      onCanceled: onCanceledId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onCanceledId);
              ls.pCall(0, 0, 1);
            }
          : null,
    );
    return 1;
  }

  static int _openPopupMenuButtonLib(LuaState ls) {
    ls.newMetatable('PopupMenuButtonClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_PopupMenuButtonMembers, 0);
    ls.newLib(_PopupMenuButtonWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('PopupMenuButton', _openPopupMenuButtonLib, true);
    ls.pop(1);
  }
}
