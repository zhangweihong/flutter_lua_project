import 'package:flutter/services.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterDeviceOrientation {
  static const List<String> _members = [
    "portraitUp",
    "landscapeLeft",
    "portraitDown",
    "landscapeRight"
  ];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("DeviceOrientation");
  }

  static DeviceOrientation get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return DeviceOrientation.landscapeLeft;
    }
    return DeviceOrientation.values[idx];
  }
}
