import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FluuterTextSpan {
  static const Map<String, DartFunction> _TextSpanWrap = {
    "new": _newTextSpan,
  };

  static const Map<String, DartFunction> _TextSpanMembers = {"id": null};

  static int _newTextSpan(LuaState ls) {
    if (ls.getTop() > 0) {
      var fieldType = ls.getField(-1, "text");
      var text;
      if (fieldType == LuaType.luaString) {
        text = ls.toStr(-1);
      } else {
        throw ParameterError(
            name: "InlineSpan",
            type: "",
            expected: "InlineSpan text is null",
            source: "FluuterInlineSpan");
      }

      fieldType = ls.getField(-1, "children");
      List<InlineSpan> children;
      if (fieldType == LuaType.luaTable) {
        children = List<InlineSpan>.empty(growable: true);
        var len = ls.len2(-1);
        for (int i = 1; i <= len; i++) {
          if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
            children.add(ls.toUserdata(-1).data as InlineSpan);
          }
          ls.pop(1);
        }
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "style");
      var style;
      if (fieldType == LuaType.luaUserdata) {
        style = ls.toUserdata(-1).data as TextStyle;
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "semanticsLabel");
      var semanticsLabel;
      if (fieldType == LuaType.luaString) {
        semanticsLabel = ls.toStr(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "spellOut");
      var spellOut;
      if (fieldType == LuaType.luaBoolean) {
        spellOut = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "onEnter");
      var onEnterId = -1;
      if (fieldType == LuaType.luaFunction) {
        onEnterId = ls.ref(-1);
      } else {
        ls.pop(1);
      }

      fieldType = ls.getField(-1, "onExit");
      var onExitId = -1;
      if (fieldType == LuaType.luaFunction) {
        onExitId = ls.ref(-1);
      } else {
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<TextSpan>();
      userdata.data = TextSpan(
        text: text,
        children: children,
        style: style,
        semanticsLabel: semanticsLabel,
        spellOut: spellOut,
        onEnter: (e) {
          if (onEnterId != -1) {
            ls.rawGetI(lua_registryindex, onEnterId);
            ls.pCall(0, 0, 1);
          }
        },
        onExit: (e) {
          if (onExitId != -1) {
            ls.rawGetI(lua_registryindex, onExitId);
            ls.pCall(0, 0, 1);
          }
        },
      );
    }
    return 1;
  }

  static int _openTextSpanLib(LuaState ls) {
    ls.newMetatable("TextSpanClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_TextSpanMembers, 0);

    ls.newLib(_TextSpanWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("TextSpan", _openTextSpanLib, true);
    ls.pop(1);
  }
}
