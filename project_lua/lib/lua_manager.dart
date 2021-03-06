// ignore: unused_import
import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/index.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_lua/common_stateful_wiget.dart';
import 'package:project_lua/common_stateless_wiget.dart';

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
      Userdata userdata = ls.newUserdata<Widget>();
      userdata.data = CommonStatelessWidget(name: widgetName, path: path);
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
      Userdata userdata = ls.newUserdata<Widget>();
      userdata.data = CommonStatefulWidget(name: widgetName, path: path);
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

class LuaManager {
  static LuaState? _state;

  static LuaState? get luaState {
    return _state;
  }

  static Map<String, String> _luaContentMap = Map<String, String>();
  static Map<String, bool> _luaLoadedMap = Map<String, bool>();

  static initLuaState({bool fromNet = false}) async {
    _luaContentMap = Map<String, String>();
    if (_state == null) {
      _state = LuaState.newState();
      // ???????????????
      _state!.openLibs(); //????????? ?????????print
    }
    _state!.register("require", _requireWrap);
    FlutterWidget.open(_state!);
    FlutterCommonStatefulWidget.require(_state!);
    FlutterCommonStatelessWidget.require(_state!);
    FlutterUtils.open(_state);
    await _loadAllLuaContent(fromNet: fromNet);
    return true;
  }

  static _loadAllLuaContent({bool fromNet = false}) async {
    //??????????????????????????? ???????????? ?????????????????????????????????

    if (!fromNet) {
      var _luaArry = [
        "lua/dkjson.lua",
        "lua/app.lua",
        "lua/component/my_stateful_widget.lua",
        "lua/component/my_stateless_widget.lua"
      ];
      for (var item in _luaArry) {
        String src = await rootBundle.loadString("assets/$item");
        _luaContentMap[item] = src;
      }
    } else {
      // var dir = await getApplicationDocumentsDirectory();
      // String luaPath = dir.path + "/lua/";
      // var _luaNetArry = []; //??????????????????????????????????????????
      // Directory luaDir = Directory(luaPath);
      // luaDir.listSync().forEach((element) {
      //   print(element.path); // ??????  _luaNetArry ??? ???????????????????????????
      // });
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
        _luaLoadedMap[path]!) {
      return true;
    }
    return false;
  }

  static bool loadLuaContent(String path) {
    try {
      String? src = _luaContentMap[path];
      if (src!.isEmpty) {
        debugPrint(path + " _luaContentMap not find");
        return false;
      }

      bool _load = _state!.doString(src);
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
