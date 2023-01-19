import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/alignment.dart';
import 'package:flutter_lua_dardo/flutter_widget/init_widget.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class FlutterAlign {
  static const className = "AlignClass";
  static const Map<String, DartFunction> _centerWrap = {
    "new": _newAlign,
  };

  static const Map<String, DartFunction> _centerMembers = {"id": null};

  static int _newAlign(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = InitWidget();
    AlignmentGeometry alignment = Alignment.topLeft;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else if (fieldType == LuaType.luaNil) {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterAlign',
          type: ls.typeName(fieldType),
          expected: "type",
          source: "FlutterAlign Child luaNil");
    }

    fieldType = ls.getField(-1, "alignment");
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

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata u = ls.newUserdata<Align>();
    u.data = Align(
        child: child,
        key: key,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor);

    return 1;
  }

  static int _openCenterLib(LuaState ls) {
    ls.newMetatable(className);
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_centerMembers, 0);

    ls.newLib(_centerWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Align", _openCenterLib, true);
    ls.pop(1);
  }
}
