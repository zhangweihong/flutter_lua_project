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

    bool async = true;
    filedType = ls.getField(-1, "async");
    if (filedType == LuaType.luaBoolean) {
      async = ls.toBoolean(-1);
    }
    ls.pop(1);

    File file = File(path);
    if (async) {
      file.exists().then((value) async {
        if (value) {
          var content = await file.readAsString();
          if (callbackId != -1) {
            ls.rawGetI(lua_registryindex, callbackId);
            ls.pushBoolean(true);
            ls.pushString(content);
            ls.pCall(2, 0, 1);
          }
        } else {
          if (callbackId != -1) {
            ls.rawGetI(lua_registryindex, callbackId);
            ls.pushBoolean(false);
            ls.pushNil();
            ls.pCall(2, 0, 1);
          }
        }
      });
    } else {
      if (file.existsSync()) {
        var content = file.readAsStringSync();
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushBoolean(true);
          ls.pushString(content);
          ls.pCall(2, 0, 1);
        }
      } else {
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushBoolean(false);
          ls.pushNil();
          ls.pCall(2, 0, 1);
        }
      }
    }
    ls.setTop(0);
    return 0;
  }

  static int deleteFile(LuaState ls) {
    var filedType = ls.getField(-1, "path");
    String path;
    if (filedType == LuaType.luaString) {
      path = ls.toStr(-1);
    }
    ls.pop(1);

    filedType = ls.getField(-1, "recursive");
    bool recursive = false;
    if (filedType == LuaType.luaString) {
      recursive = ls.toBoolean(-1);
    }
    ls.pop(1);

    int callbackId = -1;
    filedType = ls.getField(-1, "callback");
    if (filedType == LuaType.luaFunction) {
      callbackId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    bool async = true;
    filedType = ls.getField(-1, "async");
    if (filedType == LuaType.luaBoolean) {
      async = ls.toBoolean(-1);
    }
    ls.pop(1);

    File file = File(path);
    if (async) {
      file.exists().then((value) async {
        if (value) {
          await file.delete(recursive: recursive);
        }
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pCall(0, 0, 1);
        }
      });
    } else {
      if (file.existsSync()) {
        file.deleteSync(recursive: recursive);
      }
      if (callbackId != -1) {
        ls.rawGetI(lua_registryindex, callbackId);
        ls.pCall(0, 0, 1);
      }
    }
    ls.setTop(0);
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

    bool async = true;
    filedType = ls.getField(-1, "async");
    if (filedType == LuaType.luaBoolean) {
      async = ls.toBoolean(-1);
    }
    ls.pop(1);

    File file = File(path);
    if (async) {
      file.exists().then((value) async {
        if (value) {
          await file.delete(recursive: true);
        }
        if (content != null && content.isNotEmpty) {
          await File(path).writeAsString(content);
          if (callbackId != -1) {
            ls.rawGetI(lua_registryindex, callbackId);
            ls.pushBoolean(true);
            ls.pushString("save success");
            ls.pCall(2, 0, 1);
          }
        } else {
          if (callbackId != -1) {
            ls.rawGetI(lua_registryindex, callbackId);
            ls.pushBoolean(false);
            ls.pushString("save fail , content is empty");
            ls.pCall(2, 0, 1);
          }
        }
      });
    } else {
      if (file.existsSync()) {
        file.deleteSync(recursive: true);
      }
      if (content != null && content.isNotEmpty) {
        File(path).writeAsStringSync(content);
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushBoolean(true);
          ls.pushString("save success");
          ls.pCall(2, 0, 1);
        }
      } else {
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushBoolean(false);
          ls.pushString("save fail , content is empty");
          ls.pCall(2, 0, 1);
        }
      }
    }

    return 0;
  }

  static int existsFile(LuaState ls) {
    var filedType = ls.getField(-1, "path");
    String path;
    if (filedType == LuaType.luaString) {
      path = ls.toStr(-1);
    }
    ls.pop(1);

    bool async = true;
    filedType = ls.getField(-1, "async");
    if (filedType == LuaType.luaBoolean) {
      async = ls.toBoolean(-1);
    }
    ls.pop(1);

    int callbackId = -1;
    filedType = ls.getField(-1, "callback");
    if (filedType == LuaType.luaFunction) {
      callbackId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    File file = File(path);
    if (async) {
      file.exists().then((value) async {
        if (callbackId != -1) {
          ls.rawGetI(lua_registryindex, callbackId);
          ls.pushBoolean(true);
          ls.pCall(1, 0, 1);
        }
      });
    } else {
      if (callbackId != -1) {
        ls.rawGetI(lua_registryindex, callbackId);
        ls.pushBoolean(file.existsSync());
        ls.pCall(1, 0, 1);
      }
    }
    ls.setTop(0);
  }
}
