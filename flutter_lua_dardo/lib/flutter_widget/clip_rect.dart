import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterClipRect {
  static const Map<String, DartFunction> _ClipRectWrap = {
    "new": _newClipRectWrap,
  };

  static const Map<String, DartFunction> _ClipRectMembers = {"id": null};

  static int _newClipRectWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterClipRect child',
          type: ls.typeName(fieldType),
          expected: "",
          source: "FlutterClipRect child not Widget");
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
      clipper = ls.toUserdata(-1).data as CustomClipperRect;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "clipBehavior");
    var clip = Clip.antiAlias;
    if (fieldType == LuaType.luaNumber) {
      clip = FlutterClip.get(ls.toIntegerX(-1));
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = ClipRect(
      key: key,
      child: child,
      clipper: clipper,
      clipBehavior: clip,
    );
    return 1;
  }

  static int _openClipRectLib(LuaState ls) {
    ls.newMetatable("ClipRectClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ClipRectMembers, 0);

    ls.newLib(_ClipRectWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("ClipRect", _openClipRectLib, true);
    ls.pop(1);
  }
}

class FlutterRectClipper {
  static void require(LuaState ls) {
    ls.register("RectClipper", (ls) {
      var filedType = ls.getField(-1, "createRect");
      var createRectId = -1;
      if (filedType == LuaType.luaFunction) {
        createRectId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: "",
            type: "",
            expected: "",
            source: "FlutterRectClipper createRect is null");
      }

      ls.newUserdata().data = CustomClipperRect((width, height) {
        Rect rect;
        if (createRectId != -1) {
          ls.rawGetI(lua_registryindex, createRectId);
          ls.pushNumber(width);
          ls.pushNumber(height);
          ls.pCall(2, 1, 1);
          if (ls.isUserdata(-1)) {
            rect = ls.toUserdata(-1).data as Rect;
          }
        }
        return rect;
      });
      return 1;
    });
  }
}

class CustomClipperRect extends CustomClipper<Rect> {
  final Rect Function(double, double) createRect;
  CustomClipperRect(this.createRect) {}

  @override
  Rect getClip(Size size) {
    return this.createRect(size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
