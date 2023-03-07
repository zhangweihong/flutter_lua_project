import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class FlutterClipRRect {
  static const Map<String, DartFunction> _ClipRRectWrap = {
    "new": _newClipRRectWrap,
  };

  static const Map<String, DartFunction> _ClipRRectMembers = {"id": null};

  static int _newClipRRectWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterClipRRect child',
          type: ls.typeName(fieldType),
          expected: "",
          source: "FlutterClipRRect child not Widget");
    }

    fieldType = ls.getField(-1, "borderRadius");
    var radius = BorderRadius.zero;
    if (fieldType == LuaType.luaUserdata) {
      radius = ls.toUserdata(-1).data as BorderRadius;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "clipBehavior");
    var clip = Clip.antiAlias;
    if (fieldType == LuaType.luaNumber) {
      clip = FlutterClip.get(ls.toIntegerX(-1));
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

    fieldType = ls.getField(-1, "clipper");
    var clipper;
    if (fieldType == LuaType.luaUserdata) {
      clipper = ls.toUserdata(-1).data as CustomClipperRRect;
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = ClipRRect(
      key: key,
      borderRadius: radius,
      child: child,
      clipper: clipper,
      clipBehavior: clip,
    );

    return 1;
  }

  static int _openClipRRectLib(LuaState ls) {
    ls.newMetatable("ClipRRectClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ClipRRectMembers, 0);

    ls.newLib(_ClipRRectWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("ClipRRect", _openClipRRectLib, true);
    ls.pop(1);
  }
}

class FlutterRRectClipper {
  static void require(LuaState ls) {
    ls.register("RRectClipper", (ls) {
      var filedType = ls.getField(-1, "createRRect");
      var createRRectId = -1;
      if (filedType == LuaType.luaFunction) {
        createRRectId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: "",
            type: "",
            expected: "",
            source: "FlutterRRectClipper createRRect is null");
      }

      ls.newUserdata().data = CustomClipperRRect((width, height) {
        RRect rrect;
        if (createRRectId != -1) {
          ls.rawGetI(lua_registryindex, createRRectId);
          ls.pushNumber(width);
          ls.pushNumber(height);
          ls.pCall(2, 1, 1);
          if (ls.isUserdata(-1)) {
            rrect = ls.toUserdata(-1).data as RRect;
          }
        }
        return rrect;
      });
      return 1;
    });
  }
}

class CustomClipperRRect extends CustomClipper<RRect> {
  final RRect Function(double, double) createRRect;
  CustomClipperRRect(this.createRRect) {}

  @override
  RRect getClip(Size size) {
    return this.createRRect(size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return false;
  }
}
