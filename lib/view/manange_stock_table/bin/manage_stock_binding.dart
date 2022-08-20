import 'package:get/get.dart';
import 'package:thukha/view/manange_stock_table/controller/manage_stock_controller.dart';

class ManageStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManageStockController());
  }
  
}