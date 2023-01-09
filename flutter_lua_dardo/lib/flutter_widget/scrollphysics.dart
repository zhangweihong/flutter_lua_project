import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterScrollPhysics {
  static void require(LuaState state) {
    state.register("BouncingScrollPhysics", (ls) {
      var fieldTye = ls.getField(-1, "parent");
      var parent;
      if (fieldTye == LuaType.luaUserdata) {
        parent = ls.toUserdata(-1).data as ScrollPhysics;
      }
      ls.pop(1);
      Userdata userdata = ls.newUserdata<ScrollPhysics>();
      userdata.data = BouncingScrollPhysics(parent: parent);
      return 1;
    });

    state.register("ClampingScrollPhysics", (ls) {
      var parent;
      if (ls.getTop() > 0) {
        var fieldTye = ls.getField(-1, "parent");
        if (fieldTye == LuaType.luaUserdata) {
          parent = ls.toUserdata(-1).data as ScrollPhysics;
        }
        ls.pop(1);
      }
      Userdata userdata = ls.newUserdata<ScrollPhysics>();
      userdata.data = ClampingScrollPhysics(parent: parent);
      return 1;
    });

    state.register("NeverScrollableScrollPhysics", (LuaState ls) {
      var parent;
      if (ls.getTop() > 0) {
        var fieldTye = ls.getField(-1, "parent");
        if (fieldTye == LuaType.luaUserdata) {
          parent = ls.toUserdata(-1).data as ScrollPhysics;
        }
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<ScrollPhysics>();
      userdata.data = NeverScrollableScrollPhysics(parent: parent);
      return 1;
    });

    state.register("AlwaysScrollableScrollPhysics", (LuaState ls) {
      var parent;
      if (ls.getTop() > 0) {
        var fieldTye = ls.getField(-1, "parent");
        if (fieldTye == LuaType.luaUserdata) {
          parent = ls.toUserdata(-1).data as ScrollPhysics;
        }
        ls.pop(1);
      }
      Userdata userdata = ls.newUserdata<ScrollPhysics>();
      userdata.data = AlwaysScrollableScrollPhysics(parent: parent);
      return 1;
    });

    state.register("RangeMaintainingScrollPhysics", (ls) {
      var parent;
      if (ls.getTop() > 0) {
        var fieldTye = ls.getField(-1, "parent");
        if (fieldTye == LuaType.luaUserdata) {
          parent = ls.toUserdata(-1).data as ScrollPhysics;
        }
        ls.pop(1);
      }
      Userdata userdata = ls.newUserdata<ScrollPhysics>();
      userdata.data = RangeMaintainingScrollPhysics(parent: parent);
      return 1;
    });
  }
}
