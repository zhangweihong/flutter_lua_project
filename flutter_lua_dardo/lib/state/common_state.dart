import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:provider/provider.dart';

class FlutterProvider {
  static const Map<String, DartFunction> _FlutterProviderWrap = {
    "set": _setFlutterProvider,
    "get": _getFlutterProvider,
  };

  static const Map<String, DartFunction> _FlutterProviderMembers = {"id": null};

  static int _setFlutterProvider(LuaState ls) {
    var fieldType = ls.getField(-1, "context");
    var context;
    if (fieldType == LuaType.luaUserdata) {
      context = ls.toUserdata(-1).data as BuildContext;
    } else {
      throw ParameterError(
          name: "FlutterProvider",
          type: "",
          expected: "FlutterProvider context is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "value");
    var value;
    if (fieldType == LuaType.luaTable) {
      value = ls.toPointer(-1);
    } else {
      throw ParameterError(
          name: "FlutterProvider",
          type: "",
          expected: "FlutterProvider value is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "stateKey");
    var stateKey;
    if (fieldType == LuaType.luaString) {
      stateKey = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "FlutterProvider",
          type: "",
          expected: "FlutterProvider stateKey is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "listen");
    bool listen = false;
    if (fieldType == LuaType.luaBoolean) {
      listen = ls.toBoolean(-1);
    } else {
      throw ParameterError(
          name: "FlutterProvider",
          type: "",
          expected: "FlutterProvider listen is null",
          source: "");
    }
    ls.pop(1);
    Provider.of<FlutterCommonState>(context, listen: listen)
        .setValue(stateKey, value);

    return 0;
  }

  static int _getFlutterProvider(LuaState ls) {
    var fieldType = ls.getField(-1, "context");
    var context;
    if (fieldType == LuaType.luaUserdata) {
      context = ls.toUserdata(-1).data as BuildContext;
    } else {
      throw ParameterError(
          name: "FlutterProvider",
          type: "",
          expected: "FlutterProvider context is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "stateKey");
    var stateKey;
    if (fieldType == LuaType.luaString) {
      stateKey = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "FlutterProvider",
          type: "",
          expected: "FlutterProvider stateKey is null",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "listen");
    bool listen = false;
    if (fieldType == LuaType.luaBoolean) {
      listen = ls.toBoolean(-1);
    } else {
      throw ParameterError(
          name: "FlutterProvider",
          type: "",
          expected: "FlutterProvider listen is null",
          source: "");
    }
    ls.pop(1);

    var value = Provider.of<FlutterCommonState>(context, listen: listen)
        .getValue(stateKey);
    if (value == null) {
      ls.pushNil();
    } else {
      ls.pushLuaTable(value);
    }

    return 1;
  }

  static int _openCommonCusumerWidgetLib(LuaState ls) {
    ls.newMetatable("ProviderClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_FlutterProviderMembers, 0);

    ls.newLib(_FlutterProviderWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Provider", _openCommonCusumerWidgetLib, true);
    ls.pop(1);
  }
}

class FlutterCommonCusumerWidget {
  static const Map<String, DartFunction> _CommonCusumerWidgetWrap = {
    "new": _newCusumerWidget
  };

  static const Map<String, DartFunction> _CommonCusumerWidgetMembers = {
    "id": null
  };

  static int _newCusumerWidget(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "stateKey");
    var stateKey;
    if (fieldType == LuaType.luaString) {
      stateKey = ls.toStr(-1);
      ls.pop(1);
    } else {
      throw ParameterError(
          name: "_newCusumerWidget",
          type: "",
          expected: "_newCusumerWidget stateKey is null",
          source: "");
    }

    fieldType = ls.getField(-1, "child");
    var child;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "builder");
    int builderId = -1;
    if (fieldType == LuaType.luaFunction) {
      builderId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
      throw ParameterError(
          name: "_newCusumerWidget",
          type: "",
          expected: "_newCusumerWidget builder is null",
          source: "");
    }
    Userdata userdata = ls.newUserdata();
    userdata.data = Consumer<FlutterCommonState>(
      key: key,
      builder: ((context, value, child) {
        ls.rawGetI(lua_registryindex, builderId);
        ls.newUserdata().data = context;
        var v = value.getValue(stateKey);
        if (v == null) {
          ls.pushNil();
        } else {
          ls.pushLuaTable(v);
        }
        ls.newUserdata().data = child;
        ls.pCall(3, 1, 1);
        if (ls.isUserdata(-1)) {
          var w = ls.toUserdata(-1).data as Widget;
          ls.setTop(0);
          return w;
        } else {
          throw ParameterError(
              name: "Consumer",
              type: "",
              expected: "Consumer builder value null",
              source: "");
        }
      }),
      child: child,
    );
    return 1;
  }

  static int _openCommonCusumerWidgetLib(LuaState ls) {
    ls.newMetatable("CommonCusumerWidgetClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_CommonCusumerWidgetMembers, 0);

    ls.newLib(_CommonCusumerWidgetWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("CommonCusumerWidget", _openCommonCusumerWidgetLib, true);
    ls.pop(1);
  }
}

class FlutterCommonState with ChangeNotifier {
  static Map<String, Object> _valueMaps = new Map<String, Object>();
  static FlutterCommonState _state = new FlutterCommonState();

  static const Map<String, DartFunction> _CommonStateWrap = {
    "new": _newCommonState,
    "notify": _notifyCommonState,
  };

  static const Map<String, DartFunction> _CommonStateMembers = {"id": null};

  static FlutterCommonState state() {
    return _state;
  }

  Object getValue(String key) {
    if (!_valueMaps.containsKey(key)) {
      return null;
    }
    return _valueMaps[key];
  }

  void setValue(String key, Object value) {
    _valueMaps[key] = value;
  }

  static int _newCommonState(LuaState ls) {
    var fieldType = ls.getField(-1, "value");
    var value;
    if (fieldType == LuaType.luaTable) {
      value = ls.toPointer(-1);
    } else {
      throw ParameterError(
          name: "CommonState",
          type: "",
          expected: "CommonState value is null",
          source: "CommonState");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "stateKey");
    var stateKey;
    if (fieldType == LuaType.luaString) {
      stateKey = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "CommonState",
          type: "",
          expected: "CommonState key is null",
          source: "CommonState");
    }
    ls.pop(1);
    _valueMaps[stateKey] = value;
    ls.newUserdata().data = _state;
    return 1;
  }

  static int _notifyCommonState(LuaState ls) {
    var fieldType = ls.getField(-1, "stateKey");
    var stateKey;
    if (fieldType == LuaType.luaString) {
      stateKey = ls.toStr(-1);
    } else {
      throw ParameterError(
          name: "CommonState",
          type: "",
          expected: "CommonState _notifyCommonState key is null",
          source: "CommonState");
    }
    ls.pop(1);

    var value = _state.getValue(stateKey);
    if (value == null) {
      throw ParameterError(
          name: "CommonState",
          type: "",
          expected: "CommonState _notifyCommonState value is null",
          source: "CommonState");
    }
    _state.notifyListeners();
    return 0;
  }

  static int _openCommonStateLib(LuaState ls) {
    ls.newMetatable("CommonStateClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_CommonStateMembers, 0);

    ls.newLib(_CommonStateWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("CommonState", _openCommonStateLib, true);
    ls.pop(1);
  }
}
