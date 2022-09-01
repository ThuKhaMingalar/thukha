import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/model/order.dart';

import '../../../utils/widgets/show_accept_dialog/show_accept_dialog.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: Text("${dataController.selectedShopForOrderDetail
          .value?.name}'s Orders"),
          bottom: const TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                text: "pending",
              ),
              Tab(
                text: "delivering",
              ),
              Tab(
                text: "delivered",
              ),
            ],
            ),
        ),
        body: TabBarView(
          children: [
            //Pending
            OrderStatusList(
              future: dataController.getPendingOrders(),
              callBack: (){
                setState(() {
                });
              },
              ),
            //Delivering
            OrderStatusList(
              future: dataController.getDeliveringOrders(),
              callBack: (){
                setState(() {
                });
              },
            ),
            //Delivered
            OrderStatusList(
              future: dataController.getDeliveredOrders(),
              callBack: (){
                setState(() {
                });
              },
            ),
          ],
          ),
      ),
      );
  }
}

class OrderStatusList extends StatelessWidget {
  const OrderStatusList({
    Key? key,
    required this.future,
    required this.callBack,
  }) : super(key: key);

  final Future<List<Order>> future;
  final void Function() callBack;

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    return FutureBuilder<List<Order>>(
      future: future,
      builder: (context,snap) {
        if(snap.hasError){
          return ErrorWidget(snap.error.toString());
        }
        if(snap.hasData){
          final data = snap.data!;
          if(data.isNotEmpty){
            return ListView(
          children: data.map((e) {
            return Row(
              children: [
                Expanded(
                  child: ListView.builder(
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //Count
                              CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.grey.shade300,
                                  child: Text(
                                    "${item.count}",
                                    style: Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              const SizedBox(width: 20,),
                              //Name
                              Expanded(child: Text(item.name)),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),
                //Status
                Column(
                  children:[
                    //Cancel
                   e.status == 0 ? IconButton(
                      onPressed: (){
                        //TODO
                      }, 
                      icon: const Icon(FontAwesomeIcons.circleXmark),
                      ) : const SizedBox(),
                    //Confirm
                  e.status != 2 ?  IconButton(
                      onPressed: (){
                        if(e.status == 0){//For Delivering
                          showAcceptDialog(Get.context,e.id,e.ownerID,
                          callBack);
                        }
                        if(e.status == 1){
                          //For Delivered
                          dataController.confirmOrder(e.id, 2,e.ownerID,null);
                          callBack();
                        }
                      }, 
                      icon: const Icon(FontAwesomeIcons.circleCheck),
                      ) : const SizedBox(),
                  ]
                ),
              ],
            );
              }).toList(),
            );
          }else{
            return Center(
              child: Text(
                "No new order yet.",
                style: Theme.of(context).textTheme
                .headline2,
              ),
            );
          }
        }
        return const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}