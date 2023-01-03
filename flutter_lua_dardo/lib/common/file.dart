import 'package:flutter_lua_dardo/index.dart';
import 'dart:io';

class OpFile {
  static int readFile(LuaState ls) {
    var filedType = ls.getField(-1, "path");
    String path;
    if (filedType == LuaType.luaString) {
      path = ls.toStr(-1);
    }
    ls.pop(1);

    int callbackId = -1;
    filedType = ls.getField(-1, "callback");
    if (filedType == LuaType.luaFunction) {
      callbackId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    if (callbackId != -1) {
      File(path).exists().then((value) {
        if (value) {
          File(path).readAsString().then((value) {
            ls.rawGetI(lua_registryindex, callbackId);
            ls.pushString(value);
            ls.pushBoolean(true);
            ls.pCall(2, 0, 1);
          });
        } else {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushBoolean(false);
          ls.pushNil();
          ls.pCall(2, 0, 1);
        }
      });
    }
    return 0;
  }
}
