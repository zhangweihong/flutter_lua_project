import 'package:flutter/widgets.dart';
import 'package:flutter_lua_dardo/flutter_lua.dart';
import 'package:flutter_lua_dardo/lua_manager.dart';
import 'package:flutter_lua_dardo/widget/alignment.dart';
import 'package:flutter_lua_dardo/widget/border.dart';
import 'package:flutter_lua_dardo/widget/borderradius.dart';
import 'package:flutter_lua_dardo/widget/box_fit.dart';
import 'package:flutter_lua_dardo/widget/boxdecoration.dart';
import 'package:flutter_lua_dardo/widget/clip_rrect.dart';
import 'package:flutter_lua_dardo/widget/drag_start_behavior.dart';
import 'package:flutter_lua_dardo/widget/fittedbox.dart';
import 'package:flutter_lua_dardo/widget/pageview.dart';
import 'package:flutter_lua_dardo/widget/scrollphysics.dart';
import 'package:flutter_lua_dardo/widget/sizedbox.dart';
import 'package:flutter_lua_dardo/widget/colors.dart';
import 'package:flutter_lua_dardo/widget/cross_axis_align.dart';
import 'package:flutter_lua_dardo/widget/decorationimage.dart';
import 'package:flutter_lua_dardo/widget/edgeinsets.dart';
import 'package:flutter_lua_dardo/widget/elevated_button.dart';
import 'package:flutter_lua_dardo/widget/font_weight.dart';
import 'package:flutter_lua_dardo/widget/icon.dart';
import 'package:flutter_lua_dardo/widget/icon_button.dart';
import 'package:flutter_lua_dardo/widget/icon_data.dart';
import 'package:flutter_lua_dardo/widget/init_widget.dart';
import 'package:flutter_lua_dardo/widget/align.dart';
import 'package:flutter_lua_dardo/widget/appbar.dart';
import 'package:flutter_lua_dardo/widget/column.dart';
import 'package:flutter_lua_dardo/widget/container.dart';
import 'package:flutter_lua_dardo/widget/gesture_detector.dart';
import 'package:flutter_lua_dardo/widget/image.dart';
import 'package:flutter_lua_dardo/widget/inwell.dart';
import 'package:flutter_lua_dardo/widget/main_axis_align.dart';
import 'package:flutter_lua_dardo/widget/main_axis_size.dart';
import 'package:flutter_lua_dardo/widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/widget/positioned.dart';
import 'package:flutter_lua_dardo/widget/row.dart';
import 'package:flutter_lua_dardo/widget/scaffold.dart';
import 'package:flutter_lua_dardo/widget/stack.dart';
import 'package:flutter_lua_dardo/widget/stackfit.dart';
import 'package:flutter_lua_dardo/widget/text.dart';
import 'package:flutter_lua_dardo/widget/text_align.dart';
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
    FlutterDecorationImage.require(ls);
    FlutterRow.require(ls);
    FlutterColumn.require(ls);
    FlutterPositioned.require(ls);
    FlutterStack.require(ls);
    FlutterStackFit.require(ls);
    FlutterTextAlign.require(ls);
    FlutterText.require(ls);
    FlutterImage.require(ls);
    FlutterFittedBox.require(ls);
    FlutterSizedBox.require(ls);
    FlutterContainer.require(ls);
    FlutterBoxDecoration.require(ls);
    FlutterEdgeInsets.require(ls);
    FlutterGestureDetector.require(ls);
    FlutterAlignment.require(ls);
    FlutterInWell.require(ls);
    FlutterBorderRadius.require(ls);
    FlutterBorder.require(ls);
    FlutterIconData.require(ls);
    FlutterIcon.require(ls);
    FlutterIconButton.require(ls);
    FlutterElevatedButton.require(ls);
    FlutterAlign.require(ls);
    FlutterAppBar.require(ls);
    FlutterColors.require(ls);
    FlutterScaffold.require(ls);
    FlutterPageView.require(ls);
    FlutterDragStartBehavior.require(ls);
    FlutterScrollPhysics.require(ls);
    FlutterClipRRect.require(ls);
    FlutterCommonStatefulWidget.require(ls);
    FlutterCommonStatelessWidget.require(ls);
    FlutterUtils.open(ls);
    registerUtil();
  }

  static T doLuaBuild<T extends Widget>(
      String name, String path, BuildContext context) {
    if (_ls == null) {
      return InitWidget() as T;
    }

    LuaType _t = _ls.getGlobal(name);
    if (_t == LuaType.luaTable) {
      var fieldType = _ls.getField(-1, "build");
      if (fieldType == LuaType.luaFunction) {
        Userdata userdata = _ls.newUserdata<BuildContext>();
        userdata.data = context;
        _ls.pCall(1, 1, 1);
        if (_ls.isUserdata(-1)) {
          var w = _ls.toUserdata<T>(-1).data;
          _ls.setTop(0);
          return w;
        }
      }
    }
    throw ParameterError(
        name: "doLuaBuild $name",
        type: "not Luatable",
        expected: "expected null",
        source: path);
  }

  static void doLuaDispose(String name) {
    LuaType _t = _ls.getGlobal(name);
    if (_t == LuaType.luaTable) {
      var fieldType = _ls.getField(-1, "dispose");
      if (fieldType == LuaType.luaFunction) {
        _ls.pCall(0, 0, 1);
      }
      _ls.pop(1);
    } else {
      throw ParameterError(
          name: "doLuaDispose $name",
          type: "not Luatable",
          expected: "expected null",
          source: name);
    }
  }

  static void doLuaDeactivate(String name) {
    LuaType _t = _ls.getGlobal(name);
    if (_t == LuaType.luaTable) {
      var fieldType = _ls.getField(-1, "deactivate");
      if (fieldType == LuaType.luaFunction) {
        _ls.pCall(0, 0, 1);
      }
      _ls.pop(1);
    } else {
      throw ParameterError(
          name: "doLuaDeactivate $name",
          type: "not Luatable",
          expected: "expected null",
          source: name);
    }
  }

  static void doLuaActivate(String name) {
    LuaType _t = _ls.getGlobal(name);
    if (_t == LuaType.luaTable) {
      var fieldType = _ls.getField(-1, "activate");
      if (fieldType == LuaType.luaFunction) {
        _ls.pCall(0, 0, 1);
      }
      _ls.pop(1);
    } else {
      throw ParameterError(
          name: "doLuaActivate $name",
          type: "not Luatable",
          expected: "expected null",
          source: name);
    }
  }

  static void doLuaDidChangeDependencies(String name) {
    LuaType _t = _ls.getGlobal(name);
    if (_t == LuaType.luaTable) {
      var fieldType = _ls.getField(-1, "didChangeDependencies");
      if (fieldType == LuaType.luaFunction) {
        _ls.pCall(0, 0, 1);
      }
      _ls.pop(1);
    } else {
      throw ParameterError(
          name: "doLuaDidChangeDependencies $name",
          type: "not Luatable",
          expected: "expected null",
          source: name);
    }
  }

  static void doLuaDidUpdateWidget(String name, Widget oldW) {
    LuaType _t = _ls.getGlobal(name);
    if (_t == LuaType.luaTable) {
      var fieldType = _ls.getField(-1, "didUpdateWidget");
      if (fieldType == LuaType.luaFunction) {
        Userdata userdata = _ls.newUserdata<Widget>();
        userdata.data = oldW;
        _ls.pCall(1, 0, 1);
      }
      _ls.pop(1);
    } else {
      throw ParameterError(
          name: "doLuaDidUpdateWidget $name",
          type: "not Luatable",
          expected: "expected null",
          source: name);
    }
  }

  static T findViewByName<T extends Widget>(String name) {
    if (_ls == null) {
      return InitWidget() as T;
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
      context,
      designSize: size,
    );
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
