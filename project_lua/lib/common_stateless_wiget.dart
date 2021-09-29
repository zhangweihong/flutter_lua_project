import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';
import 'package:project_lua/lua_manager.dart';

// ignore: must_be_immutable
class CommonStatelessWidget extends StatelessWidget {
  CommonStatelessWidget({Key? key, required this.name, required this.path})
      : super(key: key);
  final String name;
  final String path;
  void register() {
    Map<String, DartFunction> _wrap = {};

    if (LuaManager.luaState != null) {
      LuaType _t = LuaManager.luaState!.getGlobal(name);
      if (_t == LuaType.luaTable) {
        LuaManager.luaState?.setFuncs(_wrap, 0);
      } else {
        throw ParameterError(
            name: "Stateless Widget",
            type: "Widget Error",
            expected: "Common Stateless Expected",
            source: "CommonStatelessWidget");
      }
      var type = LuaManager.luaState?.getField(-1, "init");
      if (type == LuaType.luaFunction) {
        LuaManager.luaState?.pCall(0, 0, 1);
      }
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
    return FlutterWidget.doLuaViewByName<Widget>(name, path);
  }
}
