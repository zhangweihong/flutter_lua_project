import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lua_dardo/lua.dart';

class FlutterUtils {
  static void open(LuaState ls) {
    ls.register("print", _printWrap);
    ls.register("debugPrint", _debugPrintWrap);
  }

  static int _debugPrintWrap(LuaState ls) {
    String s = ls.checkString(1);
    debugPrint(s);
    return 0;
  }

  static int _printWrap(LuaState ls) {
    String s = ls.checkString(1);
    print(s);
    return 0;
  }
}
