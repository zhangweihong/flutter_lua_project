// ignore: unused_import
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/index.dart';
// ignore: import_of_legacy_library_into_null_safe

class LuaManager {
  static LuaState _state;

  static LuaState get luaState {
    return _state;
  }

  static Map<String, String> _luaContentMap = <String, String>{};
  static Map<String, bool> _luaLoadedMap = <String, bool>{};
  /**
   * 初始化luastate
   * registerFunc 为自己注册的函数
   */
  static initLuaState(
      {bool fromNet = false,
      Function(LuaState) registerFunc = null,
      String host = "",
      List<String> allLua}) async {
    _luaContentMap = <String, String>{};
    if (_state == null) {
      _state = LuaState.newState();
      // 加载标准库
      _state.openLibs();
    }
    _state.register("require", _requireWrap);
    FlutterWidget.open(_state);
    if (registerFunc != null) {
      registerFunc(_state);
    }
    await _loadAllLuaContent(fromNet: fromNet, host: host, allLua: allLua);
    return true;
  }

  static _loadAllLuaContent(
      {bool fromNet = false, String host = "", List<String> allLua}) async {
    if (allLua == null) {
      allLua = List.empty(growable: true);
    }
    for (String item in allLua) {
      await dynamicLoadLuaContent(fromNet: false, luaPath: item);
    }
  }

  static dynamicLoadLuaContent({bool fromNet = false, String luaPath}) async {
    var mapContent = _luaContentMap[luaPath];
    if (mapContent != null && mapContent.isNotEmpty) {
      return mapContent;
    }
    if (!fromNet) {
      String src = await rootBundle.loadString("$luaPath");
      if (src != null && src.isNotEmpty) {
        _luaContentMap[luaPath] = src;
      } else {
        throw ParameterError(
          name: luaPath,
          type: "$luaPath is empty",
          source: "",
          expected: 'File Content Is empty',
        );
      }
    }
  }

  static int _requireWrap(LuaState ls) {
    String path = ls.checkString(1);
    loadLuaContent(path);
    return 1;
  }

  static bool checkLuaLoaded(String path) {
    if (_luaLoadedMap.containsKey(path) &&
        _luaLoadedMap[path] != null &&
        _luaLoadedMap[path]) {
      return true;
    }
    return false;
  }

  static bool loadLuaContent(String path) {
    try {
      String src = _luaContentMap[path];
      if (src == null || src.isEmpty) {
        debugPrint(path + "  not find in _luaContentMap");
        return false;
      }
      bool _load = _state.doString(src);
      _luaLoadedMap[path] = _load;
      if (_load) {
        debugPrint(path + " Is Loaded Success");
      } else {
        debugPrint(path + " Is Loaded Fail");
      }
      return _load;
    } catch (e) {
      throw ParameterError(
          name: path,
          type: "$path luaContentMap not find Key",
          source: e.toString(),
          expected: 'File Content Is Null');
    }
  }
}
