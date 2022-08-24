import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/controller/auth_controller.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/model/order.dart';
import 'package:thukha/utils/widgets/show_loading/show_loading.dart';
import 'package:uuid/uuid.dart';

import '../../../service/api.dart';
import '../../../utils/widgets/show_thankyou_dialog/show_thankyou.dart';

class MyCartController extends GetxController{
  final firebaseFirestore = FirebaseFirestore.instance;
  final DataController dataController = Get.find();
  final AuthController authController = Get.find();

  Future<void> uploadOrder() async{
    showLoading();
    try {
      final order = Order(
        id: Uuid().v1(), 
        itemsList: dataController.cartMap.entries
        .map((e) => e.value).toList(), 
        ownerID: authController.currentShop.value!.id, 
        status: 0,
        dateTime: DateTime.now(),
      );
      await firebaseFirestore.collection(orderCollection)
      .doc(order.id)
      .set(order.toJson());
      await Api.sendPushToAdmin(
        "Order တင်ခြင်း",
        "From ${authController.currentShop.value!.name}",
      );
      hideLoading();
      showThankYou(Get.context);
      dataController.clearCartMap();
    } catch (e) {
      hideLoading();
      Get.snackbar("Fail!", "$e");
    }
  }
}