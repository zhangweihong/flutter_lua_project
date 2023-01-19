import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/alignment.dart';
import 'package:flutter_lua_dardo/flutter_widget/filterquality.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterTransform {
  static const Map<String, DartFunction> _TransformWrap = {
    "new": _newTransform,
  };

  static const Map<String, DartFunction> _TransformMembers = {"id": null};

  static int _newTransform(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "transform");
      Matrix4 transform = Matrix4.zero();
      if (fieldType == LuaType.luaUserdata) {
        transform = ls.toUserdata(-1).data as Matrix4;
      } else {
        throw ParameterError(
            name: 'FlutterTransform',
            type: ls.typeName(fieldType),
            expected: "transform",
            source: "FlutterMatrix4 transform is null");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "alignment");
      Alignment alignment;
      if (fieldType == LuaType.luaNumber) {
        alignment = FlutterAlignment.get(ls.toIntegerX(-1));
      } else if (fieldType == LuaType.luaUserdata) {
        alignment = ls.toUserdata(-1).data as Alignment;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "child");
      Widget child;
      if (fieldType == LuaType.luaUserdata) {
        child = ls.toUserdata(-1).data as Widget;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "transformHitTests");
      bool transformHitTests = true;
      if (fieldType == LuaType.luaBoolean) {
        transformHitTests = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "filterQuality");
      FilterQuality filterQuality;
      if (fieldType == LuaType.luaNumber) {
        filterQuality = FlutterFilterQuality.get(ls.toIntegerX(-1));
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "origin");
      Offset origin;
      if (fieldType == LuaType.luaUserdata) {
        origin = ls.toUserdata(-1).data as Offset;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<Transform>();
      userdata.data = Transform(
          key: key,
          transform: transform,
          alignment: alignment,
          origin: origin,
          transformHitTests: transformHitTests,
          child: child,
          filterQuality: filterQuality);
    }

    return 1;
  }

  static int _openTextLib(LuaState ls) {
    ls.newMetatable("TransformClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_TransformMembers, 0);

    ls.newLib(_TransformWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Transform", _openTextLib, true);
    ls.pop(1);
  }
}
