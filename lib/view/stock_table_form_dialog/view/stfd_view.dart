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
             label: "Name: ",),
            //Code
            ColumnForm(controller: controller.codeController,
             label: "Code: ",),
            //Unit Cose
            ColumnForm(controller: controller.codeController,
             label: "Unit Cost: ",),
            //Expiration Date
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
                        Get.back();
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
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(left: 20,right: 10,top: 10),
       child: SizedBox(
        height: 55,
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
                     decoration: const InputDecoration(
                      counter: null,
                      counterText: "",
                      contentPadding: EdgeInsets.all(0),
                       border: UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                         )
                       ),
                       focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                         )
                       )
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