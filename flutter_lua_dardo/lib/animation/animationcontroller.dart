import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/animationbehavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterAnimationController {
  static void require(LuaState ls) {
    ls.register("AnimationController", _AnimationControllerWrap);
    ls.register("AnimationStatusListenerAdd", _AnimationStatusListenerWrap);
    ls.register("AnimationStatusListenerRemove",
        _AnimationControllerRemoveStatusListenerWrap);
    ls.register("AnimationControllerForward", _AnimationControllerForwardWrap);
    ls.register("AnimationControllerReverse", _AnimationControllerReverseWrap);
    ls.register("AnimationControllerStop", _AnimationControllerStopWrap);
    ls.register("AnimationControllerReset", _AnimationControllerResetWrap);
    ls.register("AnimationControllerResync", _AnimationControllerResyncWrap);
  }

  static int _AnimationControllerForwardWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "controller");
      AnimationController controller;
      if (fieldType == LuaType.luaUserdata) {
        controller = ls.toUserdata(-1).data as AnimationController;
      } else {
        throw ParameterError(
            name: "AnimationControllerForward",
            type: "",
            expected: "AnimationControllerForward controller is null",
            source: "AnimationControllerForward");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "from");
      double from;
      if (fieldType == LuaType.luaNumber) {
        from = ls.toNumberX(-1);
      }
      ls.pop(1);

      controller.forward(from: from);
      ls.setTop(0);
    }
    return 0;
  }

  static int _AnimationControllerRemoveStatusListenerWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "controller");
      AnimationController controller;
      if (fieldType == LuaType.luaUserdata) {
        controller = ls.toUserdata(-1).data as AnimationController;
      } else {
        throw ParameterError(
            name: "AnimationControllerRemoveStatusListener",
            type: "",
            expected:
                "AnimationControllerRemoveStatusListener controller is null",
            source: "AnimationControllerRemoveStatusListener");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "listener");
      var listener;
      if (fieldType == LuaType.luaUserdata) {
        listener = ls.toUserdata(-1).data as AnimationStatusListener;
      } else {
        ls.pop(1);
        throw ParameterError(
            name: "AnimationControllerRemoveStatusListener",
            type: "",
            expected:
                "AnimationControllerRemoveStatusListener listener is null",
            source: "AnimationControllerRemoveStatusListener");
      }
      controller.removeStatusListener(listener);
    }
    return 0;
  }

  static int _AnimationControllerResetWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "controller");
      AnimationController controller;
      if (fieldType == LuaType.luaUserdata) {
        controller = ls.toUserdata(-1).data as AnimationController;
      } else {
        throw ParameterError(
            name: "AnimationControllerReset",
            type: "",
            expected: "AnimationControllerReset controller is null",
            source: "AnimationControllerReset");
      }
      controller.reset();
      ls.setTop(0);
    }
    return 0;
  }

  static int _AnimationControllerResyncWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "controller");
      AnimationController controller;
      if (fieldType == LuaType.luaUserdata) {
        controller = ls.toUserdata(-1).data as AnimationController;
      } else {
        throw ParameterError(
            name: "AnimationControllerResync",
            type: "",
            expected: "AnimationControllerResync controller is null",
            source: "AnimationControllerResync");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "vsync");
      var vsync;
      if (fieldType == LuaType.luaUserdata) {
        vsync = ls.toUserdata(-1).data as TickerProvider;
      } else {
        throw ParameterError(
            name: "AnimationControllerResync",
            type: "",
            expected: "AnimationControllerResync vsync is null",
            source: "AnimationControllerResync");
      }
      ls.pop(1);
      controller.resync(vsync);
      ls.setTop(0);
    }
    return 0;
  }

  static int _AnimationControllerStopWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "controller");
      AnimationController controller;
      if (fieldType == LuaType.luaUserdata) {
        controller = ls.toUserdata(-1).data as AnimationController;
      } else {
        throw ParameterError(
            name: "AnimationControllerStop",
            type: "",
            expected: "AnimationControllerStop controller is null",
            source: "AnimationControllerStop");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "canceled");
      bool canceled = true;
      if (fieldType == LuaType.luaBoolean) {
        canceled = ls.toBoolean(-1);
      }
      ls.pop(1);
      controller.stop(canceled: canceled);
      ls.setTop(0);
    }
    return 0;
  }

  static int _AnimationControllerReverseWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "controller");
      AnimationController controller;
      if (fieldType == LuaType.luaUserdata) {
        controller = ls.toUserdata(-1).data as AnimationController;
      } else {
        throw ParameterError(
            name: "AnimationControllerReverseWrap",
            type: "",
            expected: "AnimationControllerReverseWrap controller is null",
            source: "AnimationControllerReverseWrap");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "from");
      double from;
      if (fieldType == LuaType.luaNumber) {
        from = ls.toNumberX(-1);
      }
      ls.pop(1);
      controller.reverse(from: from);
      ls.setTop(0);
    }
    return 0;
  }

  static int _AnimationStatusListenerWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "controller");
      AnimationController controller;
      if (fieldType == LuaType.luaUserdata) {
        controller = ls.toUserdata(-1).data as AnimationController;
      } else {
        throw ParameterError(
            name: "AnimationStatusListener",
            type: "",
            expected: "AnimationStatusListener controller is null",
            source: "AnimationStatusListener");
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "listener");
      int listenerId = -1;
      if (fieldType == LuaType.luaFunction) {
        listenerId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }
      if (listenerId != -1) {
        var _sListener = (status) {
          ls.rawGetI(lua_registryindex, listenerId);
          ls.pushInteger(status.index);
          ls.pCall(1, 0, 1);
        };
        ls.newUserdata<AnimationStatusListener>().data = _sListener;
        controller.addStatusListener(_sListener);
      } else {
        throw ParameterError(
            name: "AnimationStatusListener",
            type: "",
            expected: "AnimationStatusListener listener is null",
            source: "AnimationStatusListener");
      }
    }
    return 1;
  }

  static int _AnimationControllerWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "value");
      double value;
      if (fieldType == LuaType.luaNumber) {
        value = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "durationMilliseconds");
      Duration duration;
      if (fieldType == LuaType.luaNumber) {
        duration = Duration(milliseconds: ls.toIntegerX(-1));
      }
      ls.pop(1);
      fieldType = ls.getField(-1, "reverseDurationMilliseconds");
      Duration reverseDuration;
      if (fieldType == LuaType.luaNumber) {
        reverseDuration = Duration(milliseconds: ls.toIntegerX(-1));
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "debugLabel");
      String debugLabel;
      if (fieldType == LuaType.luaString) {
        debugLabel = ls.toStr(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "lowerBound");
      double lowerBound = 0.0;
      if (fieldType == LuaType.luaNumber) {
        lowerBound = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "upperBound");
      double upperBound = 1.0;
      if (fieldType == LuaType.luaNumber) {
        upperBound = ls.toNumberX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "animationBehavior");
      AnimationBehavior animationBehavior = AnimationBehavior.normal;
      if (fieldType == LuaType.luaNumber) {
        animationBehavior = FlutterAnimationBehavior.get(ls.toIntegerX(-1));
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "vsync");
      var vsync;
      if (fieldType == LuaType.luaUserdata) {
        vsync = ls.toUserdata(-1).data as TickerProvider;
      } else {
        throw ParameterError(
            expected: "AnimationController vsync is not null",
            type: "",
            name: "",
            source: "FlutterAnimationController");
      }
      ls.pop(1);

      Userdata userdata = ls.newUserdata<AnimationController>();
      var aniCtrl = AnimationController(
          value: value,
          duration: duration,
          reverseDuration: reverseDuration,
          debugLabel: debugLabel,
          lowerBound: lowerBound,
          upperBound: upperBound,
          animationBehavior: animationBehavior,
          vsync: vsync);
      userdata.data = aniCtrl;
    }

    return 1;
  }
}
