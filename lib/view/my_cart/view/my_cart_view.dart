import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thukha/constant/mock.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/utils/widgets/show_thankyou_dialog/show_thankyou.dart';
import 'package:thukha/view/my_cart/controller/my_cart_controller.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    final MyCartController myCartController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body:dataController.cartMap.isNotEmpty ? ListView(
        shrinkWrap: true,
        children: dataController.cartMap.entries
        .map((e) => CardItem(item: e.value)).toList(),
      ) : Center(
        child: Text(
          "Cart is empty!",
          style: Theme.of(context).textTheme.headline2,
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 35,
        width: 100,
        child: FloatingActionButton(
          onPressed: (){
            myCartController.uploadOrder();
          }, 
          child: Text("Order Now",
          style: Theme.of(context).textTheme
          .bodyText2
          ?.copyWith(color: Colors.white),),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final  item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Count
            CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.shade300,
                child: Text(
                  item.count.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            const SizedBox(width: 25,),
            //Name
            Expanded(child: Text(item.name,)),
            
          ],
        ),
      ),
    );
  }
}