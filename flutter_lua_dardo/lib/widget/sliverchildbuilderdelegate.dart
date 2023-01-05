import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';

class FlutterSliverChildBuilderDelegate {
  static void require(LuaState ls) {
    ls.register("SliverChildBuilderDelegate", _SliverChildBuilderDelegateWrap);
  }

  static int _SliverChildBuilderDelegateWrap(LuaState ls) {
    if (ls.getTop() > 0) {
      var builderId = -1;
      var fieldType = ls.getField(-1, "builder");
      if (fieldType == LuaType.luaFunction) {
        builderId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
        throw ParameterError(
            name: 'SliverChildBuilderDelegate',
            type: '',
            expected: "",
            source: "SliverChildBuilderDelegate builder null");
      }

      fieldType = ls.getField(-1, "childCount");
      int childCount;
      if (fieldType == LuaType.luaNumber) {
        childCount = ls.toIntegerX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "addAutomaticKeepAlives");
      var addAutomaticKeepAlives = true;
      if (fieldType == LuaType.luaBoolean) {
        addAutomaticKeepAlives = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "addRepaintBoundaries");
      var addRepaintBoundaries = true;
      if (fieldType == LuaType.luaBoolean) {
        addRepaintBoundaries = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "addSemanticIndexes");
      var addSemanticIndexes = true;
      if (fieldType == LuaType.luaBoolean) {
        addSemanticIndexes = ls.toBoolean(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "semanticIndexOffset");
      var semanticIndexOffset = 0;
      if (fieldType == LuaType.luaNumber) {
        semanticIndexOffset = ls.toIntegerX(-1);
      }
      ls.pop(1);

      fieldType = ls.getField(-1, "semanticIndexCallback");
      var semanticIndexCallbackId = -1;
      if (fieldType == LuaType.luaFunction) {
        semanticIndexCallbackId = ls.ref(lua_registryindex);
      } else {
        ls.pop(1);
      }

      Userdata userdata = ls.newUserdata<SliverChildBuilderDelegate>();
      userdata.data = SliverChildBuilderDelegate(
          (context, index) {
            Widget w;
            if (builderId != -1) {
              ls.rawGetI(lua_registryindex, builderId);
              var userdata = ls.newUserdata<BuildContext>();
              userdata.data = context;
              ls.pushInteger(index);
              ls.pCall(2, 1, 1);
              if (ls.isUserdata(-1)) {
                w = ls.toUserdata<Widget>(-1).data;
              }
              ls.setTop(0);
            }
            return w;
          },
          childCount: childCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          semanticIndexCallback: (w, index) {
            int v;
            if (semanticIndexCallbackId != -1) {
              ls.rawGetI(lua_registryindex, semanticIndexCallbackId);
              var userdata = ls.newUserdata<Widget>();
              userdata.data = w;
              ls.pushInteger(index);
              ls.pCall(2, 1, 1);
              if (ls.isNumber(-1)) {
                v = ls.toIntegerX(-1);
              }
              ls.setTop(0);
            }
            return v;
          },
          semanticIndexOffset: semanticIndexOffset);
    }

    return 1;
  }
}
