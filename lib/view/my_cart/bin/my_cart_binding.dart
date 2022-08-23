import 'package:get/get.dart';
import 'package:thukha/view/my_cart/controller/my_cart_controller.dart';

class MyCartBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MyCartController());
  }
}