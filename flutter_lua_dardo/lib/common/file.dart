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

    File(path).exists().then((value) async {
      if (value) {
        var content = await File(path).readAsString();
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushString(content);
          ls.pushBoolean(true);
          ls.pCall(2, 0, 1);
        }
      } else {
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushNil();
          ls.pushBoolean(false);
          ls.pCall(2, 0, 1);
        }
      }
    });
    return 0;
  }

  static int saveFile(LuaState ls) {
    var filedType = ls.getField(-1, "path");
    String path;
    if (filedType == LuaType.luaString) {
      path = ls.toStr(-1);
    }
    ls.pop(1);

    filedType = ls.getField(-1, "content");
    String content;
    if (filedType == LuaType.luaString) {
      content = ls.toStr(-1);
    }
    ls.pop(1);

    int callbackId = -1;
    filedType = ls.getField(-1, "callback");
    if (filedType == LuaType.luaFunction) {
      callbackId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }
    File(path).exists().then((value) async {
      if (value) {
        await File(path).delete(recursive: true);
      }
      if (content != null && content.isNotEmpty) {
        await File(path).writeAsString(content);
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushString("save success");
          ls.pushBoolean(true);
          ls.pCall(2, 0, 1);
        }
      } else {
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushString("save fail , content is empty");
          ls.pushBoolean(false);
          ls.pCall(2, 0, 1);
        }
      }
    });

    return 0;
  }
}
