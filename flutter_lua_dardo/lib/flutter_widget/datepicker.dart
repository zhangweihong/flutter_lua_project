import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/datepicker_entrymode.dart';
import 'package:flutter_lua_dardo/flutter_widget/datepicker_mode.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:lua_dardo/lua.dart';

class FlutterDatePicker {
  static const Map<String, DartFunction> _DatePickerWrap = {
    "show": _newDatePicker,
  };

  static const Map<String, DartFunction> _DatePickerMembers = {"id": null};

  static int _newDatePicker(LuaState ls) {
    var fieldType = ls.getField(-1, "context");
    BuildContext ctx;
    if (fieldType == LuaType.luaUserdata) {
      ctx = ls.toUserdata(-1).data as BuildContext;
    } else {
      throw ParameterError(
          name: "FlutterDatePicker",
          type: "",
          expected: "",
          source: "FlutterDatePicker Context is Null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "initialDate");
    int initialDate;
    if (fieldType == LuaType.luaNumber) {
      initialDate = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "FlutterDatePicker",
          type: "",
          expected: "",
          source: "FlutterDatePicker initialDate is Null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "firstDate");
    int firstDate;
    if (fieldType == LuaType.luaNumber) {
      firstDate = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "FlutterDatePicker",
          type: "",
          expected: "",
          source: "FlutterDatePicker firstDate is Null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "lastDate");
    int lastDate;
    if (fieldType == LuaType.luaNumber) {
      lastDate = ls.toIntegerX(-1);
    } else {
      throw ParameterError(
          name: "FlutterDatePicker",
          type: "",
          expected: "",
          source: "FlutterDatePicker lastDate is Null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "currentDate");
    int currentDate;
    if (fieldType == LuaType.luaNumber) {
      currentDate = ls.toIntegerX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "initialEntryMode");
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar;
    if (fieldType == LuaType.luaNumber) {
      initialEntryMode = FlutterDatePickerEntryMode.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "selectableDayPredicate");
    var selectableDayPredicateId = -1;
    if (fieldType == LuaType.luaFunction) {
      selectableDayPredicateId = ls.ref(-1);
    } else {
      ls.pop(1);
    }

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

    fieldType = ls.getField(-1, "useRootNavigator");
    bool useRootNavigator = true;
    if (fieldType == LuaType.luaBoolean) {
      useRootNavigator = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "builder");
    int builderId = -1;
    if (fieldType == LuaType.luaFunction) {
      builderId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "textDirection");
    var textDirection;
    if (fieldType == LuaType.luaUserdata) {
      textDirection = ls.toUserdata(-1).data as TextDirection;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "initialDatePickerMode");
    DatePickerMode initialDatePickerMode = DatePickerMode.day;
    if (fieldType == LuaType.luaNumber) {
      initialDatePickerMode = FlutterDatePickerMode.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "errorFormatText");
    String errorFormatText;
    if (fieldType == LuaType.luaString) {
      errorFormatText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "errorInvalidText");
    String errorInvalidText;
    if (fieldType == LuaType.luaString) {
      errorInvalidText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "fieldHintText");
    String fieldHintText;
    if (fieldType == LuaType.luaString) {
      fieldHintText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "fieldLabelText");
    String fieldLabelText;
    if (fieldType == LuaType.luaString) {
      fieldLabelText = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "anchorPoint");
    Offset anchorPoint;
    if (fieldType == LuaType.luaUserdata) {
      anchorPoint = ls.toUserdata(-1).data as Offset;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "callback");
    int callbackId = -1;
    if (fieldType == LuaType.luaFunction) {
      callbackId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    showDatePicker(
      context: ctx,
      initialDate: DateTime.fromMillisecondsSinceEpoch(initialDate),
      firstDate: DateTime.fromMillisecondsSinceEpoch(firstDate),
      lastDate: DateTime.fromMillisecondsSinceEpoch(lastDate),
      currentDate: currentDate != null
          ? DateTime.fromMillisecondsSinceEpoch(currentDate)
          : null,
      initialEntryMode: initialEntryMode,
      selectableDayPredicate: selectableDayPredicateId == -1
          ? null
          : (DateTime day) {
              ls.rawGetI(lua_registryindex, selectableDayPredicateId);
              ls.pushInteger(day.millisecondsSinceEpoch);
              ls.pCall(1, 1, 1);
              if (ls.isBoolean(-1)) {
                bool b = ls.toBoolean(-1);
                return b;
              }
              ls.setTop(0);
              return false;
            },
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      useRootNavigator: useRootNavigator,
      textDirection: textDirection,
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
      initialDatePickerMode: initialDatePickerMode,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
      anchorPoint: anchorPoint,
    ).then((value) {
      if (callbackId != -1 && value != null) {
        ls.rawGetI(lua_registryindex, callbackId);
        ls.pushInteger(value.millisecondsSinceEpoch);
        ls.pCall(1, 0, 1);
      }
    });
    return 0;
  }

  static int _openDatePickerLib(LuaState ls) {
    ls.newMetatable("DatePickerClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_DatePickerMembers, 0);
    ls.newLib(_DatePickerWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("DatePicker", _openDatePickerLib, true);
    ls.pop(1);
  }
}
