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
   */
  static initLuaState(
      {bool fromNet = false,
      Function(LuaState) registerFunc = null,
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
    await _loadAllLuaContent(fromNet: fromNet, allLua: allLua);
    return true;
  }

  static _loadAllLuaContent({bool fromNet = false, List<String> allLua}) async {
    //为了测试方便现阶段 本地加载 后期考虑网络缓存后加载
    if (!fromNet) {
      if (allLua == null) {
        allLua = List.empty(growable: true);
      }
      for (String item in allLua) {
        // String src = await rootBundle.loadString("assets/$item");
        // if (src.isNotEmpty) {
        //   _luaContentMap[item] = src;
        // } else {
        //   throw ParameterError(
        //     name: item,
        //     type: "$item is empty",
        //     source: "",
        //     expected: 'File Content Is empty',
        //   );
        // }
        await dynamicLoadLuaContent(fromNet: false, luaPath: item);
      }
    } else {
      // var dir = await getApplicationDocumentsDirectory();
      // String luaPath = dir.path + "/lua/";
      // var _luaNetArry = []; //从网络中获取到最新的资源列表
      // Directory luaDir = Directory(luaPath);
      // luaDir.listSync().forEach((element) {
      //   print(element.path); // 使用  _luaNetArry 和 本地的脚本进行比对
      // });
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
