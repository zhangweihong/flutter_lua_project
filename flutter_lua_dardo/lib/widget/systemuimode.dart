import 'package:flutter/services.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterSystemUiMode {
  static const List<String> _members = [
    "leanBack",
    "immersive",
    "immersiveSticky",
    "edgeToEdge",
    "manual"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("SystemUiMode");
  }

  static SystemUiMode get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return SystemUiMode.manual;
    }
    return SystemUiMode.values[idx];
  }
}
