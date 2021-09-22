import 'package:flutter_lua_dardo/index.dart';

class FlutterScaffold {
  static const Map<String, DartFunction> _scafflodFun = {"new": _newScaffold};
  static const Map<String, DartFunction> _scafflodMembers = {
    "body": _scaffoldBody
  };

  static int _newScaffold(LuaState ls) {
    if (ls.getTop() > 0) {}

    return 1;
  }

  static int _scaffoldMembers(LuaState ls) {
    return 1;
  }

  static int _scaffoldBody(LuaState ls) {
    return 1;
  }
}
