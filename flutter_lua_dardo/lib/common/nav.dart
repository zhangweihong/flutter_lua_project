import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class Nav {
  static int navPush(LuaState ls) {
    var fieldType = ls.getField(-1, "ctx");
    BuildContext context;
    if (fieldType == LuaType.luaUserdata) {
      context = ls.toUserdata(-1).data as BuildContext;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "NavPush context Null",
          type: "NavPush",
          expected: "NavPush",
          source: "NavPush context Null");
    }
    fieldType = ls.getField(-1, "widget");
    Widget w;
    if (fieldType == LuaType.luaUserdata) {
      w = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "NavPush widget Null",
          type: "NavPush",
          expected: "NavPush",
          source: "NavPush widget Null");
    }
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return w;
      },
    ));
    return 0;
  }

  static int navReplace(LuaState ls) {
    var fieldType = ls.getField(-1, "ctx");
    BuildContext context;
    if (fieldType == LuaType.luaUserdata) {
      context = ls.toUserdata(-1).data as BuildContext;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "NavPush ctx Null",
          type: "NavPush",
          expected: "NavPush",
          source: "NavPush ctx Null");
    }
    fieldType = ls.getField(-1, "widget");
    Widget w;
    if (fieldType == LuaType.luaUserdata) {
      w = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "NavReplace widget Null",
          type: "NavReplace",
          expected: "NavReplace",
          source: "NavReplace widget Null");
    }
    Navigator.pushReplacement(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return w;
      },
    ));
    return 0;
  }

  static int navPop(LuaState ls) {
    BuildContext context;
    if (ls.isUserdata(-1)) {
      context = ls.toUserdata(-1).data as BuildContext;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "navPop context Null",
          type: "navPop",
          expected: "navPop",
          source: "navPop context Null");
    }
    Navigator.pop(context);
    return 0;
  }

  static int navReplaceAndRemoveAll(LuaState ls) {
    var fieldType = ls.getField(-1, "ctx");
    BuildContext context;
    if (fieldType == LuaType.luaUserdata) {
      context = ls.toUserdata(-1).data as BuildContext;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "NavReplaceAndRemoveAll ctx Null",
          type: "NavReplaceAndRemoveAll",
          expected: "NavReplaceAndRemoveAll",
          source: "NavReplaceAndRemoveAll ctx Null");
    }
    fieldType = ls.getField(-1, "widget");
    Widget w;
    if (fieldType == LuaType.luaUserdata) {
      w = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "NavReplaceAndRemoveAll widget Null",
          type: "NavReplaceAndRemoveAll",
          expected: "NavReplaceAndRemoveAll",
          source: "NavReplaceAndRemoveAll widget Null");
    }
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return w;
      },
    ), ModalRoute.withName('/'));
    return 0;
  }
}
