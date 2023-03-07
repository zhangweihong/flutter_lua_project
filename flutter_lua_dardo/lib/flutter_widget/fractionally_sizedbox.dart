import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/alignment.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterFractionallySizedBox {
  static const Map<String, DartFunction> _FractionallySizedBoxWrap = {
    "new": _newContainer
  };

  static const Map<String, DartFunction> _FractionallySizedBoxMembers = {
    "id": null
  };

  static int _newContainer(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "alignment");
    var alignment = Alignment.center;
    if (fieldType == LuaType.luaNumber) {
      alignment = FlutterAlignment.get(ls.toIntegerX(-1));
    } else if (fieldType == LuaType.luaUserdata) {
      alignment = ls.toUserdata(-1).data as Alignment;
    }
    ls.pop(1);

    double widthFactor = null;
    fieldType = ls.getField(-1, "widthFactor");
    if (fieldType == LuaType.luaNumber) {
      widthFactor = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    double heightFactor = null;
    fieldType = ls.getField(-1, "heightFactor");
    if (fieldType == LuaType.luaNumber) {
      heightFactor = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = FractionallySizedBox(
        key: key,
        child: child,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor);
    return 1;
  }

  static int _openFractionallySizedBoxLib(LuaState ls) {
    ls.newMetatable("FractionallySizedBoxClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_FractionallySizedBoxMembers, 0);

    ls.newLib(_FractionallySizedBoxWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("FractionallySizedBox", _openFractionallySizedBoxLib, true);
    ls.pop(1);
  }
}
