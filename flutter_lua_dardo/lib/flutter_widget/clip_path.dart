import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterClipPath {
  static const Map<String, DartFunction> _ClipPathWrap = {
    "new": _newClipPathWrap,
  };

  static const Map<String, DartFunction> _ClipPathMembers = {"id": null};

  static int _newClipPathWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child = null;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: 'FlutterClipPath child',
          type: ls.typeName(fieldType),
          expected: "",
          source: "FlutterClipPath child not Widget");
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
      clipper = ls.toUserdata(-1).data as CustomClipperPath;
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

    ls.newUserdata().data = ClipPath(
      key: key,
      child: child,
      clipBehavior: clip,
      clipper: clipper,
    );
    return 1;
  }

  static int _openClipPathLib(LuaState ls) {
    ls.newMetatable("ClipPathClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ClipPathMembers, 0);
    ls.newLib(_ClipPathWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("ClipPath", _openClipPathLib, true);
    ls.pop(1);
  }
}

class FlutterPathClipper {
  static void require(LuaState ls) {
    ls.register("PathClipper", (ls) {
      var filedType = ls.getField(-1, "createPath");
      var createPathId = -1;
      if (filedType == LuaType.luaFunction) {
        createPathId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: "",
            type: "",
            expected: "",
            source: "FlutterPathClipper createPath is null");
      }

      ls.newUserdata().data = CustomClipperPath((width, height) {
        Path path;
        if (createPathId != -1) {
          ls.rawGetI(lua_registryindex, createPathId);
          ls.pushNumber(width);
          ls.pushNumber(height);
          ls.pCall(2, 1, 1);
          if (ls.isUserdata(-1)) {
            path = ls.toUserdata(-1).data as Path;
          }
        }
        return path;
      });
      return 1;
    });
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  final Path Function(double, double) createPath;
  CustomClipperPath(this.createPath) {}

  @override
  Path getClip(Size size) {
    return this.createPath(size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
