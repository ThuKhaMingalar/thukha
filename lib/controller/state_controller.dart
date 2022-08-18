import 'package:get/get.dart';

class StateController extends GetxController {
  var bNBIndex = 0.obs;

  void changeBNBIndex(int value) => bNBIndex.value = value;
}