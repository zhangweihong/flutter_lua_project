import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class FlutterInWell {
  static Map<String, DartFunction> _InWellWrap = {"new": _InWell};

  static int _InWell(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      Widget child;
      fieldType = ls.getField(-1, "child");
      if (fieldType == LuaType.luaUserdata) {
        child = ls.toUserdata(-1).data as Widget;
        ls.pop(1);
      } else if (fieldType == LuaType.luaNil) {
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      int onTapId = -1;
      int onDTapId = -1;
      int onLongPressId = -1;
      int onTapDownId = -1;
      int onTapUpId = -1;
      int onTapCancelId = -1;
      int onHighlightChangedId = -1;
      int onHoverId = -1;
      int onFocusId = -1;
      fieldType = ls.getField(-1, "onTap");
      if (fieldType == LuaType.luaFunction) {
        onTapId = ls.ref(lua_registryindex); //自带pop
      } else if (fieldType == LuaType.luaNil) {
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onDoubleTap");
      if (fieldType == LuaType.luaFunction) {
        onDTapId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onLongPress");
      if (fieldType == LuaType.luaFunction) {
        onLongPressId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onTapDown");
      if (fieldType == LuaType.luaFunction) {
        onTapDownId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onTapUp");
      if (fieldType == LuaType.luaFunction) {
        onTapUpId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onTapCancel");
      if (fieldType == LuaType.luaFunction) {
        onTapCancelId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onHighlightChanged");
      if (fieldType == LuaType.luaFunction) {
        onHighlightChangedId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "focusColor");
      Color focusColor;
      if (fieldType == LuaType.luaUserdata) {
        focusColor = ls.toUserdata(-1).data as Color;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "hoverColor");
      Color hoverColor;
      if (fieldType == LuaType.luaUserdata) {
        hoverColor = ls.toUserdata(-1).data as Color;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "highlightColor");
      Color highlightColor;
      if (fieldType == LuaType.luaUserdata) {
        highlightColor = ls.toUserdata(-1).data as Color;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "overlayColor");
      MaterialStateProperty<Color> overlayColor;
      if (fieldType == LuaType.luaUserdata) {
        overlayColor =
            MaterialStateProperty.all((ls.toUserdata(-1).data as Color));
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "highlightColor");
      Color splashColor;
      if (fieldType == LuaType.luaUserdata) {
        splashColor = ls.toUserdata(-1).data as Color;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "radius");
      double radius;
      if (fieldType == LuaType.luaUserdata) {
        radius = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "borderRadius");
      BorderRadius borderRadius;
      if (fieldType == LuaType.luaUserdata) {
        borderRadius = ls.toUserdata(-1).data as BorderRadius;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "autofocus");
      bool autofocus = false;
      if (fieldType == LuaType.luaUserdata) {
        autofocus = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "enableFeedback");
      bool enableFeedback = false;
      if (fieldType == LuaType.luaUserdata) {
        enableFeedback = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "excludeFromSemantics");
      bool excludeFromSemantics = false;
      if (fieldType == LuaType.luaUserdata) {
        excludeFromSemantics = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "canRequestFocus");
      bool canRequestFocus = false;
      if (fieldType == LuaType.luaUserdata) {
        canRequestFocus = ls.toBoolean(-1);
      }
      ls.pop(1);

      Userdata u = ls.newUserdata<InkWell>();
      u.data = InkWell(
          key: key,
          child: child,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          overlayColor: overlayColor,
          splashColor: splashColor,
          radius: radius,
          borderRadius: borderRadius,
          autofocus: autofocus,
          enableFeedback: enableFeedback,
          excludeFromSemantics: excludeFromSemantics,
          canRequestFocus: canRequestFocus,
          onDoubleTap: onDTapId != -1
              ? () {
                  ls.rawGetI(lua_registryindex, onDTapId);
                  ls.pCall(0, 0, 1);
                }
              : null,
          onLongPress: onLongPressId != -1
              ? () {
                  ls.rawGetI(lua_registryindex, onLongPressId);
                  ls.pCall(0, 0, 1);
                }
              : null,
          onTapDown: onTapDownId != -1
              ? (detail) {
                  ls.rawGetI(lua_registryindex, onTapDownId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              : null,
          onTapUp: onTapUpId != -1
              ? (detail) {
                  ls.rawGetI(lua_registryindex, onTapUpId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              : null,
          onTapCancel: onTapCancelId != -1
              ? () {
                  ls.rawGetI(lua_registryindex, onTapCancelId);
                  ls.pCall(0, 0, 1);
                }
              : null,
          onHighlightChanged: onHighlightChangedId != -1
              ? (highlight) {
                  ls.rawGetI(lua_registryindex, onHighlightChangedId);
                  ls.pushBoolean(highlight);
                  ls.pCall(1, 0, 1);
                }
              : null,
          onHover: onHoverId != -1
              ? (hover) {
                  ls.rawGetI(lua_registryindex, onHoverId);
                  ls.pushBoolean(hover);
                  ls.pCall(1, 0, 1);
                }
              : null,
          onFocusChange: onFocusId != -1
              ? (focus) {
                  ls.rawGetI(lua_registryindex, onFocusId);
                  ls.pushBoolean(focus);
                  ls.pCall(1, 0, 1);
                }
              : null,
          onTap: onTapId != -1
              ? () {
                  ls.rawGetI(lua_registryindex, onTapId);
                  ls.pCall(0, 0, 1);
                }
              : null);
    }
    return 1;
  }

  static int _openInWellLib(LuaState ls) {
    ls.newLib(_InWellWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("InkWell", _openInWellLib, true);
    ls.pop(1);
  }
}
