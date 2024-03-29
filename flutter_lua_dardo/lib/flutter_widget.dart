import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lua_dardo/animation/animationcontroller.dart';
import 'package:flutter_lua_dardo/animation/curved_animation.dart';
import 'package:flutter_lua_dardo/animation/curves.dart';
import 'package:flutter_lua_dardo/common/netagent.dart';
import 'package:flutter_lua_dardo/common/sharedpreferences.dart';
import 'package:flutter_lua_dardo/flutter_lua.dart';
import 'package:flutter_lua_dardo/flutter_widget/Matrix4.dart';
import 'package:flutter_lua_dardo/flutter_widget/alignment.dart';
import 'package:flutter_lua_dardo/flutter_widget/animation_behavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/animation_status.dart';
import 'package:flutter_lua_dardo/flutter_widget/axis.dart';
import 'package:flutter_lua_dardo/flutter_widget/blendmode.dart';
import 'package:flutter_lua_dardo/flutter_widget/border.dart';
import 'package:flutter_lua_dardo/flutter_widget/border_radius.dart';
import 'package:flutter_lua_dardo/flutter_widget/borderside.dart';
import 'package:flutter_lua_dardo/flutter_widget/borderstyle.dart';
import 'package:flutter_lua_dardo/flutter_widget/bottom_navigationbar.dart';
import 'package:flutter_lua_dardo/flutter_widget/bottom_navigationbarItem.dart';
import 'package:flutter_lua_dardo/flutter_widget/bottom_navigationbartype.dart';
import 'package:flutter_lua_dardo/flutter_widget/box_fit.dart';
import 'package:flutter_lua_dardo/flutter_widget/box_decoration.dart';
import 'package:flutter_lua_dardo/flutter_widget/brightness.dart';
import 'package:flutter_lua_dardo/flutter_widget/buttonstyle.dart';
import 'package:flutter_lua_dardo/flutter_widget/center.dart';
import 'package:flutter_lua_dardo/flutter_widget/checkbox.dart';
import 'package:flutter_lua_dardo/flutter_widget/checkbox_listtile.dart';
import 'package:flutter_lua_dardo/flutter_widget/chip.dart';
import 'package:flutter_lua_dardo/flutter_widget/circle_avatar.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip_path.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip_rect.dart';
import 'package:flutter_lua_dardo/flutter_widget/clip_rrect.dart';
import 'package:flutter_lua_dardo/flutter_widget/common_widget.dart';
import 'package:flutter_lua_dardo/flutter_widget/common_overscrollbehavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/composited_transform_target.dart';
import 'package:flutter_lua_dardo/flutter_widget/datatable.dart';
import 'package:flutter_lua_dardo/flutter_widget/datepicker.dart';
import 'package:flutter_lua_dardo/flutter_widget/datepicker_entrymode.dart';
import 'package:flutter_lua_dardo/flutter_widget/datepicker_mode.dart';
import 'package:flutter_lua_dardo/flutter_widget/device_orientation.dart';
import 'package:flutter_lua_dardo/flutter_widget/drag_start_behavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/dropdown.dart';
import 'package:flutter_lua_dardo/flutter_widget/filterquality.dart';
import 'package:flutter_lua_dardo/flutter_widget/fittedbox.dart';
import 'package:flutter_lua_dardo/flutter_widget/fontstyle.dart';
import 'package:flutter_lua_dardo/flutter_widget/fractionally_sizedbox.dart';
import 'package:flutter_lua_dardo/flutter_widget/gridview.dart';
import 'package:flutter_lua_dardo/flutter_widget/icontheme.dart';
import 'package:flutter_lua_dardo/flutter_widget/imagerepeat.dart';
import 'package:flutter_lua_dardo/flutter_widget/layerlink.dart';
import 'package:flutter_lua_dardo/flutter_widget/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/opacity.dart';
import 'package:flutter_lua_dardo/flutter_widget/overlayer.dart';
import 'package:flutter_lua_dardo/flutter_widget/path.dart';
import 'package:flutter_lua_dardo/flutter_widget/pathfilltype.dart';
import 'package:flutter_lua_dardo/flutter_widget/popup_menu_button_int.dart';
import 'package:flutter_lua_dardo/flutter_widget/popup_menu_positon.dart';
import 'package:flutter_lua_dardo/flutter_widget/r_rect.dart';
import 'package:flutter_lua_dardo/flutter_widget/radio.dart';
import 'package:flutter_lua_dardo/flutter_widget/radio_listtile.dart';
import 'package:flutter_lua_dardo/flutter_widget/raw_material_button.dart';
import 'package:flutter_lua_dardo/flutter_widget/rect.dart';
import 'package:flutter_lua_dardo/flutter_widget/responsetype.dart';
import 'package:flutter_lua_dardo/flutter_widget/rounded_rectangleborder.dart';
import 'package:flutter_lua_dardo/flutter_widget/shadow.dart';
import 'package:flutter_lua_dardo/flutter_widget/singlechild_scrollview.dart';
import 'package:flutter_lua_dardo/flutter_widget/slider.dart';
import 'package:flutter_lua_dardo/flutter_widget/spacer.dart';
import 'package:flutter_lua_dardo/flutter_widget/switch.dart';
import 'package:flutter_lua_dardo/flutter_widget/tab_bar.dart';
import 'package:flutter_lua_dardo/flutter_widget/textspan.dart';
import 'package:flutter_lua_dardo/flutter_widget/listview.dart';
import 'package:flutter_lua_dardo/flutter_widget/pageview.dart';
import 'package:flutter_lua_dardo/flutter_widget/preferredsize.dart';
import 'package:flutter_lua_dardo/flutter_widget/safearea.dart';
import 'package:flutter_lua_dardo/flutter_widget/scrollcontroller.dart';
import 'package:flutter_lua_dardo/flutter_widget/scrollphysics.dart';
import 'package:flutter_lua_dardo/flutter_widget/scrollview_keyboard_dismissbehavior.dart';
import 'package:flutter_lua_dardo/flutter_widget/sizedbox.dart';
import 'package:flutter_lua_dardo/flutter_widget/colors.dart';
import 'package:flutter_lua_dardo/flutter_widget/cross_axis_align.dart';
import 'package:flutter_lua_dardo/flutter_widget/decoration_image.dart';
import 'package:flutter_lua_dardo/flutter_widget/edgeinsets.dart';
import 'package:flutter_lua_dardo/flutter_widget/elevated_button.dart';
import 'package:flutter_lua_dardo/flutter_widget/font_weight.dart';
import 'package:flutter_lua_dardo/flutter_widget/icon.dart';
import 'package:flutter_lua_dardo/flutter_widget/icon_button.dart';
import 'package:flutter_lua_dardo/flutter_widget/icon_data.dart';
import 'package:flutter_lua_dardo/flutter_widget/init_widget.dart';
import 'package:flutter_lua_dardo/flutter_widget/align.dart';
import 'package:flutter_lua_dardo/flutter_widget/appbar.dart';
import 'package:flutter_lua_dardo/flutter_widget/column.dart';
import 'package:flutter_lua_dardo/flutter_widget/container.dart';
import 'package:flutter_lua_dardo/flutter_widget/gesture_detector.dart';
import 'package:flutter_lua_dardo/flutter_widget/image.dart';
import 'package:flutter_lua_dardo/flutter_widget/inwell.dart';
import 'package:flutter_lua_dardo/flutter_widget/main_axis_align.dart';
import 'package:flutter_lua_dardo/flutter_widget/main_axis_size.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/flutter_widget/positioned.dart';
import 'package:flutter_lua_dardo/flutter_widget/row.dart';
import 'package:flutter_lua_dardo/flutter_widget/scaffold.dart';
import 'package:flutter_lua_dardo/flutter_widget/sliverchild_builder_delegate.dart';
import 'package:flutter_lua_dardo/flutter_widget/sliver_grid_delegatewith_fixed_crossaxiscount.dart';
import 'package:flutter_lua_dardo/flutter_widget/stack.dart';
import 'package:flutter_lua_dardo/flutter_widget/stackfit.dart';
import 'package:flutter_lua_dardo/flutter_widget/strutstyle.dart';
import 'package:flutter_lua_dardo/flutter_widget/systemuimode.dart';
import 'package:flutter_lua_dardo/flutter_widget/systemuioverlay.dart';
import 'package:flutter_lua_dardo/flutter_widget/text.dart';
import 'package:flutter_lua_dardo/flutter_widget/text_align.dart';
import 'package:flutter_lua_dardo/flutter_widget/textbaseline.dart';
import 'package:flutter_lua_dardo/flutter_widget/textdirection.dart';
import 'package:flutter_lua_dardo/flutter_widget/textoverflow.dart';
import 'package:flutter_lua_dardo/flutter_widget/textstyle.dart';
import 'package:flutter_lua_dardo/flutter_widget/textwidthbasis.dart';
import 'package:flutter_lua_dardo/flutter_widget/timepicker.dart';
import 'package:flutter_lua_dardo/flutter_widget/timepicker_entrymode.dart';
import 'package:flutter_lua_dardo/flutter_widget/verticaldirection.dart';
import 'package:flutter_lua_dardo/flutter_widget/visibility.dart';
import 'package:flutter_lua_dardo/state/common_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lua_dardo/lua.dart';

import 'flutter_widget/list_tile_controlaffinity.dart';

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
    FlutterAxis.require(ls);
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
    FlutterSliverChildBuilderDelegate.require(ls);
    FlutterInWell.require(ls);
    FlutterBorderRadius.require(ls);
    FlutterBorder.require(ls);
    FlutterIconData.require(ls);
    FlutterIcon.require(ls);
    FlutterIconButton.require(ls);
    FlutterListView.require(ls);
    FlutterSliverGridDelegateWithFixedCrossAxisCount.require(ls);
    FlutterGridView.require(ls);
    FlutterElevatedButton.require(ls);
    FlutterScrollController.require(ls);
    FlutterAlign.require(ls);
    FlutterAppBar.require(ls);
    FlutterMatrix4.require(ls);
    FlutterFilterQuality.require(ls);
    FlutterColors.require(ls);
    FlutterCenter.require(ls);
    FlutterScaffold.require(ls);
    FlutterPageView.require(ls);
    FlutterDragStartBehavior.require(ls);
    FlutterScrKeyBoardDisBehavior.require(ls);
    FlutterScrollPhysics.require(ls);
    FlutterCommonOverScrollBehavior.require(ls);
    FlutterClipRRect.require(ls);
    FlutterSafeArea.require(ls);
    FlutterClip.require(ls);
    FlutterImageRepeat.require(ls);
    FlutterVisibility.require(ls);
    FlutterCurves.require(ls);
    FlutterBlendMode.require(ls);
    FlutterAnimationStatus.require(ls);
    FlutterSystemUiMode.require(ls);
    FlutterSystemUiOverlay.require(ls);
    FlutterAnimationController.require(ls);
    FlutterCurvedAnimation.require(ls);
    FlutterDeviceOrientation.require(ls);
    FlutterAnimationBehavior.require(ls);
    FlutterCommonStatefulWidget.require(ls);
    FlutterCommonStatelessWidget.require(ls);
    FlutterTextDirection.require(ls);
    FlutterStrutStyle.require(ls);
    FlutterTextOverflow.require(ls);
    FlutterTextBaseline.require(ls);
    FlutterTextWidthBasis.require(ls);
    FluuterTextSpan.require(ls);
    FlutterVerticalDirection.require(ls);
    FlutterPreferredSize.require(ls);
    FlutterBrightness.require(ls);
    FlutterFontStyle.require(ls);
    FlutterTextStyle.require(ls);
    FlutterOpacity.require(ls);
    FlutterIconThemeData.require(ls);
    FlutterShadow.require(ls);
    FlutterRect.require(ls);
    FlutterSpacer.require(ls);
    FlutterButtonStyle.require(ls);
    FlutterBorderStyle.require(ls);
    FlutterRoundedRectangleBorder.require(ls);
    FlutterBorderSide.require(ls);
    FlutterCommonState.require(ls);
    FlutterProvider.require(ls);
    FlutterCommonCusumerWidget.require(ls);
    FlutterSharedPreferences.require(ls);
    FlutterResponseType.require(ls);
    FlutterNetAgent.require(ls);
    FlutterSingleChildScrollView.require(ls);
    FlutterFractionallySizedBox.require(ls);
    FlutterBottomNavigationBar.require(ls);
    FLutterBottomNavigationBarItem.require(ls);
    FlutterBottomNavigationBarType.require(ls);
    FlutterDatePicker.require(ls);
    FlutterDatePickerMode.require(ls);
    FlutterListTileControlAffinity.require(ls);
    FlutterCheckbox.require(ls);
    FlutterCheckboxListTile.require(ls);
    FlutterRadio.require(ls);
    FlutterSwitch.require(ls);
    FlutterSlider.require(ls);
    FlutterPathClipper.require(ls);
    FlutterClipPath.require(ls);
    FlutterClipRect.require(ls);
    FlutterRRect.require(ls);
    FlutterPath.require(ls);
    FlutterChip.require(ls);
    FlutterPathOperation.require(ls);
    FlutterPathFillType.require(ls);
    FlutterRRectClipper.require(ls);
    FlutterRectClipper.require(ls);
    FlutterCircleAvatar.require(ls);
    FlutterRadioListTile.require(ls);
    FlutterRawMaterialButton.require(ls);
    FlutterDatePickerEntryMode.require(ls);
    FlutterTimePickerEntryMode.require(ls);
    FlutterTimePicker.require(ls);
    FlutterDataColumn.require(ls);
    FlutterTableBorder.require(ls);
    FlutterTabBar.require(ls);
    FlutterPopupMenuPosition.require(ls);
    FlutterPopupMenuButton.require(ls);
    FlutterDataRow.require(ls);
    FlutterLayerLink.require(ls);
    FlutterCompositedTransformTarget.require(ls);
    FlutterCompositedTransformFollower.require(ls);
    FlutterDataCell.require(ls);
    FlutterDataTable.require(ls);
    FlutterOverlayEntry.require(ls);
    FlutterOverLayer.require(ls);
    FlutterMaterialType.require(ls);
    FlutterMaterial.require(ls);
    FlutterOverState.require(ls);
    FlutterDropDown.require(ls);
    FlutterDropdownMenuItem.require(ls);
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

  static init(BuildContext context, Size size) {
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
    _ls.register('sm', (ls) {
      double _r = ls.checkNumber(1);
      _ls.pushNumber(_r.sm);
      return 1;
    });

    _ls.register('sw', (ls) {
      double _r = ls.checkNumber(1);
      _ls.pushNumber(_r.sw);
      return 1;
    });
  }
}
