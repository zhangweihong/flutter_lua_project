import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/flutter_widget/common_stateless_widget.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/index.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_lua_dardo/lua_manager.dart';
import 'package:flutter_lua_dardo/state/common_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FlutterCommonState.state(),
        )
      ],
      child: FutureBuilder(
          future: LuaManager.initLuaState(
              fromNet: false,
              host: null,
              registerFunc: (LuaState ls) {}, //注册自定义的Dart To Lua
              allLua: [
                "assets/lua/dkjson.lua",
                "assets/lua/component/my_stateful_widget.lua",
                "assets/lua/component/my_stateless_widget.lua",
                "assets/lua/test/test_page1.lua",
                "assets/lua/test/test_pageview.lua",
                "assets/lua/test/test_stf.lua",
                "assets/lua/test/test_listview.lua",
                "assets/lua/test/test_listview_builder.lua",
                "assets/lua/test/test_listview_custom.lua",
                "assets/lua/test/test_listview_sp.lua",
                "assets/lua/test/test_gridview.lua",
                "assets/lua/test/test_helper.lua",
                "assets/lua/test/test_safearea.lua",
                "assets/lua/test/test_ani.lua",
                "assets/lua/test/test_positioned.lua",
                "assets/lua/test/test_share_preferences.lua",
                "assets/lua/app.lua",
                "assets/lua/test/test_consumer.lua",
                "assets/lua/test/test_bottomnavigationbar.lua",
                "assets/lua/test/test_dkjson.lua",
                "assets/lua/test/test_netagent.lua",
                "assets/lua/test/test_sig_scrollview.lua",
                "assets/lua/test/test_clipboard.lua",
                "assets/lua/test/test_widgetbinding.lua",
                "assets/lua/test/test_showtimepicker.lua",
                "assets/lua/test/test_datepicker.lua",
                "assets/lua/test/test_checkbox.lua",
                "assets/lua/test/test_checkboxlisttile.lua",
                "assets/lua/test/test_radio.lua",
                "assets/lua/test/test_radiolisttile.lua",
                "assets/lua/test/test_switch.lua",
                "assets/lua/test/test_slider.lua",
                "assets/lua/test/test_circleavatar.lua",
                "assets/lua/test/test_rectclipper.lua",
                "assets/lua/test/test_r_rectclipper.lua",
                "assets/lua/test/test_path.lua",
                "assets/lua/test/test_chip.lua",
                "assets/lua/test/test_datatable.lua",
                "assets/lua/test/test_raw_mat_button.lua",
              ]),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                builder: (context, child) {
                  FlutterWidget.init(context, const Size(750, 1334));
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
                  FlutterWidget.init(context, const Size(1334, 750));
                  return Material(
                    child: child,
                  );
                },
                home: const CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
