import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/utils/widgets/show_loading/show_loading.dart';

import '../../../controller/data_controller.dart';
import '../../../model/item.dart';
import '../model/item_stock_datasource.dart';

class ManageStockController extends GetxController {
  final DataController _dataController = Get.find();
  final firebaseFirestore = FirebaseFirestore.instance;
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
    try {
      await firebaseFirestore.collection(itemCollection)
    .doc(item.id)
    .set(item.toJson());
      itemStockDataSource.items.add(item);
      itemStockDataSource.handleRefresh();
    } catch (e) {
      Get.snackbar("Fail!", "$e");
    }
  }

  Future<void> deleteItem(int rowIndex) async{
    try {
      await firebaseFirestore.collection(itemCollection)
    .doc(_dataController.itemList[rowIndex].id)
    .delete();
    itemStockDataSource.dataGridRows.removeAt(rowIndex);
     itemStockDataSource.updateDataGridSource();
    } catch (e) {
      Get.snackbar("Fail!", "$e");
    }
  }
 

 //Update Name
  Future<void> updateName({
    required String itemID,
    required String value,
  }) async{
    await firebaseFirestore.collection(itemCollection)
    .doc(itemID)
    .update({
      "name": value,
    });
  }

  //Update ExpirationDate
  Future<void> updateExpirationDate({
    required String itemID,
    required String value,
  }) async{
    await firebaseFirestore.collection(itemCollection)
    .doc(itemID)
    .update({
      "expirationDate": value,
    });
  }

  //Update UnitCost
  Future<void> updateUnitCost({
    required String itemID,
    required int value,
  }) async{
    await firebaseFirestore.collection(itemCollection)
    .doc(itemID)
    .update({
      "unitCost": value,
    });
  }
  
  //Update InHand
  Future<void> updateInHand({
    required String itemID,
    required int value,
  }) async{
    await firebaseFirestore.collection(itemCollection)
    .doc(itemID)
    .update({
      "inHand": value,
    });
  }

  //Update Code
  Future<void> updateCode({
    required String itemID,
    required String value,
  }) async{
    await firebaseFirestore.collection(itemCollection)
    .doc(itemID)
    .update({
      "code": value,
    });
  }
}