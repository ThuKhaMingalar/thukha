import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:thukha/constant/mock.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/model/shop.dart';

import '../../../utils/routes/route_url.dart';

class AbsenteeView extends StatelessWidget {
  const AbsenteeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    return Column(
      children: [
        //DropDown Shop
        Obx(
          () {
            return DropdownButton<Shop>(
      value: dataController.selectedShop.value,
      icon: const Icon(FontAwesomeIcons.caretDown),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
            height: 2,
            color: Colors.black,
      ),
      onChanged: (Shop? newValue) {
            dataController.changeSelectedShop(newValue);
      },
      items: dataController.allShopList
              .map<DropdownMenuItem<Shop>>((Shop value) {
            return DropdownMenuItem<Shop>(
              value: value,
              child: Text(value.name),
            );
      }).toList(),
    );
          }
        ),
        //ListView
        Expanded(
          child: Obx(
             () {
              final shopID = dataController.selectedShop.value?.id;
              final absenteeList = dataController.absenteeList;
              return ListView.builder(
                shrinkWrap: true,
                itemCount:  absenteeList.length,
                itemBuilder: (context,index){
                  final abReport = absenteeList[index];
                  if(shopID != abReport.ownerID){
                    return const SizedBox();
                  }
                  return InkWell(
                    onTap: (){
                      Get.toNamed(absenteeDetailScreen,
                      arguments: abReport);
                    },
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Name
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Name: ${abReport.name}"),
                            ),
                            //Absence Date
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(abReport.absenceDate),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          ),
        ),
      ],
    );
  }
}