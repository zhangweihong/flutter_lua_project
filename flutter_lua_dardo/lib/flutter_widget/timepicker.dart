import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/flutter_widget/timepicker_entrymode.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterTimePicker {
  static const Map<String, DartFunction> _TimePickerWrap = {
    "show": _newTimePicker,
  };

  static const Map<String, DartFunction> _TimePickerMembers = {"id": null};

  static int _newTimePicker(LuaState ls) {
    var fieldType = ls.getField(-1, "context");
    BuildContext ctx;
    if (fieldType == LuaType.luaUserdata) {
      ctx = ls.toUserdata(-1).data as BuildContext;
    } else {
      throw ParameterError(
          name: "FlutterTimePicker",
          type: "",
          expected: "",
          source: "FlutterTimePicker Context is Null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "hour");
    int hour = 0;
    if (fieldType == LuaType.luaNumber) {
      hour = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "FlutterTimePicker",
          type: "",
          expected: "",
          source: "FlutterTimePicker hour is Null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "minute");
    int minute = 0;
    if (fieldType == LuaType.luaNumber) {
      minute = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "FlutterTimePicker",
          type: "",
          expected: "",
          source: "FlutterTimePicker minute is Null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "callback");
    int callbackId = -1;
    if (fieldType == LuaType.luaFunction) {
      callbackId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "builder");
    int builderId = -1;
    if (fieldType == LuaType.luaFunction) {
      builderId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "useRootNavigator");
    bool useRootNavigator = false;
    if (fieldType == LuaType.luaBoolean) {
      useRootNavigator = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "initialEntryMode");
    TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial;
    if (fieldType == LuaType.luaNumber) {
      initialEntryMode = FlutterTimePickerEntryMode.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "cancelText");
    String cancelText;
    if (fieldType == LuaType.luaString) {
      cancelText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "confirmText");
    String confirmText;
    if (fieldType == LuaType.luaString) {
      confirmText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "helpText");
    String helpText;
    if (fieldType == LuaType.luaString) {
      helpText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "errorInvalidText");
    String errorInvalidText;
    if (fieldType == LuaType.luaString) {
      errorInvalidText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "hourLabelText");
    String hourLabelText;
    if (fieldType == LuaType.luaString) {
      hourLabelText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "minuteLabelText");
    String minuteLabelText;
    if (fieldType == LuaType.luaString) {
      minuteLabelText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "anchorPoint");
    Offset anchorPoint;
    if (fieldType == LuaType.luaUserdata) {
      anchorPoint = ls.toUserdata(-1).data as Offset;
    }
    ls.pop(1);

    showTimePicker(
      context: ctx,
      initialTime: TimeOfDay(hour: hour, minute: minute),
      builder: builderId == -1
          ? null
          : (_context, _w) {
              Widget w;
              ls.rawGetI(lua_registryindex, builderId);
              ls.newUserdata<BuildContext>().data = _context;
              ls.newUserdata<Widget>().data = _w;
              ls.pCall(2, 1, 1);
              if (ls.isUserdata(-1)) {
                w = ls.toUserdata<Widget>(-1).data;
              }
              ls.setTop(0);
              return w;
            },
      useRootNavigator: useRootNavigator,
      initialEntryMode: initialEntryMode,
      cancelText: cancelText,
      confirmText: confirmText,
      helpText: helpText,
      errorInvalidText: errorInvalidText,
      hourLabelText: hourLabelText,
      minuteLabelText: minuteLabelText,
      anchorPoint: anchorPoint,
    ).then((value) {
      if (callbackId != -1 && value != null) {
        ls.rawGetI(lua_registryindex, callbackId);
        ls.pushInteger(value.hour);
        ls.pushInteger(value.minute);
        ls.pCall(2, 0, 1);
      }
    });

    return 0;
  }

  static int _openTimePickerLib(LuaState ls) {
    ls.newMetatable("TimePickerClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_TimePickerMembers, 0);
    ls.newLib(_TimePickerWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("TimePicker", _openTimePickerLib, true);
    ls.pop(1);
  }
}
