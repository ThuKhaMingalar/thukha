import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:thukha/model/item.dart';
import 'package:thukha/utils/widgets/show_loading/show_loading.dart';
import 'package:thukha/view/manange_stock_table/controller/manage_stock_controller.dart';

String getDateString(DateTime time) => "${time.year}-${time.month}-${time.day}";

class ItemStockDataSource extends DataGridSource {
  ItemStockDataSource({required this.items,required 
   this.dataGridController}) {
    buildDataGridRows();
  }
  final DataGridController dataGridController;
  final List<Item> items;
  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    TextStyle? getSelectionTextStyle() {
      return dataGridController.selectedRow == row
          ? const TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w300,
              color: Colors.white,
            )
          : null;
    }
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
            style: getSelectionTextStyle(),
          ));
    }).toList());
  }

  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value ??
        '';

    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }

    /* updateDateIntoFirebase() async{
      showLoading();
      await Future.delayed(Duration.zero);
      await Future.delayed(const Duration(
        milliseconds: 100),
        () => Get.back()
        );
    } */
    final item = items[dataRowIndex];
    final ManageStockController stockController = Get.find();
    if (column.columnName == 'name') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'name', value: newCellValue);
      stockController.updateName(itemID: item.id, value: newCellValue.toString()).then((value) => {
        items[dataRowIndex] = items[dataRowIndex].copyWith(name: newCellValue.toString())
      });

    } else if (column.columnName == 'code') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'code', value: newCellValue);
          stockController.updateCode(itemID: item.id, 
          value: newCellValue.toString())
          .then((value) => items[dataRowIndex] = items[dataRowIndex].copyWith(code: newCellValue.toString()));
      
    } else if (column.columnName == 'expirationDate') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'expirationDate', value: newCellValue);
          var splitList = newCellValue.toString().split("-");
          final dateTime = DateTime(
          int.parse(splitList[0]),
          int.parse(splitList[1]),
          int.parse(splitList[2]),
          );
      stockController.updateExpirationDate(itemID: item.id, 
      value: dateTime.toString()).then((value) => items[dataRowIndex] = items[dataRowIndex].copyWith(
        expirationDate: dateTime,
      ));
    }  else if (column.columnName == 'inHand') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'inHand', value: newCellValue as int);
      stockController.updateInHand(itemID: item.id, value: newCellValue as int)
      .then((value) => items[dataRowIndex] = items[dataRowIndex].copyWith(
        inHand: newCellValue as int,
        ));
    }else {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'unitCost', value: newCellValue as int);
      stockController.updateUnitCost(itemID: item.id, 
      value: newCellValue as int)
      .then((value) => items[dataRowIndex] = items[dataRowIndex].copyWith(
        unitCost: newCellValue as int,
      ));
    }
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    final bool isNumericType =
        column.columnName == 'inHand' || column.columnName == 'unitCost';
        
    
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: isNumericType ? Alignment.centerRight : Alignment.centerLeft,
      child: TextField(
        autofocus: true,
        cursorColor: Colors.white,
        style: const TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
        controller: editingController..text = displayText,
        textAlign: isNumericType ? TextAlign.right : TextAlign.left,
        decoration: const InputDecoration(
          contentPadding:  EdgeInsets.fromLTRB(0, 0, 0, 16.0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white,)
          )
        ),
        keyboardType: isNumericType ? TextInputType.number : TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (isNumericType) {
              newCellValue = int.parse(value);
            } else {
              newCellValue = value;
            }
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          submitCell();
        },
      ),
    );
  }

   @override
  Future<void> handleRefresh() async {
    await Future.delayed(Duration.zero);
    buildDataGridRows();
    notifyListeners();
  }
  void updateDataGridSource() {
    notifyListeners();
  }
  
  void buildDataGridRows() {
    dataGridRows = items
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Name', value: dataGridRow.name),
              DataGridCell<String>(columnName: 'Code', value: dataGridRow.code),
              DataGridCell<String>(
                  columnName: 'Expiration Date', value: getDateString(dataGridRow.expirationDate)),
              DataGridCell<int>(
                  columnName: 'In Hand', value: dataGridRow.inHand),
              DataGridCell<int>(
                columnName: 'Unit Cost', value: dataGridRow.unitCost),
            ]))
        .toList();
  }
}