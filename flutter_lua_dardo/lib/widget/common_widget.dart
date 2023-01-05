import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/common_stateful_widget.dart';
import 'package:flutter_lua_dardo/widget/common_stateless_widget.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class FlutterCommonStatelessWidget {
  static const Map<String, DartFunction> _slWrap = {"new": _newCommonStateless};

  static int _newCommonStateless(LuaState ls) {
    if (ls.getTop() > 0) {
      String widgetName = "";
      var fieldType = ls.getField(-1, "widgetName");
      if (fieldType == LuaType.luaString) {
        widgetName = ls.toStr(-1);
        ls.pop(1);
      } else {
        throw ParameterError(
            name: "CommonStatelessWidget widgetName Error",
            type: "widgetName null",
            expected: "CommonStatelessWidget",
            source: "");
      }
      String path = "";
      fieldType = ls.getField(-1, "path");
      if (fieldType == LuaType.luaString) {
        path = ls.toStr(-1);
        ls.pop(1);
      } else {
        throw ParameterError(
            name: "CommonStatelessWidget path Error",
            type: "path null",
            expected: "CommonStatelessWidget",
            source: "");
      }
      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<Widget>();
      userdata.data =
          CommonStatelessWidget(key: key, name: widgetName, path: path);
    } else {
      throw ParameterError(
          name: "FlutterCommonStatelessWidget Error",
          type: "getTop 0",
          expected: "CommonStatelessWidget",
          source: "");
    }
    return 1;
  }

  static int _openCommonStatelessLib(LuaState ls) {
    ls.newLib(_slWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("CommonStatelessWidget", _openCommonStatelessLib, true);
    ls.pop(1);
  }
}

class FlutterCommonStatefulWidget {
  static const Map<String, DartFunction> _sfWrap = {"new": _newCommonStateful};

  static int _newCommonStateful(LuaState ls) {
    if (ls.getTop() > 0) {
      String widgetName = "";
      var fieldType = ls.getField(-1, "widgetName");
      if (fieldType == LuaType.luaString) {
        widgetName = ls.toStr(-1);
        ls.pop(1);
      } else {
        throw ParameterError(
            name: "FlutterCommonStatefulWidget widgetName Error",
            type: "widgetName null",
            expected: "CommonStatefulWidget",
            source: "");
      }
      String path = "";
      fieldType = ls.getField(-1, "path");
      if (fieldType == LuaType.luaString) {
        path = ls.toStr(-1);
        ls.pop(1);
      } else {
        throw ParameterError(
            name: "FlutterCommonStatefulWidget path Error",
            type: "path null",
            expected: "CommonStatefulWidget",
            source: "");
      }
      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      Userdata userdata = ls.newUserdata<Widget>();
      userdata.data =
          CommonStatefulWidget(key: key, name: widgetName, path: path);
    } else {
      throw ParameterError(
          name: "FlutterCommonStatefulWidget Error",
          type: "getTop 0",
          expected: "CommonStatefulWidget",
          source: "");
    }
    return 1;
  }

  static int _openCommonStatefulLib(LuaState ls) {
    ls.newLib(_sfWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("CommonStatefulWidget", _openCommonStatefulLib, true);
    ls.pop(1);
  }
}
