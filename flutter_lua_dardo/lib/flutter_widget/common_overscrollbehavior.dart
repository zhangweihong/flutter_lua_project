import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/index.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';

class OverScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          //不显示头部水波纹
          showLeading: false,
          //不显示尾部水波纹
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
        );
      default:
        return child;
    }
  }
}

CommonOverScrollBehaviorWidget({Widget child}) {
  return ScrollConfiguration(behavior: OverScrollBehavior(), child: child);
}

class FlutterCommonOverScrollBehavior {
  static void require(LuaState ls) {
    ls.register(
        "CommonOverScrollBehaviorWidget", _CommonOverScrollBehaviorWidgetWrap);
  }

  static int _CommonOverScrollBehaviorWidgetWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget w;
    if (fieldType == LuaType.luaUserdata) {
      w = ls.toUserdata(-1).data as Widget;
    } else {
      throw ParameterError(
          name: 'FlutterCommonOverScrollBehavior',
          type: ls.typeName(fieldType),
          expected: "",
          source: "FlutterCommonOverScrollBehavior child null");
    }
    ls.pop(1);

    Userdata userdata = ls.newUserdata<Widget>();
    userdata.data = CommonOverScrollBehaviorWidget(child: w);

    return 1;
  }
}
