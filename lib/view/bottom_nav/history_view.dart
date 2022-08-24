import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thukha/controller/auth_controller.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/utils/func/u_functions.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    final AuthController authController = Get.find();
    return Obx(
       () {
        final orders = dataController.orderListFromAllShop;
                                    final count = orders.where(
                                      (e) => e.ownerID == 
        authController.currentShop.value!.id
                                    ).toList();
        return ListView(
          children: count.map((e) {
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: e.itemsList.length,
              itemBuilder: (context,index){
                final item = e.itemsList[index];
                return Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Name
                              Text("Name: ${item.name}"),
                              //Count
                              Text("Count: ${item.count}"),
                              //DateTime
                              Text(
                                  DateFormat.yMMMMEEEEd().format(
                                    item.dateTime
                                  ),
                                style: Theme.of(context).textTheme
                                .subtitle1,
                              ),
                            ],
                          ),
                        ),
                        //Status
                        Container(
                          color: Colors.black,
                          child:  Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              getOrderStatus(e.status),
                              style: Theme.of(context).textTheme
                              .subtitle1?.copyWith(
                                color: Colors.white
                                ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              );
          }).toList(),
        );
      }
    );
  }
}
