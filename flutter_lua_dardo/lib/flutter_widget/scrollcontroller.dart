import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterScrollController {
  static void require(LuaState ls) {
    ls.register("ScrollController", _ScrollControllerWrap);
  }

  static int _ScrollControllerWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldTye = ls.getField(-1, "initialScrollOffset");
      var initialScrollOffset;
      if (fieldTye == LuaType.luaNumber) {
        initialScrollOffset = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldTye = ls.getField(-1, "keepScrollOffset");
      var keepScrollOffset = true;
      if (fieldTye == LuaType.luaNumber) {
        keepScrollOffset = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldTye = ls.getField(-1, "debugLabel");
      var debugLabel;
      if (fieldTye == LuaType.luaString) {
        debugLabel = ls.toStr(-1);
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<ScrollController>();
      userdata.data = ScrollController(
          initialScrollOffset: initialScrollOffset,
          debugLabel: debugLabel,
          keepScrollOffset: keepScrollOffset);
    }
    return 1;
  }
}
