import 'package:flutter/services.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterSystemUiOverlay {
  static const List<String> _members = ["top", "bottom"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("SystemUiOverlay");
  }

  static SystemUiOverlay get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return SystemUiOverlay.top;
    }
    return SystemUiOverlay.values[idx];
  }
}
