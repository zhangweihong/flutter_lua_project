import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterExpanded {
  static const Map<String, DartFunction> _ExpandedWrap = {
    'new': _newExpandedWrap,
  };

  static const Map<String, DartFunction> _ExpandedMembers = {'id': null};

  static int _newExpandedWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child;
    if (fieldType != LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
    } else {
      throw ParameterError(
          expected: "FlutterExpanded child is null",
          type: "",
          name: "",
          source: "");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "flex");
    int flex = 1;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    ls.newUserdata().data = Expanded(
      key: key,
      child: child,
      flex: flex,
    );
    return 1;
  }

  static int _openExpandedLib(LuaState ls) {
    ls.newMetatable('ExpandedClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_ExpandedMembers, 0);
    ls.newLib(_ExpandedWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('Expanded', _openExpandedLib, true);
    ls.pop(1);
  }
}
