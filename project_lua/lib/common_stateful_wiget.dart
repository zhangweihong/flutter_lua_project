import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';
import 'package:project_lua/lua_manager.dart';

class CommonStatefulWidget extends StatefulWidget {
  CommonStatefulWidget({
    Key? key,
    required this.name,
    required this.path,
  }) : super(key: key);
  final String name;
  final String path;
  @override
  _CommonStatefulWidgetState createState() => _CommonStatefulWidgetState();
}

class _CommonStatefulWidgetState extends State<CommonStatefulWidget> {
  @override
  void initState() {
    loadLuaContent(); //注册初始化函数
    super.initState();
  }

  void loadLuaContent() {
    if (!LuaManager.checkLuaLoaded(widget.path)) {
      LuaManager.loadLuaContent(widget.path);
      register();
    }
  }

  void register() {
    Map<String, DartFunction> _r = {
      "setState": _updateState,
    };

    if (LuaManager.luaState != null) {
      bool is_t = LuaManager.luaState!.isTable(-1);
      if (is_t) {
        LuaManager.luaState?.setFuncs(_r, 0);
      } else {
        throw ParameterError(
            name: "Stateful Widget",
            type: "Widget Error",
            expected: "Common Stateful Expected",
            source: "CommonStatefulWidget");
      }
      var type = LuaManager.luaState?.getField(-1, "init");
      if (type == LuaType.luaFunction) {
        LuaManager.luaState?.pCall(0, 0, 1);
      }
    }
  }

  int _updateState(LuaState ls) {
    print(widget.path + "_updateState");
    setState(() {
      if (ls.getTop() > 0) {
        var filedType = ls.getField(-1, "callback");
        if (filedType == LuaType.luaFunction) {
          LuaManager.luaState?.pCall(0, 0, 1);
          LuaManager.luaState?.pop(1);
        } else {
          LuaManager.luaState?.pop(1);
        }
      }
    });
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterWidget.doLuaViewByName<Widget>(widget.name, widget.path);
  }
}
