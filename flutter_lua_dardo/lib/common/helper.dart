import 'package:flutter_lua_dardo/index.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:convert' as convert;
import 'package:crypto/crypto.dart';

import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class FlutterHelper {
  static const Map<String, DartFunction> _HelperWrap = {
    "md5": _md5,
    "aesEncode": _aesEncode,
    "aesDecode": _aesDecode
  };

  static const Map<String, DartFunction> _HelperMembers = {"id": null};

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

      final _key = Key.fromUtf8(key);
      final encrypter =
          Encrypter(AES(_key, mode: AESMode.cbc, padding: "PKCS7"));

      String en = encrypter.encrypt(content, iv: IV.fromUtf8(iv)).base64;
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
      final _key = Key.fromUtf8(key);
      final encrypter =
          Encrypter(AES(_key, mode: AESMode.cbc, padding: "PKCS7"));

      String de = encrypter.decrypt64(content, iv: IV.fromUtf8(iv));
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

  static int _openHelperLib(LuaState ls) {
    ls.newMetatable("HelperClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_HelperMembers, 0);

    ls.newLib(_HelperWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Helper", _openHelperLib, true);
    ls.pop(1);
  }
}
