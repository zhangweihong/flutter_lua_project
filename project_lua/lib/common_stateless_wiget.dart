import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:project_lua/lua_manager.dart';

// ignore: must_be_immutable
class CommonStatelessWidget extends StatelessWidget {
  CommonStatelessWidget(
      {Key? key, required this.widgetName, required this.pagePath})
      : super(key: key);
  final String widgetName;
  final String pagePath;

  void register() {
    Map<String, DartFunction> _r = {
      "init": _init,
    };

    if (LuaManager.luaState != null) {
      var type = LuaManager.luaState?.getGlobal(widgetName);
      if (type == LuaType.luaTable) {
        LuaManager.luaState?.setFuncs(_r, 0);
      }
      type = LuaManager.luaState?.getField(-1, "init");
      if (type == LuaType.luaFunction) {
        LuaManager.luaState?.pCall(0, 0, 1);
        LuaManager.luaState?.pop(1);
      } else {
        LuaManager.luaState?.pop(1);
      }
    }
  }

  int _init(LuaState ls) {
    print(widgetName + "_init");
    return 1;
  }

  void loadLuaContent() {
    if (!LuaManager.checkLuaLoaded(pagePath)) {
      LuaManager.loadLuaContent(pagePath);
      register();
    }
  }

  @override
  Widget build(BuildContext context) {
    this.loadLuaContent();
    return FlutterWidget.doLuaViewByName<Widget>(widgetName);
  }
}
