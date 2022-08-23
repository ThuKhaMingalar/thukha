import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:thukha/utils/widgets/show_loading/show_loading.dart';

import '../../../controller/data_controller.dart';
import '../../../model/item.dart';
import '../model/item_stock_datasource.dart';

class ManageStockController extends GetxController {
  final DataController _dataController = Get.find();
   final DataGridController dataGridController = DataGridController();
   late ItemStockDataSource itemStockDataSource;

   @override
  void onInit() {
     itemStockDataSource = ItemStockDataSource(
      items: _dataController.itemList,
      dataGridController: dataGridController,
    );
    super.onInit();
  }

  Future<void> addItem(Item item) async{
    await Future.delayed(Duration.zero,(){
      itemStockDataSource.items.add(item);
      itemStockDataSource.handleRefresh();
    });
  }
}