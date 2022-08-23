import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/view/stock_table_form_dialog/view/stfd_view.dart';

class UserAbsenteeView extends StatelessWidget {
  const UserAbsenteeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 15,),
        //Absentee Form Template
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Absentee Form Template",
            style: Theme.of(context).textTheme
            .headline3,
          ),
        ),
        //Name
        ColumnForm(
          height: 65,
          textFieldPaddingLeft: 5,
          controller: dataController.nameController, 
          label: "Name:", 
          isUnderlineBorder: false, 
          ),
        //Position
        ColumnForm(
          height: 65,
          textFieldPaddingLeft: 5,
          controller: dataController.positionController, 
          label: "Position:", 
          isUnderlineBorder: false, 
        ),
        //Date
        ColumnForm(
          height: 65,
          textFieldPaddingLeft: 5,
          controller: dataController.dateController, 
          label: "Date:", 
          isUnderlineBorder: false, 
        ),
        //Absence Type
        ColumnForm(
          height: 65,
          textFieldPaddingLeft: 5,
          controller: dataController.absenceTypeController, 
          label: "Absence Type:", 
          isUnderlineBorder: false, 
        ),
        //The name of the employee who will 
          //replace your duty:
        ColumnForm(
          height: 85,
          textFieldPaddingLeft: 5,
          controller: dataController.rNameController, 
          label: "The name of the employee who will replace your duty:", 
          isUnderlineBorder: false, 
        ),
        const SizedBox(height: 15,),
        //Report
        Center(
          child: SizedBox(
            height: 35,
            width: 100,
            child: ElevatedButton(
              onPressed: () => dataController.reportAbsenteeForm(),
              child: Text(
                "Report",
                style: Theme.of(context)
                .textTheme.bodyText1
                ?.copyWith(color: Colors.white,),
              )
            ),
          ),
        ),
      ],
    );
  }
}