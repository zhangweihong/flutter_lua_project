import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterCircleAvatar {
  static const Map<String, DartFunction> _CircleAvatarWrap = {
    "new": _newCircleAvatar
  };

  static const Map<String, DartFunction> _CircleAvatarMembers = {"id": null};

  static int _newCircleAvatar(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "backgroundColor");
    var backgroundColor;
    if (fieldType == LuaType.luaUserdata) {
      backgroundColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "foregroundColor");
    var foregroundColor;
    if (fieldType == LuaType.luaUserdata) {
      foregroundColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "backgroundImage");
    Image backgroundImage;
    if (fieldType == LuaType.luaUserdata) {
      backgroundImage = ls.toUserdata(-1).data as Image;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "foregroundImage");
    Image foregroundImage;
    if (fieldType == LuaType.luaUserdata) {
      foregroundImage = ls.toUserdata(-1).data as Image;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "radius");
    var radius;
    if (radius == LuaType.luaNumber) {
      radius = ls.toNumberX(-1);
    }
    ls.pop(1);
    fieldType = ls.getField(-1, "minRadius");
    var minRadius;
    if (radius == LuaType.luaNumber) {
      minRadius = ls.toNumberX(-1);
    }
    ls.pop(1);
    fieldType = ls.getField(-1, "maxRadius");
    var maxRadius;
    if (radius == LuaType.luaNumber) {
      maxRadius = ls.toNumberX(-1);
    }
    ls.pop(1);

    ls.newUserdata<CircleAvatar>().data = CircleAvatar(
      child: child,
      backgroundColor: backgroundColor,
      backgroundImage: backgroundImage != null ? backgroundImage.image : null,
      foregroundImage: foregroundImage != null ? foregroundImage.image : null,
      foregroundColor: foregroundColor,
      radius: radius,
      minRadius: minRadius,
      maxRadius: maxRadius,
    );

    return 1;
  }

  static int _openCircleAvatarLib(LuaState ls) {
    ls.newMetatable("CircleAvatarClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_CircleAvatarMembers, 0);

    ls.newLib(_CircleAvatarWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("CircleAvatar", _openCircleAvatarLib, true);
    ls.pop(1);
  }
}
