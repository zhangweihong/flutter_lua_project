import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:encrypt/encrypt.dart' as Encrypt;
import 'dart:convert' as convert;
import 'package:crypto/crypto.dart';
import 'package:flutter_lua_dardo/flutter_widget/deviceorientation.dart';

import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/flutter_widget/systemuimode.dart';
import 'package:flutter_lua_dardo/flutter_widget/systemuioverlay.dart';

class FlutterHelper {
  static const Map<String, DartFunction> _HelperWrap = {
    "md5": _md5,
    "aesEncode": _aesEncode,
    "aesDecode": _aesDecode,
    "setOrientations": _setPreferredOrientations,
    "setEnabledSystemUIMode": _setEnabledSystemUIMode,
    "showDlg": _showDlg
  };

  static const Map<String, DartFunction> _HelperMembers = {"id": null};

  static int _setEnabledSystemUIMode(LuaState ls) {
    if (ls.getTop() > 0) {
      SystemUiMode mode = SystemUiMode.manual;
      if (ls.isInteger(-2)) {
        mode = FlutterSystemUiMode.get(ls.toIntegerX(-2));
      } else {
        throw ParameterError(
            name: 'SystemChrome.setEnabledSystemUIMode',
            type: "",
            expected: "",
            source: "setEnabledSystemUIMode value null");
      }
      var fieldType = ls.getField(-1, "overlays");
      List<SystemUiOverlay> overlays;
      if (fieldType == LuaType.luaTable) {
        overlays = List.empty(growable: true);
        var len = ls.len2(-1);
        for (int i = 1; i <= len; i++) {
          if (ls.rawGetI(-1, i) == LuaType.luaNumber) {
            overlays.add(FlutterSystemUiOverlay.get(ls.toIntegerX(-1)));
          }
          ls.pop(1);
        }
      } else {
        throw ParameterError(
            name: 'SystemChrome.setEnabledSystemUIMode overlays',
            type: "",
            expected: "",
            source: "setEnabledSystemUIMode overlays value null");
      }
      ls.setTop(0);
      SystemChrome.setEnabledSystemUIMode(mode, overlays: overlays);
    }
    return 0;
  }

  static int _setPreferredOrientations(LuaState ls) {
    List<DeviceOrientation> oLs = List.empty(growable: true);
    if (ls.getTop() > 0) {
      if (ls.isTable(-1)) {
        var len = ls.len2(-1);
        for (int i = 1; i <= len; i++) {
          if (ls.rawGetI(-1, i) == LuaType.luaNumber) {
            oLs.add(FlutterDeviceOrientation.get(ls.toIntegerX(-1)));
          }
          ls.pop(1);
        }
        ls.pop(1);
      }

      SystemChrome.setPreferredOrientations(oLs);
    } else {
      throw ParameterError(
          name: 'SystemChrome.setPreferredOrientations',
          type: "",
          expected: "",
          source: "setPreferredOrientations value null");
    }
    ls.setTop(0);
    return 0;
  }

  static int _md5(LuaState ls) {
    if (ls.getTop() > 0) {
      String md5Str;
      if (ls.isString(-1)) {
        String originStr = ls.toStr(-1);
        md5Str = md5.convert(convert.utf8.encode(originStr)).toString();
        ls.pop(1);
      } else {
        throw ParameterError(
            name: 'md5', type: "", expected: "", source: "md5 value null");
      }
      ls.pushString(md5Str);
    } else {
      throw ParameterError(
          name: 'md5', type: "", expected: "", source: "md5 value null");
    }
    return 1;
  }

  static int _aesEncode(LuaState ls) {
    if (ls.getTop() > 0) {
      String key;
      var fieldType = ls.getField(-1, "key");
      if (fieldType == LuaType.luaString) {
        key = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: '_aesEncode',
            type: "",
            expected: "",
            source: "_aesEncode key empty");
      }
      ls.pop(1);

      String iv;
      fieldType = ls.getField(-1, "iv");
      if (fieldType == LuaType.luaString) {
        iv = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: '_aesEncode',
            type: "",
            expected: "",
            source: "_aesEncode iv empty");
      }
      ls.pop(1);

      String content;
      fieldType = ls.getField(-1, "content");
      if (fieldType == LuaType.luaString) {
        content = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: '_aesEncode',
            type: "",
            expected: "",
            source: "_aesEncode content empty");
      }
      ls.pop(1);

      final _key = Encrypt.Key.fromUtf8(key);
      final encrypter = Encrypt.Encrypter(
          Encrypt.AES(_key, mode: Encrypt.AESMode.cbc, padding: "PKCS7"));

      String en =
          encrypter.encrypt(content, iv: Encrypt.IV.fromUtf8(iv)).base64;
      ls.pushString(en);
    } else {
      throw ParameterError(
          name: '_aesEncode',
          type: "",
          expected: "",
          source: "_aesEncode value empty");
    }

    return 1;
  }

  static int _aesDecode(LuaState ls) {
    if (ls.getTop() > 0) {
      String key;
      var fieldType = ls.getField(-1, "key");
      if (fieldType == LuaType.luaString) {
        key = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: '_aesEncode',
            type: "",
            expected: "",
            source: "_aesEncode key empty");
      }
      ls.pop(1);

      String iv;
      fieldType = ls.getField(-1, "iv");
      if (fieldType == LuaType.luaString) {
        iv = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: '_aesEncode',
            type: "",
            expected: "",
            source: "_aesEncode iv empty");
      }
      ls.pop(1);

      String content;
      fieldType = ls.getField(-1, "content");
      if (fieldType == LuaType.luaString) {
        content = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: '_aesEncode',
            type: "",
            expected: "",
            source: "_aesEncode content empty");
      }
      ls.pop(1);
      final _key = Encrypt.Key.fromUtf8(key);
      final encrypter = Encrypt.Encrypter(
          Encrypt.AES(_key, mode: Encrypt.AESMode.cbc, padding: "PKCS7"));

      String de = encrypter.decrypt64(content, iv: Encrypt.IV.fromUtf8(iv));
      ls.pushString(de);
    } else {
      throw ParameterError(
          name: '_aseDecode',
          type: "",
          expected: "",
          source: "_aseDecode value empty");
    }

    return 1;
  }

  static int _showDlg(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    } else {
      throw ParameterError(
          name: 'showDlg',
          type: "",
          expected: "",
          source: "showDlg child empty");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "context");
    BuildContext context;
    if (fieldType == LuaType.luaUserdata) {
      context = ls.toUserdata(-1).data as BuildContext;
    } else {
      throw ParameterError(
          name: 'showDlg',
          type: "",
          expected: "",
          source: "showDlg context empty");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "barrierDismissible");
    bool barrierDismissible = true;
    if (fieldType == LuaType.luaBoolean) {
      barrierDismissible = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "useSafeArea");
    bool useSafeArea = true;
    if (fieldType == LuaType.luaBoolean) {
      useSafeArea = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "useRootNavigator");
    bool useRootNavigator = true;
    if (fieldType == LuaType.luaBoolean) {
      useRootNavigator = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "barrierLabel");
    String barrierLabel;
    if (fieldType == LuaType.luaString) {
      barrierLabel = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "barrierColor");
    Color barrierColor = Colors.black54;
    if (fieldType == LuaType.luaUserdata) {
      barrierColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);
    fieldType = ls.getField(-1, "anchorPoint");
    var anchorPoint;
    if (fieldType == LuaType.luaUserdata) {
      anchorPoint = ls.toUserdata(-1).data as Offset;
    }
    ls.pop(1);

    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        barrierColor: barrierColor,
        useSafeArea: useSafeArea,
        useRootNavigator: useRootNavigator,
        anchorPoint: anchorPoint,
        builder: (ctx) {
          return child;
        });
    return 0;
  }

  static void _setField(LuaState ls) {
    String mode = "dev";
    if (kReleaseMode) {
      mode = "release";
    } else {
      mode = "dev";
    }
    ls.pushString(mode);
    ls.setField(-2, "appMode");

    String plt = "win";
    if (Platform.isWindows) {
      plt = "win";
    } else if (Platform.isMacOS) {
      plt = "mac";
    } else if (Platform.isIOS) {
      plt = "ios";
    } else if (Platform.isAndroid) {
      plt = "android";
    } else if (Platform.isFuchsia) {
      plt = "fuchsia";
    } else if (Platform.isLinux) {
      plt = "linux";
    } else {
      plt = "win";
    }
    ls.pushString(plt);
    ls.setField(-2, "appPltform");
  }

  static int _openHelperLib(LuaState ls) {
    ls.newMetatable("HelperClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_HelperMembers, 0);
    ls.newLib(_HelperWrap);
    _setField(ls);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Helper", _openHelperLib, true);
    ls.pop(1);
  }
}
