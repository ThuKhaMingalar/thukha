import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/view/stock_table_form_dialog/view/stfd_view.dart';

class UserAbsenteeView extends StatelessWidget {
  const UserAbsenteeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    return Obx(
      () {
        return Form(
          key: dataController.formKey,
          autovalidateMode:dataController.isFirstTimePressed.value ?
          AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
          child: ListView(
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
                isLabel: false,
                stringKey: "Name",
                error: "Name is required",
                height: 65,
                padding: 0,
                textFieldPaddingLeft: 5,
                controller: dataController.nameController, 
                hintText: "Name:", 
                isUnderlineBorder: false, 
                ),
              //Position
              ColumnForm(
                height: 65,
                isLabel: false,
                stringKey: "Position",
                error: "Position is required",
                //validator: (value) => dataController.validate("Position", value),
                padding: 0,
                textFieldPaddingLeft: 5,
                controller: dataController.positionController, 
                hintText: "Position:", 
                isUnderlineBorder: false, 
              ),
              //Date
              ColumnForm(
                height: 65,
                isLabel: false,
                stringKey: "Date",
                error: "Date can't be empty",
                validator: (value) => dataController.validate("Date", value),
                padding: 0,
                textFieldPaddingLeft: 5,
                controller: dataController.dateController, 
                hintText: "Date:", 
                isUnderlineBorder: false, 
              ),
              //Absence Type
              ColumnForm(
                height: 65,
                padding: 0,
                stringKey: "AbsenceType",
                error: "Absence Type is required",
                isLabel: false,
                textFieldPaddingLeft: 5,
                controller: dataController.absenceTypeController, 
                hintText: "Absence Type:", 
                validator: (value) => dataController.validate("Absence Type", value),
                isUnderlineBorder: false, 
              ),
              //The name of the employee who will 
                //replace your duty:
              ColumnForm(
                stringKey: "Employee",
                error: "this field is required.",
                height: 85,
                padding: 0,
                isLabel: false,
                textFieldPaddingLeft: 5,
                controller: dataController.rNameController, 
                hintText: "The name of the employee who will replace your duty:", 
                isUnderlineBorder: false, 
                validator: (value) => dataController.validate("The name of the employee who will replace your duty", value),
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
          ),
        );
      }
    );
  }
}