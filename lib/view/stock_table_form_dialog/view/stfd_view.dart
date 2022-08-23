import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thukha/view/stock_table_form_dialog/controller/stfd_controller.dart';

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
    return SizedBox(
      width: size.width * 0.9,
      child: Card(
        child: ListView(
          shrinkWrap: true,
          children: [
            //Name
             ColumnForm(controller: controller.nameController,
             label: "Name: ",
             isUnderlineBorder: true,
             
             ),
            //Code
            ColumnForm(controller: controller.codeController,
             label: "Code: ",
             isUnderlineBorder: true,
             
             ),
            //Unit Cose
            ColumnForm(controller: controller.costController,
             label: "Unit Cost: ",
             isUnderlineBorder: true,
             
             ),
             //In Hand
            ColumnForm(controller: controller.inHandController,
             label: "In Hand: ",
             isUnderlineBorder: true,
             
             ),
            //Expiration Date
            ColumnForm(controller: controller.dateTimeController,
             label: "Expiration Date: ",
             isUnderlineBorder: true,
             
             ),
            const SizedBox(height: 10),
            //Save
            ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
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
                        width: size.width*0.65,
                        child: Center(
                          child: Text(
                            "Save",
                            style: Theme.of(context).textTheme
                                    .bodyText2?.copyWith(color: Colors.white),
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

class ColumnForm extends StatelessWidget {
  const ColumnForm({
    Key? key,
    required this.controller,
    required this.label,
    required this.isUnderlineBorder,
    this.textFieldPaddingLeft,
    this.height,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool isUnderlineBorder;
  final double? textFieldPaddingLeft;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(left: 20,right: 10,top: 10),
       child: SizedBox(
        height: height ?? 55,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             //Label
             Text(
               label,
               style: Theme.of(context).textTheme
               .bodyText1,
             ),
             //TextField
             Expanded(
               child: Padding(
                   padding: const EdgeInsets.only(left: 25),
                   child: TextFormField(
                     controller: controller,
                     decoration: InputDecoration(
                      counter: null,
                      counterText: "",
                      contentPadding:  EdgeInsets.only(
                        left: textFieldPaddingLeft ?? 0
                      ),
                       border: isUnderlineBorder ? 
                       const UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                         )
                       ) : const OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                       focusedBorder: isUnderlineBorder ? 
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