import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/list_tile_controlaffinity.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterCheckboxListTile {
  static const Map<String, DartFunction> _CheckboxListTileWrap = {
    "new": _newCheckBoxListTile,
  };

  static const Map<String, DartFunction> _CheckboxListTileMembers = {
    "id": null
  };

  static int _newCheckBoxListTile(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    bool value;
    if (fieldType == LuaType.luaBoolean) {
      value = ls.toBoolean(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterCheckboxListTile  value is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "tristate");
    bool tristate = false;
    if (fieldType == LuaType.luaBoolean) {
      tristate = ls.toBoolean(-1);
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
          source: "FlutterCheckboxListTile  onChanged is null");
    }

    fieldType = ls.getField(-1, "activeColor");
    var activeColor;
    if (fieldType == LuaType.luaUserdata) {
      activeColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "checkColor");
    var checkColor;
    if (fieldType == LuaType.luaUserdata) {
      checkColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "autofocus");
    bool autofocus = false;
    if (fieldType == LuaType.luaBoolean) {
      autofocus = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "tileColor");
    var tileColor;
    if (fieldType == LuaType.luaUserdata) {
      tileColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "side");
    var side;
    if (fieldType == LuaType.luaUserdata) {
      side = ls.toUserdata(-1).data as BorderSide;
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

    ls.newUserdata<CheckboxListTile>().data = CheckboxListTile(
      key: key,
      value: value,
      title: title,
      subtitle: subtitle,
      tristate: tristate,
      onChanged: onChangedId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onChangedId);
              ls.pushBoolean(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      tileColor: tileColor,
      activeColor: activeColor,
      checkColor: checkColor,
      side: side,
      isThreeLine: isThreeLine,
      dense: dense,
      secondary: secondary,
      selected: selected,
      controlAffinity: controlAffinity,
      autofocus: autofocus,
      contentPadding: contentPadding,
    );

    return 1;
  }

  static int _openCheckboxListTileLib(LuaState ls) {
    ls.newMetatable("CheckboxListTileClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_CheckboxListTileMembers, 0);
    ls.newLib(_CheckboxListTileWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("CheckboxListTile", _openCheckboxListTileLib, true);
    ls.pop(1);
  }
}
