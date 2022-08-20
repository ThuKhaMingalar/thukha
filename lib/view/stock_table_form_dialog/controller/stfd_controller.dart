import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thukha/controller/data_controller.dart';

class STFDController extends GetxController{
  final DataController _dataController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController inHandController = TextEditingController();
  var expirationDate = DateTime.now().obs;

  void setExpirationDate(DateTime date) => expirationDate.value = date;
  String? validate(String? value) => !(value == null) && value.isNotEmpty ? null : "require";
}