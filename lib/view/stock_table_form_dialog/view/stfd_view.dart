import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thukha/view/stock_table_form_dialog/controller/stfd_controller.dart';

import '../../../controller/data_controller.dart';

class STFDView extends StatefulWidget {
  const STFDView({Key? key}) : super(key: key);

  @override
  State<STFDView> createState() => _STFDViewState();
}

class _STFDViewState extends State<STFDView> {
  @override
  void initState() {
    Get.put(STFDController());
    super.initState();
  }
  @override
  void dispose() {
    Get.delete<STFDController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final STFDController controller = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: SizedBox(
        width: size.width * 0.9,
        child:  Obx(
             () {
              return Form(
                key: controller.formkey,
                autovalidateMode: controller.isFirstTimePressed.value ?
                AutovalidateMode.onUserInteraction : null,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    //Name
                     ColumnForm(
                     controller: controller.nameController,
                     //label: "Name: ",
                     hintText: "Name",
                     stringKey: "stfdName",
                     error: "Name is required.",
                     height: 100,
                     padding: 0,
                     textFieldPaddingLeft: 5,
                     isUnderlineBorder: false,
                     ),
                    //Code
                    ColumnForm(controller: controller.codeController,
                     hintText: "Code (D0128)",
                     stringKey: "stfdCode",
                     error: "Code is required.",
                     padding: 0,
                     height: 100,
                     textFieldPaddingLeft: 5,
                     isUnderlineBorder: false,
                     ),
                    //Unit Cose
                    ColumnForm(controller: controller.costController,
                     hintText: "Unit Cost (2000)",
                     stringKey: "stfdCost",
                     error: "Unit Cost is required.",
                     padding: 0,
                     height: 100,
                     textFieldPaddingLeft: 5,
                     isUnderlineBorder: false,
                     ),
                     //In Hand
                    ColumnForm(controller: controller.inHandController,
                     hintText: "In Hand (30)",
                     stringKey: "stfdHand",
                     error: "In Hand is required.",
                     padding: 0,
                     height: 100,
                     textFieldPaddingLeft: 5,
                     isUnderlineBorder: false,
                     ),
                    //Expiration Date
                    ColumnForm(
                     controller: controller.dateTimeController,
                     hintText: "Expiration Date (2022-9-1)",
                     stringKey: "stfdDate",
                     error: "Expiration Date is required.",
                     padding: 0,
                     height: 100,
                     textFieldPaddingLeft: 5,
                     isUnderlineBorder: false,
                     
                     ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            }
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
      floatingActionButton: 
      ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              onPressed: (){
                                //TODO: SAVE TO DATABASE AND
                                //CALL REFRESH DATAGRID
                                controller.addItemIntoList();
                              }, 
                              child: SizedBox(
                                height: 50,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: Theme.of(context).textTheme
                                            .bodyText2?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),);
  }
}

class ColumnForm extends StatefulWidget {
  const ColumnForm({
    Key? key,
    required this.controller,
    this.label,
    required this.isUnderlineBorder,
    this.textFieldPaddingLeft,
    this.stringKey,
    this.height,
    this.validator,
    this.isLabel = true,
    this.padding = 25,
    this.hintText,
    this.error,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final bool isUnderlineBorder;
  final double? textFieldPaddingLeft;
  final double? height;
  final bool isLabel;
  final double padding;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? error;
  final String? stringKey;

  @override
  State<ColumnForm> createState() => _ColumnFormState();
}

class _ColumnFormState extends State<ColumnForm> {
  final DataController dataController = DataController();
  @override
  void initState() {
    dataController.assignFormForAbsentee(widget.stringKey ?? "", widget.error ?? "");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(left: 20,right: 10,top: 10),
       child: SizedBox(
        height: widget.height ?? 55,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             //Label
             widget.isLabel ? Text(
               widget.label ?? "",
               style: Theme.of(context).textTheme
               .bodyText1,
             ) : const SizedBox(),
             //TextField
             Expanded(
               child: Padding(
                   padding:  EdgeInsets.only(left: widget.padding),
                   child: TextFormField(
                     controller: widget.controller,
                     validator:dataController.inputMap[widget.stringKey]
                     ?.validator,
                     decoration: InputDecoration(
                      counter: null,
                      counterText: "",
                      labelText: widget.hintText,
                      labelStyle: const TextStyle(color: Colors.black,),
                      contentPadding:  EdgeInsets.only(
                        left: widget.textFieldPaddingLeft ?? 0
                      ),
                       border: widget.isUnderlineBorder ? 
                       const UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                         )
                       ) : const OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                       focusedBorder: widget.isUnderlineBorder ? 
                       const UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                         )
                       ) : const OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                     ),
                   ),
                 ),
             ),
           ],
         ),
       ),
     );
  }
}