import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterPreferredSize {
  static const Map<String, DartFunction> _PreferredSizeWrap = {
    "new": _newPreferredSizeWidget
  };

  static const Map<String, DartFunction> _PreferredSizeMembers = {"id": null};

  static int _newPreferredSizeWidget(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "FlutterPreferredSize",
          type: "",
          expected: "FlutterPreferredSize child is null",
          source: "");
    }

    fieldType = ls.getField(-1, "preferredSize");
    Size preferredSize;
    if (fieldType == LuaType.luaUserdata) {
      preferredSize = ls.toUserdata(-1).data as Size;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "FlutterPreferredSize",
          type: "",
          expected: "FlutterPreferredSize preferredSize is null",
          source: "");
    }

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<PreferredSizeWidget>();
    userdata.data = PreferredSize(
      key: key,
      child: child,
      preferredSize: preferredSize,
    );
  }

  static int _openPreferredSizeLib(LuaState ls) {
    ls.newMetatable("PreferredSizeClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_PreferredSizeMembers, 0);

    ls.newLib(_PreferredSizeWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("PreferredSize", _openPreferredSizeLib, true);
    ls.pop(1);
  }
}
