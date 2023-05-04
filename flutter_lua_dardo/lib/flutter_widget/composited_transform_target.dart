import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/alignment.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterCompositedTransformTarget {
  static const Map<String, DartFunction> _CompositedTransformTargetWrap = {
    'new': _newCompositedTransformTargetWrap,
  };

  static const Map<String, DartFunction> _CompositedTransformTargetMembers = {
    'id': null
  };

  static int _newCompositedTransformTargetWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    Widget child;
    fieldType = ls.getField(-1, "child");
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    var link;
    fieldType = ls.getField(-1, "link");
    if (fieldType == LuaType.luaUserdata) {
      link = ls.toUserdata(-1).data as LayerLink;
    } else {
      throw ParameterError(
        name: "FlutterCompositedTransformTarget link is null",
        type: "",
        expected: "",
        source: "composited_transform_target.dart",
      );
    }
    ls.pop(1);

    ls.newUserdata().data = CompositedTransformTarget(
      key: key,
      link: link,
      child: child,
    );
    return 1;
  }

  static int _openCompositedTransformTargetLib(LuaState ls) {
    ls.newMetatable('CompositedTransformTargetClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_CompositedTransformTargetMembers, 0);
    ls.newLib(_CompositedTransformTargetWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF(
        'CompositedTransformTarget', _openCompositedTransformTargetLib, true);
    ls.pop(1);
  }
}

class FlutterCompositedTransformFollower {
  static const Map<String, DartFunction> _CompositedTransformFollowerWrap = {
    'new': _newCompositedTransformFollowerWrap,
  };

  static const Map<String, DartFunction> _CompositedTransformFollowerMembers = {
    'id': null
  };

  static int _newCompositedTransformFollowerWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    var link;
    fieldType = ls.getField(-1, "link");
    if (fieldType == LuaType.luaUserdata) {
      link = ls.toUserdata(-1).data as LayerLink;
    } else {
      throw ParameterError(
        name: "CompositedTransformFollower link is null",
        type: "",
        expected: "",
        source: "composited_transform_target.dart",
      );
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "showWhenUnlinked");
    bool showWhenUnlinked = true;
    if (fieldType == LuaType.luaBoolean) {
      showWhenUnlinked = ls.toBoolean(-1);
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

    fieldType = ls.getField(-1, "offset");
    Offset offset = Offset.zero;
    if (fieldType == LuaType.luaUserdata) {
      offset = ls.toUserdata(-1).data as Offset;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "targetAnchor");
    Alignment targetAnchor = Alignment.topLeft;
    if (fieldType == LuaType.luaNumber) {
      targetAnchor = FlutterAlignment.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "followerAnchor");
    Alignment followerAnchor = Alignment.topLeft;
    if (fieldType == LuaType.luaNumber) {
      followerAnchor = FlutterAlignment.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    ls.newUserdata().data = CompositedTransformFollower(
      key: key,
      link: link,
      showWhenUnlinked: showWhenUnlinked,
      offset: offset,
      child: child,
      targetAnchor: targetAnchor,
      followerAnchor: followerAnchor,
    );

    return 1;
  }

  static int _openCompositedTransformFollowerLib(LuaState ls) {
    ls.newMetatable('CompositedTransformFollowerClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_CompositedTransformFollowerMembers, 0);
    ls.newLib(_CompositedTransformFollowerWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('CompositedTransformFollower',
        _openCompositedTransformFollowerLib, true);
    ls.pop(1);
  }
}
