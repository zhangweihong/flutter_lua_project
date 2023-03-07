import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class FlutterSliverGridDelegateWithFixedCrossAxisCount {
  static void require(LuaState ls) {
    ls.register("SliverGridDelegateWithFixedCrossAxisCount",
        _SliverGridDelegateWithFixedCrossAxisCountWrap);
  }

  static int _SliverGridDelegateWithFixedCrossAxisCountWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "crossAxisCount");
      int crossAxisCount;
      if (fieldType == LuaType.luaNumber) {
        crossAxisCount = ls.toIntegerX(-1);
      } else {
        throw ParameterError(
            name: 'SliverGridDelegateWithFixedCrossAxisCount',
            type: ls.typeName(fieldType),
            expected: "double",
            source:
                "SliverGridDelegateWithFixedCrossAxisCount crossAxisCount null");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "childAspectRatio");
      double childAspectRatio = 1.0;
      if (fieldType == LuaType.luaNumber) {
        childAspectRatio = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "mainAxisSpacing");
      double mainAxisSpacing = 0.0;
      if (fieldType == LuaType.luaNumber) {
        mainAxisSpacing = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "crossAxisSpacing");
      double crossAxisSpacing = 0.0;
      if (fieldType == LuaType.luaNumber) {
        crossAxisSpacing = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "mainAxisExtent");
      double mainAxisExtent;
      if (fieldType == LuaType.luaNumber) {
        mainAxisExtent = ls.toNumberX(-1);
      }
      ls.pop(1);

      Userdata userdata =
          ls.newUserdata<SliverGridDelegateWithFixedCrossAxisCount>();
      userdata.data = SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          mainAxisExtent: mainAxisExtent);
    }

    return 1;
  }
}
