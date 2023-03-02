import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/lua_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

// ignore: must_be_immutable
class CommonStatelessWidget extends StatelessWidget {
  CommonStatelessWidget({Key key, this.name, this.path, this.data})
      : super(key: key);
  final String name;
  final String path;
  final Object data;
  void register() {
    Map<String, DartFunction> _wrap = {};

    if (LuaManager.luaState != null) {
      LuaType _t = LuaManager.luaState.getGlobal(name);
      if (_t == LuaType.luaTable) {
        LuaManager.luaState?.setFuncs(_wrap, 0);
      } else {
        throw ParameterError(
            name: "Stateless Widget 没找到 " + name,
            type: "Widget Error",
            expected: "Common Stateless Expected",
            source: "CommonStatelessWidget");
      }

      var fieldType =
          LuaManager.luaState?.getField(-1, "init"); // 注册一次call Lua的 init
      if (fieldType == LuaType.luaFunction) {
        if (data is LuaTable) {
          LuaManager.luaState.pushLuaTable(data);
        } else {
          LuaManager.luaState.pushNil();
        }
        LuaManager.luaState?.pCall(1, 0, 1);
      }
      LuaManager.luaState?.pop(1);
    }
  }

  void loadLuaContent() {
    if (!LuaManager.checkLuaLoaded(path)) {
      LuaManager.loadLuaContent(path);
      register();
    }
  }

  @override
  Widget build(BuildContext context) {
    this.loadLuaContent();
    return FlutterWidget.doLuaBuild<Widget>(name, path, context);
  }
}
