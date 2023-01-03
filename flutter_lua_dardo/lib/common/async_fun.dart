import 'package:flutter_lua_dardo/index.dart';

class AsyncFun {
  static int asyncFun(LuaState ls) {
    try {
      var fieldType = ls.getField(-1, "task");
      var funId;
      var funCallBackId;
      if (fieldType == LuaType.luaFunction) {
        funId = ls.ref(lua_registryindex);
      }
      fieldType = ls.getField(-1, "callback");
      if (fieldType == LuaType.luaFunction) {
        funCallBackId = ls.ref(lua_registryindex);
      }
      Future.microtask(() {
        if (funId != -1) {
          ls.rawGetI(lua_registryindex, funId);
          ls.pCall(0, 0, 1);
        }
      }).then(((value) {
        if (funCallBackId != -1) {
          ls.rawGetI(lua_registryindex, funCallBackId);
          ls.pCall(0, 0, 1);
        }
      }));
    } catch (e) {
      throw e;
    }
    return 0;
  }

  static int delayFun(LuaState ls) {
    try {
      var fieldType = ls.getField(-1, "task");
      var funId = -1;
      var funCallBackId = -1;
      int time = 0;
      if (fieldType == LuaType.luaFunction) {
        funId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }
      fieldType = ls.getField(-1, "callback");
      if (fieldType == LuaType.luaFunction) {
        funCallBackId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }
      fieldType = ls.getField(-1, "time");
      if (fieldType == LuaType.luaNumber) {
        time = ls.toIntegerX(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      Future.delayed(Duration(milliseconds: time), () {
        if (funId != -1) {
          ls.rawGetI(lua_registryindex, funId);
          ls.pCall(0, 0, 1);
        }
      }).then(((value) {
        if (funCallBackId != -1) {
          ls.rawGetI(lua_registryindex, funCallBackId);
          ls.pCall(0, 0, 1);
        }
      }));
    } catch (e) {
      throw e;
    }
    return 0;
  }
}
