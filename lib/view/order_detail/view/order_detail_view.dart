import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:thukha/model/order.dart';

import '../../../utils/widgets/show_accept_dialog/show_accept_dialog.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  final title = Get.arguments[0] as String;
  final orderList = Get.arguments[1] as List<Order>;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: Text("$title's Orders"),
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
            OrderPendingList(orderList: orderList),
            //Delivering
            OrderPendingList(orderList: orderList),
            //Delivered
            OrderPendingList(orderList: orderList),
          ],
          ),
      ),
      );
  }
}

class OrderPendingList extends StatelessWidget {
  const OrderPendingList({
    Key? key,
    required this.orderList,
  }) : super(key: key);

  final List<Order> orderList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: orderList.map((e) {
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
                    //Count
                    CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey.shade300,
                        child: Text(
                          item.count,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    //Name
                    Text(item.name),
                    //Status
                    Row(
                      children:[
                        //Cancel
                        IconButton(
                          onPressed: (){
                            //TODO
                          }, 
                          icon: Icon(FontAwesomeIcons.circleXmark),
                          ),
                        //Confirm
                        IconButton(
                          onPressed: (){
                            showAcceptDialog(context);
                          }, 
                          icon: Icon(FontAwesomeIcons.circleCheck),
                          ),
                      ]
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
}