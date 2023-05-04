import 'package:flutter/cupertino.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterOverlayEntry {
  static const Map<String, DartFunction> _OverlayEntryWrap = {
    'new': _newOverlayEntryWrap,
  };

  static const Map<String, DartFunction> _OverlayEntryMembers = {'id': null};

  static int _newOverlayEntryWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "builder");
    var builderId = -1;
    if (fieldType == LuaType.luaFunction) {
      builderId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
      throw ParameterError(
        name: "FlutterOverlayEntry builder is null",
        type: "",
        expected: "",
        source: "overlayer.dart",
      );
    }
    var opaque = false;
    fieldType = ls.getField(-1, "opaque");
    if (fieldType == LuaType.luaBoolean) {
      opaque = ls.toBoolean(-1);
    }

    var maintainState = false;
    fieldType = ls.getField(-1, "maintainState");
    if (fieldType == LuaType.luaBoolean) {
      maintainState = ls.toBoolean(-1);
    }

    ls.newUserdata().data = OverlayEntry(
      builder: ((context) {
        Widget w;
        ls.rawGetI(lua_registryindex, builderId);
        ls.newUserdata().data = context;
        ls.pCall(1, 1, 1);
        if (ls.isUserdata(-1)) {
          w = ls.toUserdata<Widget>(-1).data;
        }
        return w;
      }),
      opaque: opaque,
      maintainState: maintainState,
    );
    return 1;
  }

  static int _openOverlayEntryLib(LuaState ls) {
    ls.newMetatable('OverlayEntryClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_OverlayEntryMembers, 0);
    ls.newLib(_OverlayEntryWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('OverlayEntry', _openOverlayEntryLib, true);
    ls.pop(1);
  }
}

class FlutterOverLayer {
  static const Map<String, DartFunction> _OverLayerWrap = {
    'new': _newOverLayerWrap,
    'of': _newOverLayerOfWrap,
  };

  static const Map<String, DartFunction> _OverLayerMembers = {'id': null};

  static int _newOverLayerWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    GlobalKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as GlobalKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    List<OverlayEntry> initialEntries =
        List<OverlayEntry>.empty(growable: true);
    fieldType = ls.getField(-1, "initialEntries");
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          initialEntries.add(ls.toUserdata(-1).data as OverlayEntry);
        }
        ls.pop(1);
      }
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "clipBehavior");
    var clipBehavior = Clip.hardEdge;
    if (fieldType == LuaType.luaNumber) {
      clipBehavior = FlutterClip.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    ls.newUserdata().data = Overlay(
      key: key,
      initialEntries: initialEntries,
      clipBehavior: clipBehavior,
    );
    return 1;
  }

  static int _newOverLayerOfWrap(LuaState ls) {
    var _context = null;
    var fieldType = ls.getField(-1, "context");
    if (fieldType == LuaType.luaUserdata) {
      _context = ls.toUserdata(-1).data as BuildContext;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "overlayer context is null",
          source: "overlayer.dart");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "rootOverlay");
    bool rootOverlay = false;
    if (fieldType == LuaType.luaBoolean) {
      rootOverlay = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "debugRequiredFor");
    Widget debugRequiredFor;
    if (fieldType == LuaType.luaUserdata) {
      debugRequiredFor = ls.toUserdata(-1).data as Widget;
    }
    ls.pop(1);

    ls.newUserdata().data = Overlay.of(
      _context,
      rootOverlay: rootOverlay,
      debugRequiredFor: debugRequiredFor,
    );
    return 1;
  }

  static int _openOverLayerLib(LuaState ls) {
    ls.newMetatable('OverLayerClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_OverLayerMembers, 0);
    ls.newLib(_OverLayerWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('OverLayer', _openOverLayerLib, true);
    ls.pop(1);
  }
}

class FlutterOverState {
  static const Map<String, DartFunction> _OverStateWrap = {
    'insert': _insertOverStateWrap,
    'insertAll': _insertAllOverStateWrap,
    'rearrange': _rearrangeOverStateWrap,
  };

  static const Map<String, DartFunction> _OverStateMembers = {'id': null};

  static int _insertAllOverStateWrap(LuaState ls) {
    OverlayState _state = null;
    var fieldType = ls.getField(-1, "state");
    if (fieldType == LuaType.luaUserdata) {
      _state = ls.toUserdata(-1).data as OverlayState;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "OverlayState state is null",
          source: "overlayer.dart");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "entries");
    var entries = List<OverlayEntry>.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          entries.add(ls.toUserdata(-1).data as OverlayEntry);
        }
        ls.pop(1);
      }
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "OverlayState entries is null",
          source: "overlayer.dart");
    }
    ls.pop(1);

    var below;
    fieldType = ls.getField(-1, "below");
    if (fieldType == LuaType.luaUserdata) {
      below = ls.toUserdata(-1).data as OverlayEntry;
    }
    ls.pop(1);

    var above;
    fieldType = ls.getField(-1, "above");
    if (fieldType == LuaType.luaUserdata) {
      above = ls.toUserdata(-1).data as OverlayEntry;
    }
    ls.pop(1);

    _state.insertAll(
      entries,
      below: below,
      above: above,
    );
    return 0;
  }

  static int _rearrangeOverStateWrap(LuaState ls) {
    OverlayState _state = null;
    var fieldType = ls.getField(-1, "state");
    if (fieldType == LuaType.luaUserdata) {
      _state = ls.toUserdata(-1).data as OverlayState;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "OverlayState state is null",
          source: "overlayer.dart");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "newEntries");
    var newEntries = List<OverlayEntry>.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          newEntries.add(ls.toUserdata(-1).data as OverlayEntry);
        }
        ls.pop(1);
      }
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "OverlayState newEntries is null",
          source: "overlayer.dart");
    }
    ls.pop(1);

    var below;
    fieldType = ls.getField(-1, "below");
    if (fieldType == LuaType.luaUserdata) {
      below = ls.toUserdata(-1).data as OverlayEntry;
    }
    ls.pop(1);

    var above;
    fieldType = ls.getField(-1, "above");
    if (fieldType == LuaType.luaUserdata) {
      above = ls.toUserdata(-1).data as OverlayEntry;
    }
    ls.pop(1);

    _state.rearrange(
      newEntries,
      below: below,
      above: above,
    );
    return 0;
  }

  static int _insertOverStateWrap(LuaState ls) {
    OverlayState _state = null;
    var fieldType = ls.getField(-1, "state");
    if (fieldType == LuaType.luaUserdata) {
      _state = ls.toUserdata(-1).data as OverlayState;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "OverlayState state is null",
          source: "overlayer.dart");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "entry");
    var entry;
    if (fieldType == LuaType.luaUserdata) {
      entry = ls.toUserdata(-1).data as OverlayEntry;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "OverlayState entry is null",
          source: "overlayer.dart");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "below");
    var below;
    if (fieldType == LuaType.luaUserdata) {
      below = ls.toUserdata(-1).data as OverlayEntry;
    }
    ls.pop(1);

    var above;
    fieldType = ls.getField(-1, "above");
    if (fieldType == LuaType.luaUserdata) {
      above = ls.toUserdata(-1).data as OverlayEntry;
    }
    ls.pop(1);

    _state.insert(
      entry,
      below: below,
      above: above,
    );
    return 0;
  }

  static int _openOverStateLib(LuaState ls) {
    ls.newMetatable('OverStateClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_OverStateMembers, 0);
    ls.newLib(_OverStateWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('OverState', _openOverStateLib, true);
    ls.pop(1);
  }
}
