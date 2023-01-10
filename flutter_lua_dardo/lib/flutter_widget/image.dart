import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/alignment.dart';
import 'package:flutter_lua_dardo/flutter_widget/blendmode.dart';
import 'package:flutter_lua_dardo/flutter_widget/box_fit.dart';
import 'package:flutter_lua_dardo/flutter_widget/filterquality.dart';
import 'package:flutter_lua_dardo/flutter_widget/imagerepeat.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:lua_dardo/lua.dart';

enum _Image { asset, file, memory, network }

class FlutterImage {
  static const Map<String, DartFunction> _ImageWrap = {
    "asset": _asset,
    "file": _file,
    "memory": _memory,
    "network": _network,
  };

  static const Map<String, DartFunction> _ImageMembers = {"id": null};

  static int _asset(LuaState ls) {
    return _init(ls, _Image.asset);
  }

  static int _file(LuaState ls) {
    return _init(ls, _Image.file);
  }

  static int _memory(LuaState ls) {
    return 1;
  }

  static int _network(LuaState ls) {
    return _init(ls, _Image.network);
  }

  static int _init(LuaState ls, _Image type) {
    if (ls.getTop() > 0) {
      double width, height;
      BoxFit fit;

      String first;
      if (ls.isString(-1)) {
        first = ls.toStr(-1);
      } else if (ls.isTable(-1)) {
        first = ls.toStr(-2);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'image First Error',
            type: "",
            expected: "String",
            source: "FlutterImage _assetText");
      }

      var fieldType = ls.getField(-1, "width");
      if (fieldType == LuaType.luaNumber) {
        width = ls.toNumber(-1);
        ls.pop(1);
      } else if (fieldType == LuaType.luaNil) {
        ls.pop(1);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'width',
            type: ls.typeName(fieldType),
            expected: "double",
            source: "FlutterImage _assetText");
      }

      fieldType = ls.getField(-1, "height");
      if (fieldType == LuaType.luaNumber) {
        height = ls.toNumber(-1);
        ls.pop(1);
      } else if (fieldType == LuaType.luaNil) {
        ls.pop(1);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'height',
            type: ls.typeName(fieldType),
            expected: "double",
            source: "FlutterImage _assetText");
      }

      fieldType = ls.getField(-1, "fit");
      if (fieldType == LuaType.luaNumber) {
        fit = FlutterBoxFit.get(ls.toIntegerX(-1));
        ls.pop(1);
      } else if (fieldType == LuaType.luaNil) {
        ls.pop(1);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'fit',
            type: ls.typeName(fieldType),
            expected: "double",
            source: "FlutterImage _assetText");
      }

      fieldType = ls.getField(-1, "key");
      GlobalKey key;
      if (fieldType == LuaType.luaUserdata) {
        key = ls.toUserdata(-1).data as GlobalKey;
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      fieldType = ls.getField(-1, "alignment");
      Alignment alignment = Alignment.center;
      if (fieldType == LuaType.luaUserdata) {
        alignment = FlutterAlignment.get(ls.toIntegerX(-1));
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      fieldType = ls.getField(-1, "repeat");
      ImageRepeat repeat = ImageRepeat.noRepeat;
      if (fieldType == LuaType.luaNumber) {
        repeat = FlutterImageRepeat.get(ls.toIntegerX(-1));
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "frameBuilder");
      int frameBuilderId = -1;
      if (fieldType == LuaType.luaFunction) {
        frameBuilderId = ls.ref(-1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "loadingBuilder");
      int loadingBuilderId = -1;
      if (fieldType == LuaType.luaFunction) {
        loadingBuilderId = ls.ref(-1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "errorBuilder");
      int errorBuilderId = -1;
      if (fieldType == LuaType.luaFunction) {
        errorBuilderId = ls.ref(-1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "color");
      Color color;
      if (fieldType == LuaType.luaUserdata) {
        color = ls.toUserdata(-1).data as Color;
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "colorBlendMode");
      BlendMode colorBlendMode;
      if (fieldType == LuaType.luaNumber) {
        colorBlendMode = FlutterBlendMode.get(ls.toIntegerX(-1));
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "excludeFromSemantics");
      bool excludeFromSemantics = false;
      if (fieldType == LuaType.luaBoolean) {
        excludeFromSemantics = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "semanticLabel");
      String semanticLabel;
      if (fieldType == LuaType.luaBoolean) {
        semanticLabel = ls.toStr(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "matchTextDirection");
      bool matchTextDirection = false;
      if (fieldType == LuaType.luaBoolean) {
        matchTextDirection = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "gaplessPlayback");
      bool gaplessPlayback = false;
      if (fieldType == LuaType.luaBoolean) {
        gaplessPlayback = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      fieldType = ls.getField(-1, "isAntiAlias");
      bool isAntiAlias = false;
      if (fieldType == LuaType.luaBoolean) {
        isAntiAlias = ls.toBoolean(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "filterQuality");
      FilterQuality filterQuality = FilterQuality.none;
      if (fieldType == LuaType.luaNumber) {
        filterQuality = FlutterFilterQuality.get(ls.toIntegerX(-1));
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "scale");
      double scale = 1.0;
      if (fieldType == LuaType.luaNumber) {
        scale = ls.toNumberX(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      fieldType = ls.getField(-1, "cacheWidth");
      int cacheWidth;
      if (fieldType == LuaType.luaNumber) {
        cacheWidth = ls.toIntegerX(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      fieldType = ls.getField(-1, "cacheHeight");
      int cacheHeight;
      if (fieldType == LuaType.luaNumber) {
        cacheHeight = ls.toIntegerX(-1);
        ls.pop(1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "opacity");
      var opacity;
      if (fieldType == LuaType.luaUserdata) {
        opacity = ls.toUserdata(-1).data as Animation<double>;
        ls.pop(1);
      } else {
        ls.pop(1);
      }
      Userdata u = ls.newUserdata<Image>();
      switch (type) {
        case _Image.asset:
          u.data = Image.asset(first,
              alignment: alignment,
              repeat: repeat,
              semanticLabel: semanticLabel,
              colorBlendMode: colorBlendMode,
              filterQuality: filterQuality,
              color: color,
              scale: scale,
              opacity: opacity,
              matchTextDirection: matchTextDirection,
              gaplessPlayback: gaplessPlayback,
              isAntiAlias: isAntiAlias,
              excludeFromSemantics: excludeFromSemantics,
              frameBuilder: frameBuilderId != -1
                  ? (_context, _child, _frame, _wasSynchronouslyLoaded) {
                      ls.rawGetI(lua_registryindex, frameBuilderId);
                      Userdata userdata1 = ls.newUserdata<BuildContext>();
                      userdata1.data = _context;
                      Userdata userdata2 = ls.newUserdata<Widget>();
                      userdata2.data = _child;
                      ls.pushInteger(_frame);
                      ls.pushBoolean(_wasSynchronouslyLoaded);
                      ls.pCall(4, 1, 1);
                      Widget w;
                      if (ls.isUserdata(-1)) {
                        w = ls.toUserdata(-1).data as Widget;
                        ls.setTop(0);
                      }
                      return w;
                    }
                  : null,
              key: key,
              width: width,
              height: height,
              cacheWidth: cacheWidth,
              cacheHeight: cacheHeight,
              fit: fit);
          break;
        case _Image.file:
          u.data = Image.file(File(first),
              key: key,
              alignment: alignment,
              repeat: repeat,
              semanticLabel: semanticLabel,
              colorBlendMode: colorBlendMode,
              filterQuality: filterQuality,
              color: color,
              scale: scale,
              matchTextDirection: matchTextDirection,
              opacity: opacity,
              gaplessPlayback: gaplessPlayback,
              isAntiAlias: isAntiAlias,
              excludeFromSemantics: excludeFromSemantics,
              frameBuilder: frameBuilderId != -1
                  ? (_context, _child, _frame, _wasSynchronouslyLoaded) {
                      ls.rawGetI(lua_registryindex, frameBuilderId);
                      Userdata userdata1 = ls.newUserdata<BuildContext>();
                      userdata1.data = _context;
                      Userdata userdata2 = ls.newUserdata<Widget>();
                      userdata2.data = _child;
                      ls.pushInteger(_frame);
                      ls.pushBoolean(_wasSynchronouslyLoaded);
                      ls.pCall(4, 1, 1);
                      Widget w;
                      if (ls.isUserdata(-1)) {
                        w = ls.toUserdata(-1).data as Widget;
                        ls.setTop(0);
                      }
                      return w;
                    }
                  : null,
              width: width,
              height: height,
              cacheWidth: cacheWidth,
              cacheHeight: cacheHeight,
              fit: fit);
          break;
        case _Image.network:
          u.data = Image.network(first,
              key: key,
              alignment: alignment,
              repeat: repeat,
              semanticLabel: semanticLabel,
              colorBlendMode: colorBlendMode,
              filterQuality: filterQuality,
              color: color,
              scale: scale,
              opacity: opacity,
              matchTextDirection: matchTextDirection,
              gaplessPlayback: gaplessPlayback,
              isAntiAlias: isAntiAlias,
              excludeFromSemantics: excludeFromSemantics,
              errorBuilder: errorBuilderId != -1
                  ? (_context, _err, _stackTrace) {
                      Widget w;
                      ls.rawGetI(lua_registryindex, errorBuilderId);
                      Userdata userdata1 = ls.newUserdata<BuildContext>();
                      userdata1.data = _context;
                      ls.pushString(_err.toString());
                      ls.pushString(_stackTrace.toString());
                      ls.pCall(3, 1, 1);
                      if (ls.isUserdata(-1)) {
                        w = ls.toUserdata(-1).data as Widget;
                        ls.setTop(0);
                      }
                      return w;
                    }
                  : null,
              loadingBuilder: loadingBuilderId != -1
                  ? (_context, _child, _chunkEvent) {
                      Widget w;
                      ls.rawGetI(lua_registryindex, loadingBuilderId);
                      Userdata userdata1 = ls.newUserdata<BuildContext>();
                      userdata1.data = _context;
                      Userdata userdata2 = ls.newUserdata<Widget>();
                      userdata2.data = _child;
                      ls.pCall(2, 1, 1);
                      if (ls.isUserdata(-1)) {
                        w = ls.toUserdata(-1).data as Widget;
                        ls.setTop(0);
                      }
                      return w;
                    }
                  : null,
              frameBuilder: frameBuilderId != -1
                  ? (_context, _child, _frame, _wasSynchronouslyLoaded) {
                      ls.rawGetI(lua_registryindex, frameBuilderId);
                      Userdata userdata1 = ls.newUserdata<BuildContext>();
                      userdata1.data = _context;
                      Userdata userdata2 = ls.newUserdata<Widget>();
                      userdata2.data = _child;
                      ls.pushInteger(_frame);
                      ls.pushBoolean(_wasSynchronouslyLoaded);
                      ls.pCall(4, 1, 1);
                      Widget w;
                      if (ls.isUserdata(-1)) {
                        w = ls.toUserdata(-1).data as Widget;
                        ls.setTop(0);
                      }
                      return w;
                    }
                  : null,
              width: width,
              height: height,
              cacheWidth: cacheWidth,
              cacheHeight: cacheHeight,
              fit: fit);
          break;
        default:
          break;
      }
      // ls.getMetatableAux('ImageClass');
      // ls.setMetatable(-2);
    }
    return 1;
  }

  static int _openImageLib(LuaState ls) {
    ls.newMetatable("ImageClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_ImageMembers, 0);

    ls.newLib(_ImageWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("Image", _openImageLib, true);
    ls.pop(1);
  }
}
