import 'package:flutter/material.dart';
import 'package:thukha/constant/mock.dart';
import 'package:thukha/utils/widgets/show_thankyou_dialog/show_thankyou.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: ListView.builder(
        itemCount: mockOrderList[0].itemsList.length,
        itemBuilder: (context,index){
          final item = mockOrderList[0].itemsList[index];
          return CardItem(item: item);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 35,
        width: 100,
        child: FloatingActionButton(
          onPressed: (){
            showThankYou(context);
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
                  item.count,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            const SizedBox(width: 25,),
            //Name
            Text(item.name),
            
          ],
        ),
      ),
    );
  }
}