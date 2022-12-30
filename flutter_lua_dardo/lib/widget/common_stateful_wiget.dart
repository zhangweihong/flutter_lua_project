import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/lua_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class CommonStatefulWidget extends StatefulWidget {
  CommonStatefulWidget({
    Key key,
    this.name,
    this.path,
  }) : super(key: key);
  final String name;
  final String path;
  @override
  _CommonStatefulWidgetState createState() => _CommonStatefulWidgetState();
}

class _CommonStatefulWidgetState extends State<CommonStatefulWidget> {
  @override
  void initState() {
    super.initState();
    loadLuaContent(); //注册初始化函数
    var type = LuaManager.luaState.getField(-1, "initState");
    if (type == LuaType.luaFunction) {
      //呼叫lua的initState
      LuaManager.luaState?.pCall(0, 0, 1);
    }
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
      bool is_t = LuaManager.luaState.isTable(-1);
      if (is_t) {
        LuaManager.luaState.setFuncs(_r, 0);
      } else {
        throw ParameterError(
            name: "没找到 " + widget.name,
            type: "Widget Error",
            expected: "Common Stateful Expected",
            source: "CommonStatefulWidget");
      }
    }
  }

  int _updateState(LuaState ls) {
    print(widget.path + "_updateState");
    setState(() {
      if (ls.getTop() > 0) {
        var filedType = ls.getField(-1, "callback");
        if (filedType == LuaType.luaFunction) {
          LuaManager.luaState.pCall(0, 0, 1);
          LuaManager.luaState.pop(1);
        } else {
          LuaManager.luaState.pop(1);
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
