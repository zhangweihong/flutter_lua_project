import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    // TODO: implement initState
    LuaManager.loadLuaContent(widget.pagePath);
    super.initState();
  }

  void updateState(Function? callBack) {
    setState(() {
      if (callBack != null) {
        callBack();
      }
    });
  }

  loadLua() {
    try {
      return LuaManager.loadLuaContent(widget.pagePath);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterWidget.findViewByName<Widget>(widget.widgetName);
  }
}
