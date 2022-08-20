import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thukha/model/item.dart';
import 'package:uuid/uuid.dart';

import '../constant/mock.dart';

class DataController extends GetxController {
  RxList<Item> itemList = <Item>[].obs;
  Item? selectedItem;

  void setSelectedItem(Item item){
    selectedItem = item;
    debugPrint("****SELECTED ITEM: ${item.code}");
  }

  @override
  void onInit() {
    insertIntoItemList();
    super.onInit();
  }
  
  void insertIntoItemList() {
    for (var i = 0; i < mockDrugNameList.length; i++) {
      itemList.add(
        Item(
          id: Uuid().v1(), 
          name: mockDrugNameList[i], 
          count: 0, 
          dateTime: DateTime.now(), 
          unitCost: mockCostList[i], 
          inHand: mockInHandList[i], 
          code: mockCodeList[i], 
          expirationDate: mockExpirationDateList[i],
        )
      );
    }
  }
}