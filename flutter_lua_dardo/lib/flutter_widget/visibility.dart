import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterVisibility {
  static const Map<String, DartFunction> _VisibilityWrap = {
    "new": _newVisibility,
  };

  static const Map<String, DartFunction> _VisibilityMembers = {"id": null};

  static int _newVisibility(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "child");
      Widget child;
      if (fieldType == LuaType.luaUserdata) {
        child = ls.toUserdata(-1).data as Widget;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "replacement");
      Widget replacement = const SizedBox.shrink();
      if (fieldType == LuaType.luaUserdata) {
        replacement = ls.toUserdata(-1) as Widget;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "visible");
      bool visible = true;
      if (fieldType == LuaType.luaBoolean) {
        visible = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "maintainState");
      bool maintainState = false;
      if (fieldType == LuaType.luaBoolean) {
        maintainState = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "maintainAnimation");
      bool maintainAnimation = false;
      if (fieldType == LuaType.luaBoolean) {
        maintainAnimation = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "maintainSize");
      bool maintainSize = false;
      if (fieldType == LuaType.luaBoolean) {
        maintainSize = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "maintainSemantics");
      bool maintainSemantics = false;
      if (fieldType == LuaType.luaBoolean) {
        maintainSemantics = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "maintainInteractivity");
      bool maintainInteractivity = false;
      if (fieldType == LuaType.luaBoolean) {
        maintainInteractivity = ls.toBoolean(-1);
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<Visibility>();
      userdata.data = Visibility(
          key: key,
          child: child,
          replacement: replacement,
          visible: visible,
          maintainState: maintainState,
          maintainAnimation: maintainAnimation,
          maintainSize: maintainSize,
          maintainSemantics: maintainSemantics,
          maintainInteractivity: maintainInteractivity);
    }
    return 1;
  }

  static int _openVisibilityLib(LuaState ls) {
    ls.newMetatable("VisibilityClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_VisibilityMembers, 0);

    ls.newLib(_VisibilityWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Visibility", _openVisibilityLib, true);
    ls.pop(1);
  }
}
