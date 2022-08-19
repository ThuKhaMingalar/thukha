
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

showAcceptDialog(context){
  showDialog(
    barrierColor: Colors.white.withOpacity(0),
            context: context, 
            builder: (context){
              return const Center(
                child: TimeInputFormField(),
              );
            }
    );
}

class TimeInputFormField extends StatefulWidget {
  const TimeInputFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeInputFormField> createState() => _TimeInputFormFieldState();
}

class _TimeInputFormFieldState extends State<TimeInputFormField> {
  
  late FocusNode focusNode;
  bool isHasFocus = false;
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        if(mounted){
          setState(() {
            isHasFocus = true;
          });
        }
      }else{
        if(mounted){
          setState(() {
            isHasFocus = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.removeListener(() {});
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return   SizedBox(
      height: 180,
      width: size.width*0.6,
      child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            //DeliveryTime,
                            const Expanded(
                              child:  Text("Delivery time",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                ),),
                            ),
                            const SizedBox(height: 10),
                            //TextformField
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: Row(
                                children: [
                                  const Icon(FontAwesomeIcons.solidClock),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: TextFormField(
                                        controller: textController,
                                        enableSuggestions: false,
                                        maxLength: 2,
                                        maxLines: 1,
                                        onChanged: (value){
                                          if(value.isNotEmpty && value.length == 2){
                                             if(isHasFocus){
                                              focusNode.unfocus();
                                             }
                                          }
                                        },
                                        focusNode: focusNode,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 20,right: 10,),
                                          counter: null,
                                          counterText: "",
                                          hintText: "0",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          suffix: Text("မိနစ်",style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,fontWeight: FontWeight.bold,),),
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //Cancel
                                     Expanded(
                                       child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20)
                                              ),
                                            ),
                                          ),
                                          onPressed: (){
                                            Get.back();
                                          }, 
                                          child: SizedBox(
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "Cancel",
                                                style: Theme.of(context).textTheme
                                                        .bodyText2?.copyWith(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                     ),
                                    //
                                    const SizedBox(width: 2),
                                    //Save
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(20)
                                              ),
                                            ),
                                          ),
                                          onPressed: (){
                                                 Get.back();
                                                  }, 
                                                  child: SizedBox(
                                                    height: 50,
                                                    child: Center(
                                                      child: Text(
                                                        "Save",
                                                        style: Theme.of(context).textTheme
                                                        .bodyText2?.copyWith(color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                    ),
                                          ],
                                      ),
                          ],
                        ),
                     
                  ),
    );
  }
}
