import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:project_lua/lua_manager.dart';

class CommonStatefulWidget extends StatefulWidget {
  CommonStatefulWidget({
    Key? key,
    required this.pagePath,
    required this.widgetName,
  }) : super(key: key);
  final String pagePath;
  final String widgetName;
  @override
  _CommonStatefulWidgetState createState() => _CommonStatefulWidgetState();
}

class _CommonStatefulWidgetState extends State<CommonStatefulWidget> {
  @override
  void initState() {
    LuaManager.loadLuaContent(widget.pagePath); //加载lua代码
    register(); //注册初始化函数
    super.initState();
  }

  void register() {
    Map<String, DartFunction> _r = {
      "setState": _updateState,
      "init": _init,
    };

    if (LuaManager.luaState != null) {
      var type = LuaManager.luaState?.getGlobal(widget.widgetName);
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
    print(widget.widgetName + "_init");
    return 1;
  }

  int _updateState(LuaState ls) {
    print(widget.widgetName + "_updateState");
    setState(() {
      var filedType = ls.getField(-1, "callback");
      if (filedType == LuaType.luaFunction) {
        LuaManager.luaState?.pCall(0, 0, 1);
        LuaManager.luaState?.pop(1);
      } else {
        LuaManager.luaState?.pop(1);
      }
    });
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterWidget.doLuaViewByName<Widget>(widget.widgetName);
  }
}
