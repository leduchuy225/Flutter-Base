import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../core/utils/utils.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

class OneDataTableDataCell {
  final dynamic data;
  final Widget Function()? buildChild;

  OneDataTableDataCell({this.data, this.buildChild});

  int compareTo(OneDataTableDataCell other) {
    if (data is num && other.data is num) {
      return (data as num).compareTo(other.data);
    }
    return data.toString().compareTo(other.data.toString());
  }
}

class OneDataTableColumn {
  final bool numeric;
  final String? title;
  final Widget? label;
  final ColumnSize size;

  OneDataTableColumn({
    this.label,
    this.title,
    this.numeric = false,
    this.size = ColumnSize.M,
  });
}

class OneDataTable2 extends StatefulWidget {
  final double smRatio;
  final double lmRatio;
  final double? dataRowHeight;
  final List<OneDataTableColumn> columns;
  final List<List<OneDataTableDataCell>> data;
  // final List<Widget Function(OneDataTableDataCell)?>? buildCells;

  const OneDataTable2({
    Key? key,
    this.lmRatio = 1.2,
    this.smRatio = 0.67,
    // this.buildCells,
    this.dataRowHeight,
    required this.data,
    required this.columns,
  }) : super(key: key);

  @override
  State<OneDataTable2> createState() => _OneDataTable2State();
}

class _OneDataTable2State extends State<OneDataTable2> {
  int? sortColumnIndex;
  bool sortAscending = false;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      // Custom
      lmRatio: widget.lmRatio,
      smRatio: widget.smRatio,
      dataRowHeight: widget.dataRowHeight,
      // State
      sortAscending: sortAscending,
      sortColumnIndex: sortColumnIndex,
      // Default
      bottomMargin: 16,
      columnSpacing: 0,
      horizontalMargin: 12,
      showBottomBorder: true,
      sortArrowAnimationDuration: Duration.zero,
      // empty: Center(child: OneStatePage.empty()),
      // headingRowColor: MaterialStateProperty.resolveWith(
      //   (states) => OneColors.bgRandom1,
      // ),
      rows: widget.data.map((eParent) {
        final List<DataCell> cells = [];
        eParent.asMap().forEach((index, e) {
          cells.add(
            DataCell(
              e.buildChild != null ? e.buildChild!() : Text(e.data.toString()),
            ),
          );
        });
        return DataRow(cells: cells);
      }).toList(),
      columns: widget.columns.mapIndexed((e, index) {
        return DataColumn2(
          size: e.size,
          numeric:
              e.numeric ||
              isNumeric(getAtIndex(getAtIndex(widget.data, 0), index)?.data),
          label: e.title != null
              ? Text(e.title ?? '', softWrap: true, textAlign: TextAlign.center)
              : e.label!,
          onSort: (columnIndex, ascending) {
            setState(() {
              sortAscending = ascending;
              sortColumnIndex = columnIndex;
              if (columnIndex != index) {
                return;
              }
              if (ascending) {
                widget.data.sort((a, b) {
                  return a[index].compareTo(b[index]);
                });
                return;
              }
              widget.data.sort((a, b) {
                return b[index].compareTo(a[index]);
              });
            });
          },
        );
      }).toList(),
    );
  }
}
