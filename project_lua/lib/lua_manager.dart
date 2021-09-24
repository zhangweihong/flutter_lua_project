import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class LuaManager {
  static LuaState? _state;

  static LuaState? get luaState {
    return _state;
  }

  static Map<String, String> _luaContentMap = Map<String, String>();

  static initLuaState() async {
    _luaContentMap = Map<String, String>();
    if (_state == null) {
      _state = LuaState.newState();
      // 加载标准库
      _state!.openLibs(); //标准库 会覆盖print
    }
    _state!.register("require", _requireWrap);
    FlutterWidget.open(_state);
    FlutterUtils.open(_state);
    await _loadAllLuaContent();
    return true;
  }

  static _loadAllLuaContent() async {
    var _luaArry = ["assets/lua/dkjson.lua", "assets/lua/app.lua"];

    for (var item in _luaArry) {
      String src = await rootBundle.loadString(item);
      _luaContentMap[item] = src;
    }
  }

  static int _requireWrap(LuaState ls) {
    String path = ls.checkString(1);
    loadLuaContent(path);
    return 0;
  }

  static bool loadLuaContent(String path) {
    try {
      String? src = _luaContentMap[path];
      if (src!.isEmpty) {
        debugPrint(path + " _luaContentMap not find");
        return false;
      }
      bool _load = _state!.doString(src);
      if (_load) {
        debugPrint(path + " Is Loaded Success");
      } else {
        debugPrint(path + " Is Loaded Fail");
      }
      return _load;
    } catch (e) {
      throw ParameterError(
          name: path,
          type: "File Error",
          source: e.toString(),
          expected: 'File');
    }
  }
}
