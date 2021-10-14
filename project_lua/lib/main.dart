import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/index.dart';
import 'package:project_lua/common_stateless_wiget.dart';
import 'package:project_lua/lua_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LuaManager.initLuaState(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
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
                    context, Size(750, 1334), Orientation.portrait);
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
                    context, Size(1334, 750), Orientation.landscape);
                return Material(
                  child: child,
                );
              },
              home: CircularProgressIndicator(),
            );
          }
        });
  }
}
