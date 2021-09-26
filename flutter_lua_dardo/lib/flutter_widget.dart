import 'package:flutter/widgets.dart';
import 'package:flutter_lua_dardo/widget/align.dart';
import 'package:flutter_lua_dardo/widget/column.dart';
import 'package:flutter_lua_dardo/widget/enumerate.dart';
import 'package:flutter_lua_dardo/widget/gesture_detector.dart';
import 'package:flutter_lua_dardo/widget/image.dart';
import 'package:flutter_lua_dardo/widget/row.dart';
import 'package:flutter_lua_dardo/widget/text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lua_dardo/lua.dart';

class FlutterWidget {
  static LuaState _ls;
  static void open(LuaState ls) {
    _ls = ls;
    FlutterCrossAxisAlign.require(ls);
    FlutterMainAxisAlign.require(ls);
    FlutterMainAxisSize.require(ls);
    FlutterFontWeight.require(ls);
    FlutterBoxFit.require(ls);
    FlutterRow.require(ls);
    FlutterColumn.require(ls);
    FlutterText.require(ls);
    FlutterImage.require(ls);
    FlutterGestureDetector.require(ls);
    FlutterAlignment.require(ls);
    FlutterAlign.require(ls);
    registerUtil();
  }

  static T findViewByName<T extends Widget>(String name) {
    if (_ls == null) {
      return Text("") as T;
    }

    _ls.getGlobal(name);
    _ls.pCall(0, 1, 1);
    if (_ls.isUserdata(-1)) {
      var w = _ls.toUserdata<T>(-1).data;
      _ls.setTop(0);
      return w;
    }
    throw Exception("Cannot find $name, "
        "please check the function name in the Lua script.");
  }

  static init(BuildContext context, Size size, Orientation orientation) {
    //初始化
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: size,
        orientation: Orientation.landscape);
  }

  static void registerUtil() {
    if (_ls == null) {
      return;
    }
    _ls.register('sp', (ls) {
      double _sp = ls.checkNumber(1);
      _ls.pushNumber(_sp.sp);
      return 1;
    });
    _ls.register('w', (ls) {
      double _w = ls.checkNumber(1);
      _ls.pushNumber(_w.w);
      return 1;
    });
    _ls.register('h', (ls) {
      double _h = ls.checkNumber(1);
      _ls.pushNumber(_h.h);
      return 1;
    });
    _ls.register('r', (ls) {
      double _r = ls.checkNumber(1);
      _ls.pushNumber(_r.r);
      return 1;
    });
  }
}
