import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterOpacity {
  static const Map<String, DartFunction> _OpacityWrap = {
    "new": _newOpacityWrap,
  };

  static const Map<String, DartFunction> _OpacityMembers = {"id": null};

  static int _newOpacityWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "opacity");
      var opacity;
      if (fieldType == LuaType.luaNumber) {
        opacity = ls.toNumberX(-1);
      } else {
        throw ParameterError(
            name: "FlutterOpacity",
            type: "",
            expected: "FlutterOpacity opacity is null",
            source: "FlutterOpacity");
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
      fieldType = ls.getField(-1, "child");
      var child;
      if (fieldType == LuaType.luaUserdata) {
        child = ls.toUserdata(-1).data as Widget;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "alwaysIncludeSemantics");
      bool alwaysIncludeSemantics;
      if (fieldType == LuaType.luaBoolean) {
        alwaysIncludeSemantics = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<Opacity>();
      userdata.data = Opacity(
        opacity: opacity,
        key: key,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        child: child,
      );
    }

    return 1;
  }

  static int _openOpacityLib(LuaState ls) {
    ls.newMetatable("OpacityClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_OpacityMembers, 0);

    ls.newLib(_OpacityWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Opacity", _openOpacityLib, true);
    ls.pop(1);
  }
}
