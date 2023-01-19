import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterEventBus {
  static Map<String, int> _eventIDMap = {};

  static int _addEvent(LuaState ls) {
    if (ls.getTop() > 1) {
      var fieldType = ls.getField(-1, "event");
      int eventId = -1;
      if (fieldType == LuaType.luaFunction) {
        eventId = ls.ref(lua_registryindex);
      } else {
        ls.pop(-1);
        throw ParameterError(
            name: "_addEvent",
            type: "",
            expected: "_addEvent event is null",
            source: "EventBus");
      }
      fieldType = ls.getField(-1, "name");
      String eventName = null;
      if (fieldType == LuaType.luaString) {
        eventName = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: "_addEvent",
            type: "",
            expected: "_addEvent eventName is null",
            source: "EventBus");
      }
      ls.pop(-1);
      _eventIDMap[eventName] = eventId;
    }
    return 0;
  }

  static int _removeEvent(LuaState ls) {
    if (ls.getTop() > 1) {
      var fieldType = ls.getField(-1, "name");
      String eventName = null;
      if (fieldType == LuaType.luaString) {
        eventName = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: "_removeEvent",
            type: "",
            expected: "_removeEvent eventName is null",
            source: "EventBus");
      }
      ls.pop(-1);
      _eventIDMap.remove(eventName);
    }
    return 1;
  }

  static int _callEvent(LuaState ls) {
    if (ls.getTop() > 1) {
      var fieldType = ls.getField(-1, "name");
      String eventName = null;
      if (fieldType == LuaType.luaString) {
        eventName = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: "_addEvent",
            type: "",
            expected: "_addEvent eventName is null",
            source: "EventBus");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "args");
      var args = null;
      if (fieldType == LuaType.luaTable) {
        args = ls.toPointer(-1);
      }
      ls.pop(1);

      var eventId = _eventIDMap[eventName];
      if (eventId != null && eventId != -1) {
        ls.rawGetI(lua_registryindex, eventId);
        if (args != null) {
          ls.pushLuaTable(args);
        } else {
          ls.pushNil();
        }
        ls.pCall(1, 1, 1);
        if (!ls.isNoneOrNil(-1)) {
          ls.pushValue(-1);
          return 1;
        } else {
          return 0;
        }
      } else {
        debugPrint("$eventName is not found");
      }
    }
    return 0;
  }

  static const Map<String, DartFunction> _EventBusWrap = {
    "add": _addEvent,
    "remove": _removeEvent,
    "call": _callEvent,
  };

  static const Map<String, DartFunction> _EventBusMembers = {"id": null};

  static int _openEventBusLib(LuaState ls) {
    ls.newMetatable("EventBusClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_EventBusMembers, 0);
    ls.newLib(_EventBusWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("EventBus", _openEventBusLib, true);
    ls.pop(1);
  }
}
