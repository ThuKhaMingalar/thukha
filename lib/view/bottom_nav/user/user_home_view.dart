import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/data_controller.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DataController dataController = Get.find();
    return GetBuilder<DataController>(
       builder: (controller) {
        final cartMap = controller.cartMap;
        return ListView.builder(
          itemCount: dataController.itemList.length,
          itemBuilder: (context,index){
            final item = dataController.itemList[index];
            final isContain = cartMap.containsKey(item.id);
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
                        //Name
                       SizedBox(
                        width: size.width*0.5,
                        child:  Text(
                          item.name,
                          maxLines: 3,
                        ),
                       ),
                        //Raduce,Add count
                        Container(
                          decoration:  BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            )
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Minus
                                IconButton(
                                  onPressed: (){
                                    dataController.reduce(item);
                                  }, 
                                  icon: const Icon(
                                    FontAwesomeIcons.minus,
                                    size: 15,
                                  )
                                ),
                                //Count
                                Text(
                                  isContain ? cartMap[item.id]!.count.toString()
                                  : item.count.toString(),
                                  style: Theme.of(context).textTheme
                                  .bodyText2,
                                ),
                                //Plus
                                IconButton(
                                  onPressed: () => dataController.increase(
                                    item
                                  ), 
                                  icon: const Icon(
                                    FontAwesomeIcons.plus,
                                    size: 15,
                                    )
                                ),
                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                );
          },

          );
      }
    );
  }
}