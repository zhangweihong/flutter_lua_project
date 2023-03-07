import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/list_tile_controlaffinity.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterRadioListTile {
  static const Map<String, DartFunction> _RadioListTileWrap = {
    "new": _newRadioListTile,
  };

  static const Map<String, DartFunction> _RadioListTileMembers = {"id": null};

  static int _newRadioListTile(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    int value;
    if (fieldType == LuaType.luaNumber) {
      value = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterRadioListTile  value is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "groupValue");
    int groupValue;
    if (fieldType == LuaType.luaNumber) {
      groupValue = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterRadioListTile  groupValue is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onChanged");
    int onChangedId = -1;
    if (fieldType == LuaType.luaFunction) {
      onChangedId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterCheckBox  onChanged is null");
    }

    fieldType = ls.getField(-1, "activeColor");
    var activeColor;
    if (fieldType == LuaType.luaUserdata) {
      activeColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "title");
    var title;
    if (fieldType == LuaType.luaUserdata) {
      title = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "subtitle");
    var subtitle;
    if (fieldType == LuaType.luaUserdata) {
      subtitle = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "autofocus");
    bool autofocus = false;
    if (fieldType == LuaType.luaBoolean) {
      autofocus = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "isThreeLine");
    bool isThreeLine = false;
    if (fieldType == LuaType.luaBoolean) {
      isThreeLine = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dense");
    var dense;
    if (fieldType == LuaType.luaBoolean) {
      dense = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "secondary");
    var secondary;
    if (fieldType == LuaType.luaUserdata) {
      secondary = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "selected");
    bool selected = false;
    if (fieldType == LuaType.luaBoolean) {
      selected = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "toggleable");
    bool toggleable = false;
    if (fieldType == LuaType.luaBoolean) {
      toggleable = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "controlAffinity");
    ListTileControlAffinity controlAffinity = ListTileControlAffinity.leading;
    if (fieldType == LuaType.luaNumber) {
      controlAffinity = FlutterListTileControlAffinity.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "contentPadding");
    var contentPadding;
    if (fieldType == LuaType.luaUserdata) {
      contentPadding = ls.toUserdata(-1).data as EdgeInsets;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "tileColor");
    var tileColor;
    if (fieldType == LuaType.luaUserdata) {
      tileColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    ls.newUserdata<RadioListTile>().data = RadioListTile(
      key: key,
      value: value,
      groupValue: groupValue,
      toggleable: toggleable,
      title: title,
      subtitle: subtitle,
      onChanged: onChangedId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onChangedId);
              ls.pushInteger(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      activeColor: activeColor,
      tileColor: tileColor,
      isThreeLine: isThreeLine,
      dense: dense,
      secondary: secondary,
      selected: selected,
      autofocus: autofocus,
      controlAffinity: controlAffinity,
      contentPadding: contentPadding,
    );
    return 1;
  }

  static int _openRadioListTileLib(LuaState ls) {
    ls.newMetatable("RadioListTileClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_RadioListTileMembers, 0);
    ls.newLib(_RadioListTileWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("RadioListTile", _openRadioListTileLib, true);
    ls.pop(1);
  }
}
