import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterLayerLink {
  static const Map<String, DartFunction> _LayerLinkWrap = {
    'new': _newLayerLinkWrap,
  };

  static const Map<String, DartFunction> _LayerLinkMembers = {'id': null};

  static int _newLayerLinkWrap(LuaState ls) {
    ls.newUserdata().data = LayerLink();
    return 1;
  }

  static int _openLayerLinkLib(LuaState ls) {
    ls.newMetatable('LayerLinkClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_LayerLinkMembers, 0);
    ls.newLib(_LayerLinkWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('LayerLink', _openLayerLinkLib, true);
    ls.pop(1);
  }
}
