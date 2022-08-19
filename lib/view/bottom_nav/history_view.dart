import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thukha/constant/mock.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: mockOrderList.map((e) {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Name
                        Text("Name: ${item.name}"),
                        //Count
                        Text("Count: ${item.count}"),
                        //DateTime
                        Text(
                            DateFormat.yMMMMEEEEd().format(
                              DateTime.now()
                            ),
                          style: Theme.of(context).textTheme
                          .subtitle1,
                        ),
                      ],
                    ),
                    //Status
                    Container(
                      color: Colors.black,
                      child:  Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "delivered",
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
}
