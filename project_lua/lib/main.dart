import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/lua_manager.dart';
import 'package:flutter_lua_dardo/widget/common_stateless_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LuaManager.initLuaState(fromNet: false, allLua: [
          "assets/lua/dkjson.lua",
          "assets/lua/component/my_stateful_widget.lua",
          "assets/lua/component/my_stateless_widget.lua",
          "assets/lua/page/test_page1.lua",
          "assets/lua/page/test_pageview.lua",
          "assets/lua/page/test_stf.lua",
          "assets/lua/page/test_listview.lua",
          "assets/lua/page/test_listview_builder.lua",
          "assets/lua/page/test_listview_custom.lua",
          "assets/lua/page/test_listview_sp.lua",
          "assets/lua/page/test_gridview.lua",
          "assets/lua/app.lua",
        ]),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              builder: (context, child) {
                FlutterWidget.init(
                    context, const Size(750, 1334), Orientation.portrait);
                return Material(
                  child: child,
                );
              },
              home: CommonStatelessWidget(
                  name: "app", path: "assets/lua/app.lua"),
            );
          } else {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              builder: (context, child) {
                FlutterWidget.init(
                    context, const Size(1334, 750), Orientation.landscape);
                return Material(
                  child: child,
                );
              },
              home: const CircularProgressIndicator(),
            );
          }
        });
  }
}
