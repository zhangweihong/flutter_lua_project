import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterChip {
  static const Map<String, DartFunction> _ChipWrap = {
    "new": _newChip,
  };

  static const Map<String, DartFunction> _ChipMembers = {"id": null};

  static int _newChip(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "label");
    Widget label;
    if (fieldType == LuaType.luaUserdata) {
      label = ls.toUserdata(-1).data as Widget;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterChip lable is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "avatar");
    Widget avatar;
    if (fieldType == LuaType.luaUserdata) {
      avatar = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "elevation");
    double elevation;
    if (fieldType == LuaType.luaNumber) {
      elevation = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "labelStyle");
    TextStyle labelStyle;
    if (fieldType == LuaType.luaUserdata) {
      labelStyle = ls.toUserdata(-1).data as TextStyle;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "labelPadding");
    EdgeInsets labelPadding;
    if (fieldType == LuaType.luaUserdata) {
      labelPadding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "padding");
    EdgeInsets padding;
    if (fieldType == LuaType.luaUserdata) {
      padding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "deleteIcon");
    Widget deleteIcon;
    if (fieldType == LuaType.luaUserdata) {
      deleteIcon = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onDeleted");
    int onDeletedId = -1;
    if (fieldType == LuaType.luaFunction) {
      onDeletedId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "deleteIconColor");
    Color deleteIconColor;
    if (fieldType == LuaType.luaUserdata) {
      deleteIconColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "backgroundColor");
    Color backgroundColor;
    if (fieldType == LuaType.luaUserdata) {
      backgroundColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "shadowColor");
    Color shadowColor;
    if (fieldType == LuaType.luaUserdata) {
      shadowColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "deleteButtonTooltipMessage");
    String deleteButtonTooltipMessage;
    if (fieldType == LuaType.luaString) {
      deleteButtonTooltipMessage = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "side");
    var side;
    if (fieldType == LuaType.luaUserdata) {
      side = ls.toUserdata(-1).data as BorderSide;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "clipBehavior");
    var clipBehavior = Clip.none;
    if (fieldType == LuaType.luaNumber) {
      clipBehavior = FlutterClip.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "autofocus");
    var autofocus = false;
    if (fieldType == LuaType.luaBoolean) {
      autofocus = ls.toBoolean(-1);
    }
    ls.pop(1);

    ls.newUserdata().data = Chip(
        key: key,
        label: label,
        avatar: avatar,
        labelStyle: labelStyle,
        labelPadding: labelPadding,
        deleteIcon: deleteIcon,
        onDeleted: onDeletedId != -1
            ? () {
                ls.rawGetI(lua_registryindex, onDeletedId);
                ls.pCall(0, 0, 1);
              }
            : null,
        deleteIconColor: deleteIconColor,
        deleteButtonTooltipMessage: deleteButtonTooltipMessage,
        side: side,
        clipBehavior: clipBehavior,
        autofocus: autofocus,
        backgroundColor: backgroundColor,
        padding: padding,
        shadowColor: shadowColor,
        elevation: elevation);
    return 1;
  }

  static int _openChipLib(LuaState ls) {
    ls.newMetatable("ChipClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ChipMembers, 0);
    ls.newLib(_ChipWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Chip", _openChipLib, true);
    ls.pop(1);
  }
}
