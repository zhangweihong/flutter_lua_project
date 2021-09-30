import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/common_flutter_class.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterIcon {
  static Map<String, DartFunction> _iconWrap = {"new": _newIcon};

  static int _newIcon(LuaState ls) {
    IconData first = null;
    if (ls.isInteger(-1)) {
      first = FlutterIconData.get(ls.toIntegerX(-1));
      if (first == null) {
        throw ParameterError(
            name: "Flutter Icon",
            type: "iconData is Null",
            expected: "FlutterIcon Error",
            source: "");
      }
      ls.pop(1);
    } else if (ls.isTable(-1)) {
      first = FlutterIconData.get(ls.toIntegerX(-2));
      if (first == null) {
        throw ParameterError(
            name: "Flutter Icon",
            type: "iconData is Null",
            expected: "FlutterIcon Error",
            source: "");
      }
    } else {
      throw ParameterError(
          name: "Flutter Icon",
          type: "iconData is Null",
          expected: "FlutterIcon Error",
          source: "");
    }
    if (ls.getTop() > 0) {
      double _size = 60.sp;
      var fieldType = ls.getField(-1, "size");
      if (fieldType == LuaType.luaNumber) {
        _size = ls.toNumberX(-1);
      }
      ls.pop(1);

      Color _color = Colors.black;
      fieldType = ls.getField(-1, "color");
      if (fieldType == LuaType.luaUserdata) {
        _color = ls.toUserdata(-1).data as Color;
      }
      ls.pop(1);
      Userdata userdata = ls.newUserdata<Icon>();
      userdata.data = Icon(
        first,
        size: _size,
        color: _color,
      );
    }

    return 1;
  }

  static int _openIconLib(LuaState ls) {
    ls.newLib(_iconWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Icon", _openIconLib, true);
    ls.pop(1);
  }
}
