import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:thukha/model/item.dart';
import 'package:thukha/view/manange_stock_table/controller/manage_stock_controller.dart';
import '../../../controller/data_controller.dart';
import '../../stock_table_form_dialog/view/stfd_view.dart';
import '../model/item_stock_datasource.dart';

class ManageStockTable extends StatefulWidget {
  const ManageStockTable({Key? key}) : super(key: key);

  @override
  State<ManageStockTable> createState() => _ManageStockTableState();
}

class _ManageStockTableState extends State<ManageStockTable> {

  final ManageStockController _controller = Get.find();
  final DataController _dataController = Get.find();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("ThuKha Mingalar")
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
          "Stock Table",
          style: Theme.of(context).textTheme
          .headline3,
          ),
          IconButton(
            onPressed: () => Get.to(() => const STFDView()),
            /* onPressed: () => Get.dialog(
              const Center(child: STFDView()),
              barrierColor: Colors.white.withOpacity(0),
              ),  */
            icon: const Icon(FontAwesomeIcons.circlePlus),
          ),
          ],
        ),
        Expanded(
          child:  Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              )
            ),
            child: SfDataGridTheme(
              data:
                  SfDataGridThemeData(
                    selectionColor: Colors.black,
                    sortIcon: const Icon(
                    FontAwesomeIcons.caretDown
                  )),
                child: SfDataGrid(
                  allowEditing: true,
                  allowPullToRefresh: true,
                  controller: _controller.dataGridController,
                  source: _controller.itemStockDataSource,
                  allowSorting: true,
                  selectionMode: SelectionMode.single,
                  navigationMode: GridNavigationMode.cell,
                  allowSwiping: true,
                  swipeMaxOffset: 100.0,
                   onSelectionChanged:
                  (List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
                    final index = _controller.itemStockDataSource.dataGridRows.indexOf(addedRows.last);
                    Item item = _dataController.itemList[index];
                    _dataController.setSelectedItem(item);    
                  },
                  startSwipeActionsBuilder: (BuildContext context, DataGridRow row, int rowIndex) {
                          return GestureDetector(
                              onTap: () {
                                _controller.deleteItem(rowIndex);
                              },
                              child: Container(
                                  color: Colors.redAccent,
                                  child: const Center(
                                    child: Icon(Icons.delete),
                                  )));
                  },
                  columns: [
                    GridColumn(
                        columnName: 'name',
                        width: 200,
                        label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Name',
                              overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                        columnName: 'code',
                        label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Code',
                              overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                        columnName: 'expirationDate',
                        width: 150,
                        label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Expiration Date',
                              overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                        columnName: 'inHand',
                        label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'In Hand',
                              overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                        columnName: 'unitCost',
                        label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Unit Cost',
                              overflow: TextOverflow.ellipsis,
                            ))),
                  ],
                ),
              ),
          ),
          ),
      ],
    ),
  );
  }
}