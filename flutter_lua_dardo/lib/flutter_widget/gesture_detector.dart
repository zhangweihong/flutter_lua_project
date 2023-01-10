import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:lua_dardo/lua.dart';

class FlutterGestureDetector {
  static const Map<String, DartFunction> _gestureDetectorFunc = {
    "new": _newGestureDetector,
  };

  static const Map<String, DartFunction> _gestureMembers = {"id": null};

  static int _newGestureDetector(LuaState ls) {
    int onTapId = -1;
    int onDTapId = -1;
    int onTapDownId = -1;
    int onTapCancelId = -1;
    int onTapUpId = -1;
    if (ls.getTop() > 0) {
      Widget child;
      var fieldType = ls.getField(-1, "child");
      if (fieldType == LuaType.luaUserdata) {
        child = ls.toUserdata(-1).data as Widget;
        ls.pop(1);
      } else if (fieldType == LuaType.luaNil) {
        ls.pop(1);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'child',
            type: ls.typeName(fieldType),
            expected: "Widget",
            source: "FlutterGestureDetector _newGestureDetector");
      }

      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onTap");
      if (fieldType == LuaType.luaFunction) {
        onTapId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onDoubleTap");
      if (fieldType == LuaType.luaFunction) {
        onDTapId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onTapDown");
      if (fieldType == LuaType.luaFunction) {
        onTapDownId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onTapUp");
      if (fieldType == LuaType.luaFunction) {
        onTapUpId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onTapCancel");
      if (fieldType == LuaType.luaFunction) {
        onTapCancelId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      int onLongPressId = -1;
      int onLongPressStartId = -1;
      int onLongPressMoveUpdateId = -1;
      int onLongPressUpId = -1;
      int onLongPressEndId = -1;
      int onLongPressDownId = -1;
      int onLongPressCancelId = -1;

      fieldType = ls.getField(-1, "onLongPress");
      if (fieldType == LuaType.luaFunction) {
        onLongPressId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onLongPressStart");
      if (fieldType == LuaType.luaFunction) {
        onLongPressStartId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onLongPressMoveUpdate");
      if (fieldType == LuaType.luaFunction) {
        onLongPressMoveUpdateId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onLongPressUp");
      if (fieldType == LuaType.luaFunction) {
        onLongPressUpId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onLongPressEnd");
      if (fieldType == LuaType.luaFunction) {
        onLongPressEndId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }
      fieldType = ls.getField(-1, "onLongPressDown");
      if (fieldType == LuaType.luaFunction) {
        onLongPressDownId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }
      fieldType = ls.getField(-1, "onLongPressCancel");
      if (fieldType == LuaType.luaFunction) {
        onLongPressCancelId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      int onPanDownId = -1;
      int onPanStartId = -1;
      int onPanUpdateId = -1;
      int onPanEndId = -1;
      int onPanCancelId = -1;

      fieldType = ls.getField(-1, "onPanDown");
      if (fieldType == LuaType.luaFunction) {
        onPanDownId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onPanStart");
      if (fieldType == LuaType.luaFunction) {
        onPanStartId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onPanEnd");
      if (fieldType == LuaType.luaFunction) {
        onPanEndId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onPanCancel");
      if (fieldType == LuaType.luaFunction) {
        onPanCancelId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onPanDown");
      if (fieldType == LuaType.luaFunction) {
        onPanDownId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onPanDown");
      if (fieldType == LuaType.luaFunction) {
        onPanDownId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      Userdata u = ls.newUserdata<GestureDetector>();
      u.data = GestureDetector(
        key: key,
        child: child,
        onDoubleTap: onDTapId != -1
            ? () {
                if (onDTapId != -1) {
                  ls.rawGetI(lua_registryindex, onDTapId);
                  ls.pCall(0, 0, 1);
                }
              }
            : null,
        onTap: onTapId != -1
            ? () {
                if (onTapId != -1) {
                  ls.rawGetI(lua_registryindex, onTapId);
                  ls.pCall(0, 0, 1);
                }
              }
            : null,
        onTapCancel: onTapCancelId != -1
            ? () {
                if (onTapCancelId != -1) {
                  ls.rawGetI(lua_registryindex, onTapCancelId);
                  ls.pCall(0, 0, 1);
                }
              }
            : null,
        onTapDown: onTapDownId != -1
            ? (detail) {
                if (onTapDownId != -1) {
                  ls.rawGetI(lua_registryindex, onTapDownId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              }
            : null,
        onTapUp: onTapUpId != -1
            ? (detail) {
                if (onTapUpId != -1) {
                  ls.rawGetI(lua_registryindex, onTapUpId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              }
            : null,
        onLongPress: onLongPressId != -1
            ? () {
                if (onLongPressId != -1) {
                  ls.rawGetI(lua_registryindex, onLongPressId);
                  ls.pCall(0, 0, 1);
                }
              }
            : null,
        onLongPressStart: onLongPressStartId != -1
            ? (detail) {
                if (onLongPressStartId != -1) {
                  ls.rawGetI(lua_registryindex, onLongPressStartId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              }
            : null,
        onLongPressCancel: onLongPressCancelId != -1
            ? () {
                if (onLongPressCancelId != -1) {
                  ls.rawGetI(lua_registryindex, onLongPressCancelId);
                  ls.pCall(0, 0, 1);
                }
              }
            : null,
        onLongPressDown: onLongPressDownId != -1
            ? (detail) {
                if (onLongPressDownId != -1) {
                  ls.rawGetI(lua_registryindex, onLongPressDownId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              }
            : null,
        onLongPressMoveUpdate: onLongPressMoveUpdateId != -1
            ? (detail) {
                if (onLongPressMoveUpdateId != -1) {
                  ls.rawGetI(lua_registryindex, onLongPressMoveUpdateId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              }
            : null,
        onLongPressUp: onLongPressUpId != -1
            ? () {
                if (onLongPressUpId != -1) {
                  ls.rawGetI(lua_registryindex, onLongPressUpId);
                  ls.pCall(0, 0, 1);
                }
              }
            : null,
        onLongPressEnd: onLongPressEndId != -1
            ? (detail) {
                if (onLongPressEndId != -1) {
                  ls.rawGetI(lua_registryindex, onLongPressEndId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              }
            : null,
        onPanDown: onPanDownId != -1
            ? (detail) {
                if (onPanDownId != -1) {
                  ls.rawGetI(lua_registryindex, onPanDownId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              }
            : null,
        onPanStart: onPanStartId != -1
            ? (detail) {
                if (onPanStartId != -1) {
                  ls.rawGetI(lua_registryindex, onPanStartId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              }
            : null,
        onPanUpdate: onPanUpdateId != -1
            ? (detail) {
                if (onPanUpdateId != -1) {
                  ls.rawGetI(lua_registryindex, onPanUpdateId);
                  LuaTable tb1 = LuaTable(0, 2);
                  tb1.put("dx", detail.globalPosition.dx);
                  tb1.put("dy", detail.globalPosition.dy);
                  LuaTable tb2 = LuaTable(0, 2);
                  tb2.put("dx", detail.localPosition.dx);
                  tb2.put("dy", detail.localPosition.dy);
                  ls.createValuesTable(
                      {'globalPosition': tb1, 'localPosition': tb2});
                  ls.pCall(1, 0, 1);
                }
              }
            : null,
        onPanEnd: onPanEndId != -1
            ? (detail) {
                if (onPanEndId != -1) {
                  ls.rawGetI(lua_registryindex, onPanEndId);
                  ls.pCall(0, 0, 1);
                }
              }
            : null,
        onPanCancel: onPanCancelId != -1
            ? () {
                if (onPanCancelId != -1) {
                  ls.rawGetI(lua_registryindex, onPanCancelId);
                  ls.pCall(0, 0, 1);
                }
              }
            : null,
      );
      ls.getMetatableAux('GestureDetectorClass');
      ls.setMetatable(-2);
    }
    return 1;
  }

  static int _openTextLib(LuaState ls) {
    ls.newMetatable("GestureDetectorClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_gestureMembers, 0);

    ls.newLib(_gestureDetectorFunc);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("GestureDetector", _openTextLib, true);
    ls.pop(1);
  }
}
