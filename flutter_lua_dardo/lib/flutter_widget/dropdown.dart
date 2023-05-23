import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/alignment.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterDropdownMenuItem {
  static const Map<String, DartFunction> _DropdownMenuItemWrap = {
    'new': _newDropdownMenuItemWrap,
  };

  static const Map<String, DartFunction> _DropdownMenuItemMembers = {
    'id': null
  };

  static int _newDropdownMenuItemWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "value");
    int value;
    if (fieldType == LuaType.luaNumber) {
      value = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "",
          type: "FlutterDropdownMenuItem value is null",
          expected: "",
          source: "dropdown.dart");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "child");
    Widget child;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    } else {
      throw ParameterError(
          name: "",
          type: "FlutterDropdownMenuItem child is null",
          expected: "",
          source: "dropdown.dart");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "enabled");
    bool enabled = true;
    if (fieldType == LuaType.luaBoolean) {
      enabled = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "alignment");
    AlignmentGeometry alignment = AlignmentDirectional.centerStart;
    if (fieldType == LuaType.luaNumber) {
      alignment = FlutterAlignment.get(ls.toIntegerX(-1));
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

    fieldType = ls.getField(-1, "onTap");
    int onTapId = -1;
    if (fieldType == LuaType.luaFunction) {
      onTapId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }
    ls.newUserdata().data = DropdownMenuItem<int>(
      key: key,
      value: value,
      child: child,
      enabled: enabled,
      alignment: alignment,
      onTap: onTapId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onTapId);
              ls.pCall(0, 0, 1);
            }
          : null,
    );
    return 1;
  }

  static int _openDropdownMenuItemLib(LuaState ls) {
    ls.newMetatable('DropdownMenuItemClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_DropdownMenuItemMembers, 0);
    ls.newLib(_DropdownMenuItemWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('DropdownMenuItem', _openDropdownMenuItemLib, true);
    ls.pop(1);
  }
}

class FlutterDropDown {
  static const Map<String, DartFunction> _DropDownWrap = {
    'new': _newDropDownWrap,
  };

  static const Map<String, DartFunction> _DropDownMembers = {'id': null};

  static int _newDropDownWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "items");
    var items = List<DropdownMenuItem<int>>.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          items.add(ls.toUserdata(-1).data as DropdownMenuItem<int>);
        }
        ls.pop(1);
      }
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterDropDown Error',
          type: "",
          expected: "",
          source: "dropdown.dart");
    }

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "onChanged");
    int onChangedId = -1;
    if (fieldType == LuaType.luaFunction) {
      onChangedId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "selectedItemBuilder");
    int selectedItemBuilderId = -1;
    if (fieldType == LuaType.luaFunction) {
      selectedItemBuilderId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "value");
    int value = 0;
    if (fieldType == LuaType.luaNumber) {
      value = ls.toIntegerX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "iconSize");
    double iconSize = 24.0;
    if (fieldType == LuaType.luaNumber) {
      iconSize = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "itemHeight");
    double itemHeight = 48.0;
    if (fieldType == LuaType.luaNumber) {
      itemHeight = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "menuMaxHeight");
    double menuMaxHeight;
    if (fieldType == LuaType.luaNumber) {
      menuMaxHeight = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "isDense");
    bool isDense = false;
    if (fieldType == LuaType.luaBoolean) {
      isDense = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "enableFeedback");
    bool enableFeedback = false;
    if (fieldType == LuaType.luaBoolean) {
      enableFeedback = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "alignment");
    var alignment = AlignmentDirectional.centerStart;
    if (fieldType == LuaType.luaNumber) {
      alignment = FlutterAlignment.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "autofocus");
    bool autofocus = false;
    if (fieldType == LuaType.luaBoolean) {
      autofocus = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "isExpanded");
    bool isExpanded = false;
    if (fieldType == LuaType.luaBoolean) {
      isExpanded = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "hint");
    Widget hint;
    if (fieldType == LuaType.luaUserdata) {
      hint = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "disabledHint");
    Widget disabledHint;
    if (fieldType == LuaType.luaUserdata) {
      disabledHint = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "underline");
    Widget underline;
    if (fieldType == LuaType.luaUserdata) {
      underline = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "icon");
    Widget icon;
    if (fieldType == LuaType.luaUserdata) {
      icon = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dropdownColor");
    Color dropdownColor;
    if (fieldType == LuaType.luaUserdata) {
      dropdownColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "iconDisabledColor");
    Color iconDisabledColor;
    if (fieldType == LuaType.luaUserdata) {
      iconDisabledColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "borderRadius");
    var borderRadius;
    if (fieldType == LuaType.luaUserdata) {
      borderRadius = ls.toUserdata(-1).data as BorderRadius;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "iconEnabledColor");
    Color iconEnabledColor;
    if (fieldType == LuaType.luaUserdata) {
      iconEnabledColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "focusColor");
    Color focusColor;
    if (fieldType == LuaType.luaUserdata) {
      focusColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onTap");
    int onTapId = -1;
    if (fieldType == LuaType.luaFunction) {
      onTapId = ls.ref(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "elevation");
    int elevation = 8;
    if (fieldType == LuaType.luaNumber) {
      elevation = ls.toIntegerX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "style");
    TextStyle style;
    if (fieldType == LuaType.luaUserdata) {
      style = ls.toUserdata(-1) as TextStyle;
    }
    ls.pop(1);

    ls.newUserdata().data = DropdownButton<int>(
      key: key,
      items: items,
      onChanged: (index) {
        ls.rawGetI(lua_registryindex, onChangedId);
        ls.pushInteger(index);
        ls.pCall(1, 0, 1);
      },
      value: value,
      hint: hint,
      disabledHint: disabledHint,
      elevation: elevation,
      style: style,
      underline: underline,
      icon: icon,
      iconSize: iconSize,
      iconDisabledColor: iconDisabledColor,
      iconEnabledColor: iconEnabledColor,
      focusColor: focusColor,
      itemHeight: itemHeight,
      isDense: isDense,
      isExpanded: isExpanded,
      autofocus: autofocus,
      dropdownColor: dropdownColor,
      alignment: alignment,
      enableFeedback: enableFeedback,
      borderRadius: borderRadius,
      onTap: onTapId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onTapId);
              ls.pCall(0, 0, 1);
            }
          : null,
      selectedItemBuilder: selectedItemBuilderId != -1
          ? (_context) {
              var items = List<Widget>.empty(growable: true);
              ls.rawGetI(lua_registryindex, selectedItemBuilderId);
              ls.newUserdata().data = _context;
              ls.pCall(1, 1, 1);
              if (ls.isTable(-1)) {
                var len = ls.len2(-1);
                for (int i = 1; i <= len; i++) {
                  if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
                    items.add(ls.toUserdata(-1).data as Widget);
                  }
                  ls.pop(1);
                }
              }
              return items;
            }
          : null,
    );
    return 1;
  }

  static int _openDropDownLib(LuaState ls) {
    ls.newMetatable('DropDownClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_DropDownMembers, 0);
    ls.newLib(_DropDownWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('DropDown', _openDropDownLib, true);
    ls.pop(1);
  }
}
