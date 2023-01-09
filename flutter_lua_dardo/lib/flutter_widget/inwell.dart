import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class FlutterInWell {
  static Map<String, DartFunction> _InWellWrap = {"new": _InWell};

  static int _InWell(LuaState ls) {
    if (ls.getTop() > 0) {
      int onTapId = -1;
      int onDTapId = -1;
      var fieldType = ls.getField(-1, "onTap");
      if (fieldType == LuaType.luaFunction) {
        onTapId = ls.ref(lua_registryindex); //自带pop
      } else if (fieldType == LuaType.luaNil) {
        ls.pop(1);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'onTap',
            type: ls.typeName(fieldType),
            expected: "Function",
            source: "FlutterInWell onTap");
      }
      fieldType = ls.getField(-1, "onDoubleTap");
      if (fieldType == LuaType.luaFunction) {
        onDTapId = ls.ref(lua_registryindex);
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
        throw ParameterError(
            name: 'child',
            type: ls.typeName(fieldType),
            expected: "Widget",
            source: "FlutterGestureDetector _newGestureDetector");
      }

      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      Userdata u = ls.newUserdata<InkWell>();
      if (onDTapId != -1) {
        u.data = InkWell(
            key: key,
            child: child,
            onDoubleTap: onDTapId != -1
                ? () {
                    ls.rawGetI(lua_registryindex, onDTapId);
                    ls.pCall(0, 0, 1);
                  }
                : null,
            onTap: onTapId != -1
                ? () {
                    ls.rawGetI(lua_registryindex, onTapId);
                    ls.pCall(0, 0, 1);
                  }
                : null);
      } else {
        u.data = InkWell(
            child: child,
            onTap: onTapId != -1
                ? () {
                    ls.rawGetI(lua_registryindex, onTapId);
                    ls.pCall(0, 0, 1);
                  }
                : null);
      }
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
