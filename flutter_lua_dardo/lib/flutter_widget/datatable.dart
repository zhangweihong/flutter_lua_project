import 'package:flutter/material.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/index.dart';

class FlutterDataColumn {
  static const Map<String, DartFunction> _DataColumnWrap = {
    'new': _newDataColumnWrap,
  };

  static const Map<String, DartFunction> _DataColumnMembers = {'id': null};

  static int _newDataColumnWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "label");
    Widget label;
    if (fieldType == LuaType.luaUserdata) {
      label = ls.toUserdata(-1).data as Widget;
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterChip lable is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "tooltip");
    String tooltip;
    if (fieldType == LuaType.luaString) {
      tooltip = ls.toStr(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "numeric");
    bool numeric = false;
    if (fieldType == LuaType.luaBoolean) {
      numeric = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onSort");
    int onSortId = -1;
    if (fieldType == LuaType.luaNumber) {
      onSortId = ls.toIntegerX(-1);
    }
    ls.pop(1);

    ls.newUserdata().data = DataColumn(
      label: label,
      tooltip: tooltip,
      numeric: numeric,
      onSort: onSortId != -1
          ? (index, select) {
              ls.rawGetI(lua_registryindex, onSortId);
              ls.pushInteger(index);
              ls.pushBoolean(select);
              ls.pCall(2, 0, 1);
            }
          : null,
    );
    return 1;
  }

  static int _openDataColumnLib(LuaState ls) {
    ls.newMetatable('DataColumnClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_DataColumnMembers, 0);
    ls.newLib(_DataColumnWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('DataColumn', _openDataColumnLib, true);
    ls.pop(1);
  }
}

class FlutterDataCell {
  static const Map<String, DartFunction> _DataCellWrap = {
    'new': _newDataCellWrap,
  };

  static const Map<String, DartFunction> _DataCellMembers = {'id': null};

  static int _newDataCellWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "child");
    Widget child;
    if (fieldType == LuaType.luaUserdata) {
      child = ls.toUserdata(-1).data as Widget;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "placeholder");
    bool placeholder = false;
    if (fieldType == LuaType.luaBoolean) {
      placeholder = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "showEditIcon");
    bool showEditIcon = false;
    if (fieldType == LuaType.luaBoolean) {
      showEditIcon = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onTap");
    int onTapId = -1;
    if (fieldType == LuaType.luaFunction) {
      onTapId = ls.ref(lua_registryindex);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onLongPress");
    int onLongPressId = -1;
    if (fieldType == LuaType.luaFunction) {
      onLongPressId = ls.ref(lua_registryindex);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onTapDown");
    int onTapDownId = -1;
    if (fieldType == LuaType.luaFunction) {
      onTapDownId = ls.ref(lua_registryindex);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onDoubleTap");
    int onDoubleTapId = -1;
    if (fieldType == LuaType.luaFunction) {
      onDoubleTapId = ls.ref(lua_registryindex);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onTapCancel");
    int onTapCancelId = -1;
    if (fieldType == LuaType.luaFunction) {
      onTapCancelId = ls.ref(lua_registryindex);
    }
    ls.pop(1);

    ls.newUserdata().data = DataCell(
      child,
      placeholder: placeholder,
      showEditIcon: showEditIcon,
      onTap: onTapId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onTapId);
              ls.pCall(0, 0, 1);
            }
          : null,
      onDoubleTap: onDoubleTapId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onDoubleTapId);
              ls.pCall(0, 0, 1);
            }
          : null,
      onLongPress: onLongPressId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onLongPressId);
              ls.pCall(0, 0, 1);
            }
          : null,
      onTapDown: onTapDownId != -1
          ? (detail) {
              ls.rawGetI(lua_registryindex, onTapDownId);
              LuaTable tb1 = LuaTable(0, 2);
              tb1.put("dx", detail.globalPosition.dx);
              tb1.put("dy", detail.globalPosition.dy);
              LuaTable tb2 = LuaTable(0, 2);
              tb2.put("dx", detail.localPosition.dx);
              tb2.put("dy", detail.localPosition.dy);
              ls.createValuesTable(
                  {'globalPosition': tb1, 'localPosition': tb2});
              ls.pCall(1, 0, 1);
            }
          : null,
      onTapCancel: onTapCancelId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onTapDownId);
              ls.pCall(0, 0, 1);
            }
          : null,
    );
    return 1;
  }

  static int _openDataCellLib(LuaState ls) {
    ls.newMetatable('DataCellClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_DataCellMembers, 0);
    ls.newLib(_DataCellWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('DataCell', _openDataCellLib, true);
    ls.pop(1);
  }
}

class FlutterDataRow {
  static const Map<String, DartFunction> _DataRowWrap = {
    'new': _newDataRowWrap,
  };

  static const Map<String, DartFunction> _DataRowMembers = {'id': null};

  static int _newDataRowWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "key");
    ValueKey key;
    if (fieldType == LuaType.luaUserdata) {
      key = ls.toUserdata(-1).data as ValueKey;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "selected");
    bool selected = false;
    if (fieldType == LuaType.luaBoolean) {
      selected = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onSelectChanged");
    int onSelectChangedId = -1;
    if (fieldType == LuaType.luaFunction) {
      onSelectChangedId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "onLongPress");
    int onLongPressId = -1;
    if (fieldType == LuaType.luaFunction) {
      onLongPressId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "color");
    Color color;
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "cells");
    List<DataCell> cells = List.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          cells.add(ls.toUserdata(-1).data as DataCell);
        }
        ls.pop(1);
      }
    } else {
      throw ParameterError(
        name: "",
        type: "",
        expected: "",
        source: "FlutterDataRow cells is null",
      );
    }
    ls.pop(1);

    ls.newUserdata().data = DataRow(
      key: key,
      selected: selected,
      onSelectChanged: onSelectChangedId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onSelectChangedId);
              ls.pushBoolean(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      onLongPress: onLongPressId != -1
          ? () {
              ls.rawGetI(lua_registryindex, onLongPressId);
              ls.pCall(0, 0, 1);
            }
          : null,
      color: MaterialStateProperty.all(color),
      cells: cells,
    );
    return 1;
  }

  static int _openDataRowLib(LuaState ls) {
    ls.newMetatable('DataRowClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_DataRowMembers, 0);
    ls.newLib(_DataRowWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('DataRow', _openDataRowLib, true);
    ls.pop(1);
  }
}

class FlutterTableBorder {
  static const Map<String, DartFunction> _TableBorderWrap = {
    'new': _newTableBorderWrap,
    'all': _allTableBorderWrap,
  };

  static const Map<String, DartFunction> _TableBorderMembers = {'id': null};

  static int _allTableBorderWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "color");
    var color = const Color(0xFF000000);
    if (fieldType == LuaType.luaUserdata) {
      color = ls.toUserdata(-1).data as Color;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "width");
    double width = 1;
    if (fieldType == LuaType.luaNumber) {
      width = ls.toNumberX(-1);
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "width");
    BorderStyle style = BorderStyle.solid;
    if (fieldType == LuaType.luaUserdata) {
      style = ls.toUserdata(-1).data as BorderStyle;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "borderRadius");
    BorderRadius borderRadius = BorderRadius.zero;
    if (fieldType == LuaType.luaUserdata) {
      borderRadius = ls.toUserdata(-1).data as BorderRadius;
      ls.pop(1);
    } else {
      ls.pop(1);
    }
    ls.newUserdata().data = TableBorder.all(
      color: color,
      width: width,
      style: style,
      borderRadius: borderRadius,
    );
    return 1;
  }

  static int _newTableBorderWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "top");
    var top = BorderSide.none;
    if (fieldType == LuaType.luaUserdata) {
      top = ls.toUserdata(-1).data as BorderSide;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "right");
    var right = BorderSide.none;
    if (fieldType == LuaType.luaUserdata) {
      right = ls.toUserdata(-1).data as BorderSide;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "bottom");
    var bottom = BorderSide.none;
    if (fieldType == LuaType.luaUserdata) {
      bottom = ls.toUserdata(-1).data as BorderSide;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "left");
    var left = BorderSide.none;
    if (fieldType == LuaType.luaUserdata) {
      left = ls.toUserdata(-1).data as BorderSide;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "horizontalInside");
    var horizontalInside = BorderSide.none;
    if (fieldType == LuaType.luaUserdata) {
      horizontalInside = ls.toUserdata(-1).data as BorderSide;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "verticalInside");
    var verticalInside = BorderSide.none;
    if (fieldType == LuaType.luaUserdata) {
      verticalInside = ls.toUserdata(-1).data as BorderSide;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "borderRadius");
    var borderRadius = BorderRadius.zero;
    if (fieldType == LuaType.luaUserdata) {
      borderRadius = ls.toUserdata(-1).data as BorderRadius;
      ls.pop(1);
    } else {
      ls.pop(1);
    }

    ls.newUserdata().data = TableBorder(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      horizontalInside: horizontalInside,
      verticalInside: verticalInside,
      borderRadius: borderRadius,
    );
    return 1;
  }

  static int _openTableBorderLib(LuaState ls) {
    ls.newMetatable('TableBorderClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_TableBorderMembers, 0);
    ls.newLib(_TableBorderWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('TableBorder', _openTableBorderLib, true);
    ls.pop(1);
  }
}

class FlutterDataTable {
  static const Map<String, DartFunction> _DataTableWrap = {
    'new': _newDataTableWrap,
  };

  static const Map<String, DartFunction> _DataTableMembers = {'id': null};

  static int _newDataTableWrap(LuaState ls) {
    var fieldType = ls.getField(-1, "columns");
    List<DataColumn> columns = List.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          columns.add(ls.toUserdata(-1).data as DataColumn);
        }
        ls.pop(1);
      }
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterDataTable columns is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "rows");
    List<DataRow> rows = List.empty(growable: true);
    if (fieldType == LuaType.luaTable) {
      var len = ls.len2(-1);
      for (int i = 1; i <= len; i++) {
        if (ls.rawGetI(-1, i) == LuaType.luaUserdata) {
          rows.add(ls.toUserdata(-1).data as DataRow);
        }
        ls.pop(1);
      }
    } else {
      throw ParameterError(
          name: "",
          type: "",
          expected: "",
          source: "FlutterDataTable rows is null");
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "sortColumnIndex");
    int sortColumnIndex;
    if (fieldType == LuaType.luaNumber) {
      sortColumnIndex = ls.toIntegerX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "sortAscending");
    bool sortAscending = false;
    if (fieldType == LuaType.luaBoolean) {
      sortAscending = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "onSelectAll");
    int onSelectAllId = -1;
    if (fieldType == LuaType.luaFunction) {
      onSelectAllId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    fieldType = ls.getField(-1, "decoration");
    var decoration;
    if (fieldType == LuaType.luaUserdata) {
      decoration = ls.toUserdata(-1).data as BoxDecoration;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dataRowColor");
    Color dataRowColor;
    if (fieldType == LuaType.luaUserdata) {
      dataRowColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dataRowHeight");
    double dataRowHeight;
    if (fieldType == LuaType.luaNumber) {
      dataRowHeight = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dataTextStyle");
    var dataTextStyle;
    if (fieldType == LuaType.luaUserdata) {
      dataTextStyle = ls.toUserdata(-1).data as TextStyle;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "headingRowColor");
    Color headingRowColor;
    if (fieldType == LuaType.luaUserdata) {
      headingRowColor = ls.toUserdata(-1).data as Color;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "headingRowHeight");
    double headingRowHeight;
    if (fieldType == LuaType.luaNumber) {
      headingRowHeight = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "headingTextStyle");
    var headingTextStyle;
    if (fieldType == LuaType.luaUserdata) {
      headingTextStyle = ls.toUserdata(-1).data as TextStyle;
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "horizontalMargin");
    var horizontalMargin;
    if (fieldType == LuaType.luaNumber) {
      horizontalMargin = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "columnSpacing");
    var columnSpacing;
    if (fieldType == LuaType.luaBoolean) {
      columnSpacing = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "showCheckboxColumn");
    var showCheckboxColumn = true;
    if (fieldType == LuaType.luaBoolean) {
      showCheckboxColumn = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "showBottomBorder");
    var showBottomBorder = false;
    if (fieldType == LuaType.luaBoolean) {
      showBottomBorder = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "dividerThickness");
    var dividerThickness;
    if (fieldType == LuaType.luaNumber) {
      dividerThickness = ls.toNumberX(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "checkboxHorizontalMargin");
    var checkboxHorizontalMargin;
    if (fieldType == LuaType.luaBoolean) {
      checkboxHorizontalMargin = ls.toBoolean(-1);
    }
    ls.pop(1);

    fieldType = ls.getField(-1, "border");
    var border;
    if (fieldType == LuaType.luaUserdata) {
      border = ls.toUserdata(-1).data as TableBorder;
    }
    ls.pop(1);

    ls.newUserdata().data = DataTable(
      columns: columns,
      rows: rows,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      onSelectAll: onSelectAllId != -1
          ? (value) {
              ls.rawGetI(lua_registryindex, onSelectAllId);
              ls.pushBoolean(value);
              ls.pCall(1, 0, 1);
            }
          : null,
      decoration: decoration,
      dataRowColor:
          dataRowColor != null ? MaterialStateProperty.all(dataRowColor) : null,
      dataRowHeight: dataRowHeight,
      dataTextStyle: dataTextStyle,
      headingRowColor: headingRowColor != null
          ? MaterialStateProperty.all(headingRowColor)
          : null,
      headingRowHeight: headingRowHeight,
      headingTextStyle: headingTextStyle,
      horizontalMargin: horizontalMargin,
      columnSpacing: columnSpacing,
      showCheckboxColumn: showCheckboxColumn,
      showBottomBorder: showBottomBorder,
      dividerThickness: dividerThickness,
      checkboxHorizontalMargin: checkboxHorizontalMargin,
      border: border,
    );
    return 1;
  }

  static int _openDataTableLib(LuaState ls) {
    ls.newMetatable('DataTableClass');
    ls.pushValue(-1);
    ls.setField(-2, '__index');
    ls.setFuncs(_DataTableMembers, 0);
    ls.newLib(_DataTableWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF('DataTable', _openDataTableLib, true);
    ls.pop(1);
  }
}
