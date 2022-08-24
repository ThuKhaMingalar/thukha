import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/controller/auth_controller.dart';
import 'package:thukha/model/absence_report.dart';
import 'package:thukha/model/item.dart';
import 'package:thukha/model/order.dart';
import 'package:thukha/model/shop.dart';
import 'package:thukha/service/api.dart';
import 'package:thukha/utils/widgets/show_loading/show_loading.dart';
import 'package:uuid/uuid.dart';

import '../constant/mock.dart';
import '../utils/widgets/show_accept_dialog/show_accept_dialog.dart';

class DataController extends GetxController {
  final firebaseFirestore = FirebaseFirestore.instance;
  final AuthController authController = Get.find();
  RxList<Item> itemList = <Item>[].obs;
    Item? selectedItem;

  /**
   * For Absentee View Form 
   */
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController absenceTypeController = TextEditingController();
  TextEditingController rNameController = TextEditingController();

  void clearAbsenceForm(){
    nameController.clear();
    positionController.clear();
    dateController.clear();
    absenceTypeController.clear();
    rNameController.clear();
  }

  Future<void> reportAbsenteeForm() async{
    showLoading();
    try {
      final item = AbsenceReport(
      id: Uuid().v1(), 
      name: nameController.text, 
      position: positionController.text, 
      absenceDate: dateController.text, 
      absenceType: absenceTypeController.text, 
      rName: rNameController.text, 
      dateTime: DateTime.now(), 
      ownerID: authController.currentShop.value!.id,/**TODO To institude real shop's id */
    );
    await firebaseFirestore.collection(absenteeCollection)
    .doc(item.id)
    .set(
      item.toJson()
    );
    hideLoading();
    clearAbsenceForm();
    } catch (e) {
      
    }
  }
  /**
   * End
   */

  /**
   * Absentee View For ADmin
   */
  Rxn<Shop> selectedShop = Rxn<Shop>();
  RxList<AbsenceReport> absenteeList = <AbsenceReport>[].obs;
  void changeSelectedShop(Shop? shop){
    if(!(shop == null)){
      selectedShop.value = shop;
    }
  }

  void listenAbsentee(){
    firebaseFirestore.collection(absenteeCollection)
    .snapshots()
    .listen((event) {
      absenteeList.value = event.docs.map((e) => AbsenceReport.fromJson(
        e.data()
      )).toList();
    });
  }
  /**End */

  /**For Admin HomeView */
  RxList<Order> orderListFromAllShop = <Order>[].obs;
  RxList<Shop> allShopList = <Shop>[].obs;
  void listenOrderFromAllShop(){
    firebaseFirestore.collection(orderCollection)
    .orderBy("dateTime", descending: true)
    .snapshots()
    .listen((event) {
      orderListFromAllShop.value = event.docs
      .map((e) => Order.fromJson(e.data())).toList();
    });
  }
  
  void listenAllShop(){
    firebaseFirestore.collection(userCollection)
    .where("id", isNotEqualTo: authController.currentShop.value!.id)
    .snapshots()
    .listen((event) {
      allShopList.value = event.docs.map((e) => Shop.fromJson(e.data()))
      .toList();
      selectedShop.value = allShopList.first;
    });
    
  }

  /**End */
  
  /**
   * For User Home View And Order View
   */
  void listenAllItems(){
    firebaseFirestore.collection(itemCollection)
    .orderBy("name")
    .snapshots()
    .listen((event) {
      itemList.value = event.docs.map((e) => Item.fromJson(e.data()))
      .toList();
    });
  }
  Map<String,Item> cartMap = <String,Item>{};
  void increase(Item value){
    if(cartMap.containsKey(value.id)){ //IF Already Contain,just need to increase
       var item = cartMap[value.id]!;
       cartMap[value.id] = item.copyWith(
        count: item.count + 1,
       );
    } else{ //OR
      cartMap.putIfAbsent(value.id, () => value.copyWith(count: 1));
    }
    update();
  }
  void reduce(Item value){
    if(cartMap.containsKey(value.id)){
      var item = cartMap[value.id]!;
      if(item.count > 0){
        cartMap[value.id] = item.copyWith(
          count: item.count -1,
        );
      }else{
        cartMap.remove(value.id);
      }
    }
    update();
  }
  void clearCartMap(){
    cartMap.clear();
    update();
  }
  /**
   * END
  */

  /**FOR USER HISTORY VIEW */
  RxList<Order> orderList = <Order>[].obs;

  void listenOrder(){
    firebaseFirestore.collection(orderCollection)
    .orderBy("dateTime", descending: true)
    .where("ownerID", isEqualTo: authController.currentShop.value!.id)
    .snapshots()
    .listen((event) {
      orderList.value = event.docs.map((e) => Order.fromJson(e.data()))
      .toList();
      debugPrint("*****Current User's OrderList: ${orderList.length}");
    });
  }
  /**End */

  /**
   * For Order Detail View
   */
  Rxn<Shop> selectedShopForOrderDetail = Rxn<Shop>();

  void setSelectedShopForOrderDetail(Shop shop) => 
  selectedShopForOrderDetail.value = shop;

  Future<List<Order>> getPendingOrders() async{
    await Future.delayed(const Duration(milliseconds: 300));
    return orderListFromAllShop.where((order) => 
    order.status == 0 && order.ownerID == selectedShopForOrderDetail
    .value!.id).toList();
  }
  Future<List<Order>> getDeliveringOrders() async{
    await Future.delayed(const Duration(milliseconds: 300));
    return orderListFromAllShop.where((order) => 
    order.status == 1 && order.ownerID == selectedShopForOrderDetail
    .value!.id).toList();
  }
  Future<List<Order>> getDeliveredOrders() async{
    await Future.delayed(const Duration(milliseconds: 300));
    return orderListFromAllShop.where((order) => 
    order.status == 2 && order.ownerID == selectedShopForOrderDetail
    .value!.id).toList();
  }

  Future<void> confirmOrder(String id,int status,String ownerID,
  String? minutes) async{
    showLoading();
    try{
      await firebaseFirestore.collection(orderCollection)
      .doc(id)
      .update({
        "status": status,
      });
      await Api.sendPushToUser(
      status == 2 ? "Order ‌ရောက်ရှိကြောင်း" :  "$minutesမိနစ်အတွင်း ရောက်ရှိပါမည်", 
      status == 2 ? "အသိပေးပါသည်":"Admin ထံမှ", 
      ownerID);
      hideLoading();
      Get.back();
    }on FirebaseException catch(e){
      hideLoading();
      Get.snackbar("Fail!","$e");
      debugPrint("*****Fail,$e");
    }
  }
  /**End */
  void setSelectedItem(Item item){
    selectedItem = item;
    debugPrint("****SELECTED ITEM: ${item.code}");
  }

  @override
  void onInit() {
    listenAllItems();
    listenOrder();
    listenAllShop();
    listenOrderFromAllShop();
    listenAbsentee();
    super.onInit();
  }
  
  Future<void> insertIntoItemList() async{
    for (var i = 0; i < mockDrugNameList.length; i++) {
      final item = Item(
          id: Uuid().v1(), 
          name: mockDrugNameList[i], 
          count: 0, 
          dateTime: DateTime.now(), 
          unitCost: mockCostList[i], 
          inHand: mockInHandList[i], 
          code: mockCodeList[i], 
          expirationDate: mockExpirationDateList[i],
        );
      await firebaseFirestore.collection(itemCollection)
      .doc(item.id)
      .set(item.toJson());
    }
  }
}