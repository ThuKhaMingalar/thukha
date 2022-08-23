import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/model/item.dart';
import 'package:thukha/utils/widgets/show_loading/show_loading.dart';
import 'package:thukha/view/manange_stock_table/controller/manage_stock_controller.dart';
import 'package:uuid/uuid.dart';

class STFDController extends GetxController{
  final DataController _dataController = Get.find();
  final ManageStockController _manageStockController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController inHandController = TextEditingController();
  var expirationDate = DateTime.now().obs;

  DateTime changeDateTime() {
    var list = dateTimeController.text.split("-");
    int year = int.parse(list[0]);
    int month = int.parse(list[1]);
    int day = int.parse(list[2]);
    return DateTime(year,month,day);
  }
  String? validate(String? value) => !(value == null) && value.isNotEmpty ? null : "require";

  void refresh() {
    nameController.clear();
    codeController.clear();
    costController.clear();
    dateTimeController.clear();
    inHandController.clear();
  }

  Future<void> addItemIntoList() async{
    showLoading();
    await _manageStockController.addItem(
      Item(
        id: Uuid().v1(), 
        name: nameController.text, 
        count: 0,
        dateTime: DateTime.now(), 
        unitCost: int.parse(costController.text) ,
        inHand: int.parse(inHandController.text), 
        code: codeController.text, 
        expirationDate: changeDateTime(),
      )
    );
    refresh();
    hideLoading();
  }
}