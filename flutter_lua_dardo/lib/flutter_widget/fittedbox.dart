import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/alignment.dart';
import 'package:flutter_lua_dardo/flutter_widget/box_fit.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class FlutterFittedBox {
  static const Map<String, DartFunction> _FittedBoxWrap = {
    "new": _newFittedBox
  };

  static const Map<String, DartFunction> _FittedBoxMembers = {"id": null};

  static int _newFittedBox(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterFittedBox child',
          type: ls.typeName(fieldType),
          expected: "FittedBox child",
          source: "FlutterFittedBox child not Widget");
    }

    fieldType = ls.getField(-1, "fit");
    BoxFit fit = BoxFit.contain;
    if (fieldType == LuaType.luaNumber) {
      fit = FlutterBoxFit.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "alignment");
    var alignment = Alignment.center;
    if (fieldType == LuaType.luaNumber) {
      alignment = FlutterAlignment.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    fieldType = ls.getField(-1, "clipBehavior");
    var clipBehavior = Clip.none;
    if (fieldType == LuaType.luaNumber) {
      clipBehavior = FlutterClip.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = FittedBox(
        key: key,
        child: child,
        fit: fit,
        alignment: alignment,
        clipBehavior: clipBehavior);
    return 1;
  }

  static int _openFittedBoxLib(LuaState ls) {
    ls.newMetatable("FittedBoxClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_FittedBoxMembers, 0);

    ls.newLib(_FittedBoxWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("FittedBox", _openFittedBoxLib, true);
    ls.pop(1);
  }
}
