import 'package:dio/dio.dart';
import 'package:lua_dardo/lua.dart';

class FlutterResponseType {
  static const List<String> _members = ["json", "stream", "plain", "bytes"];

  static void require(LuaState ls) {
    ls.newTable();

    for (var i = 0; i < _members.length; i++) {
      ls.pushInteger(i);
      ls.setField(-2, _members[i]);
    }

    ls.setGlobal("ResponseType");
  }

  static ResponseType get(int idx) {
    if (idx == null || idx < 0 || idx >= _members.length) {
      return ResponseType.json;
    }
    return ResponseType.values[idx];
  }
}
