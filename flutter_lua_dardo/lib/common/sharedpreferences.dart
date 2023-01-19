import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterSharedPreferences {
  static SharedPreferences _instance;

  static int _openSharedPreferencesLib(LuaState ls) {
    ls.newMetatable("SharedPreferencesClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_SharedPreferencesMembers, 0);
    ls.newLib(_SharedPreferencesWrap);
    return 1;
  }

  static const Map<String, DartFunction> _SharedPreferencesMembers = {
    "id": null
  };

  static const Map<String, DartFunction> _SharedPreferencesWrap = {
    "setString": _setString,
    "setInt": _setInt,
    "setDouble": _setDouble,
    "setBool": _setBool,
    "setStringList": _setStringList,
    "getString": _getString,
    "getInt": _getInt,
    "getDouble": _getDouble,
    "getBool": _getBool,
    "getStringList": _getStringList,
    "remove": _remove,
    "clear": _clear,
    "containsKey": _containsKey,
  };

  static int _setString(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_setString",
          type: "",
          expected: "_setString key is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    String value;
    if (fieldType == LuaType.luaString) {
      value = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_setString",
          type: "",
          expected: "_setString value is null",
          source: "");
    }
    ls.pop(1);

    _instance.setString(key, value);
    return 0;
  }

  static int _setStringList(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_setString",
          type: "",
          expected: "_setString key is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    List<String> value = List.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaString) {
          value.add(ls.toStr(-1));
        }
        ls.pop(1);
      }
    } else {
      throw ParameterError(
          name: "_setString",
          type: "",
          expected: "_setString value is null",
          source: "");
    }
    ls.pop(1);
    _instance.setStringList(key, value);
    return 1;
  }

  static int _setInt(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_setInt",
          type: "",
          expected: "_setInt key is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    int value;
    if (fieldType == LuaType.luaNumber) {
      value = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "_setInt",
          type: "",
          expected: "_setInt value is null",
          source: "");
    }
    ls.pop(1);

    _instance.setInt(key, value);
    return 0;
  }

  static int _setDouble(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_setDouble",
          type: "",
          expected: "_setDouble key is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    double value;
    if (fieldType == LuaType.luaNumber) {
      value = ls.toNumberX(-1);
    } else {
      throw ParameterError(
          name: "_setDouble",
          type: "",
          expected: "_setDouble value is null",
          source: "");
    }
    ls.pop(1);

    _instance.setDouble(key, value);
    return 0;
  }

  static int _setBool(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_setString",
          type: "",
          expected: "_setString key is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    bool value;
    if (fieldType == LuaType.luaNumber) {
      value = ls.toBoolean(-1);
    } else {
      throw ParameterError(
          name: "_setBool",
          type: "",
          expected: "_setBool value is null",
          source: "");
    }
    ls.pop(1);

    _instance.setBool(key, value);
    return 0;
  }

  static int _getString(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_getString",
          type: "",
          expected: "_getString key is null",
          source: "");
    }
    ls.pop(1);

    var value = _instance.getString(key);
    if (value != null) {
      ls.pushString(value);
    } else {
      ls.pushNil();
    }
    return 1;
  }

  static int _getInt(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_getInt",
          type: "",
          expected: "_getInt key is null",
          source: "");
    }
    ls.pop(1);

    var value = _instance.getInt(key);
    if (value != null) {
      ls.pushInteger(value);
    } else {
      ls.pushNil();
    }
    return 1;
  }

  static int _getBool(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_getBool",
          type: "",
          expected: "_getBool key is null",
          source: "");
    }
    ls.pop(1);

    var value = _instance.getBool(key);
    if (value != null) {
      ls.pushBoolean(value);
    } else {
      ls.pushNil();
    }
    return 1;
  }

  static int _getDouble(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_getDouble",
          type: "",
          expected: "_getDouble key is null",
          source: "");
    }
    ls.pop(1);

    var value = _instance.getDouble(key);
    if (value != null) {
      ls.pushNumber(value);
    } else {
      ls.pushNil();
    }
    return 1;
  }

  static int _getStringList(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_getDouble",
          type: "",
          expected: "_getDouble key is null",
          source: "");
    }
    ls.pop(1);

    List<String> value = _instance.getStringList(key);
    if (value != null) {
      LuaTable tb = LuaTable(0, value.length);
      for (var i = 0; i < value.length; i++) {
        tb.put(i + 1, value[i]);
      }
      ls.pushLuaTable(tb);
    } else {
      ls.pushNil();
    }
    return 1;
  }

  static int _remove(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_getDouble",
          type: "",
          expected: "_getDouble key is null",
          source: "");
    }
    ls.pop(1);
    _instance.remove(key);
    return 0;
  }

  static int _containsKey(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    String key;
    if (fieldType == LuaType.luaString) {
      key = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "_containsKey",
          type: "",
          expected: "_containsKey key is null",
          source: "");
    }
    ls.pop(1);

    ls.pushBoolean(_instance.containsKey(key));
    return 1;
  }

  static int _clear(LuaState ls) {
    _instance.clear();
    return 0;
  }

  static void require(LuaState ls) {
    ls.requireF("SharedPreferences", _openSharedPreferencesLib, true);
    ls.pop(1);
    init();
  }

  static init() async {
    if (_instance == null) {
      _instance = await SharedPreferences.getInstance();
    }
    return _instance;
  }
}
