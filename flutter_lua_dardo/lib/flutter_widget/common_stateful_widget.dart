import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/lua_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class CommonStatefulWidget extends StatefulWidget {
  CommonStatefulWidget({Key key, this.name, this.path, this.data})
      : super(key: key);
  final String name;
  final String path;
  final Object data;
  @override
  _CommonStatefulWidgetState createState() => _CommonStatefulWidgetState();
}

class _CommonStatefulWidgetState extends State<CommonStatefulWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    loadLuaContent(); //注册初始化函数
    LuaType _t = LuaManager.luaState.getGlobal(widget.name);
    if (_t == LuaType.luaTable) {
      if (LuaManager.luaState.getTop() > 0) {
        var type = LuaManager.luaState.getField(-1, "initState");
        if (type == LuaType.luaFunction) {
          //呼叫lua的initState
          Userdata userdata1 = LuaManager.luaState.newUserdata<State>();
          userdata1.data = this;
          Userdata userdata2 =
              LuaManager.luaState.newUserdata<TickerProvider>();
          userdata2.data = this;
          if (widget.data is LuaTable) {
            LuaManager.luaState.pushLuaTable(widget.data);
          } else {
            LuaManager.luaState.pushNil();
          }
          LuaManager.luaState.pCall(3, 0, 1);
        } else {
          LuaManager.luaState.pop(1);
        }

        int persistentFId = -1;
        type = LuaManager.luaState.getField(-1, "persistentFrameCallback");
        if (type == LuaType.luaFunction) {
          persistentFId = LuaManager.luaState.ref(lua_registryindex);
        } else {
          LuaManager.luaState.pop(1);
        }

        int postFId = -1;
        type = LuaManager.luaState.getField(-1, "postFrameCallback");
        if (type == LuaType.luaFunction) {
          postFId = LuaManager.luaState.ref(lua_registryindex);
        } else {
          LuaManager.luaState.pop(1);
        }

        if (postFId != -1 || persistentFId != -1) {
          if (postFId != -1) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              LuaManager.luaState.rawGetI(lua_registryindex, postFId);
              LuaManager.luaState.pushInteger(timeStamp.inMilliseconds);
              LuaManager.luaState.pCall(1, 0, 1);
              if (persistentFId != -1) {
                WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
                  LuaManager.luaState.rawGetI(lua_registryindex, persistentFId);
                  LuaManager.luaState.pushInteger(timeStamp.inMilliseconds);
                  LuaManager.luaState.pCall(1, 0, 1);
                });
              }
            });
          }
        }
      }
    }
    LuaManager.luaState.setTop(0);
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
      LuaType _t = LuaManager.luaState.getGlobal(widget.name);
      if (_t == LuaType.luaTable) {
        LuaManager.luaState.setFuncs(_r, 0);
      } else {
        throw ParameterError(
            name: "没找到 " + widget.name,
            type: "Widget Error",
            expected: "Common Stateful Expected",
            source: "CommonStatefulWidget");
      }
      LuaManager.luaState.setTop(0);
    }
  }

  int _updateState(LuaState ls) {
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
  void dispose() {
    super.dispose();
    FlutterWidget.doLuaDispose(widget.name);
  }

  @override
  void deactivate() {
    super.deactivate();
    FlutterWidget.doLuaDeactivate(widget.name);
  }

  @override
  void activate() {
    super.activate();
    FlutterWidget.doLuaActivate(widget.name);
  }

  @override
  void didUpdateWidget(covariant CommonStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    FlutterWidget.doLuaDidUpdateWidget(widget.name, oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FlutterWidget.doLuaDidChangeDependencies(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterWidget.doLuaBuild<Widget>(widget.name, widget.path, context);
  }
}
