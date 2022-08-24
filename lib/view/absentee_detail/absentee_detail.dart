import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/absence_report.dart';

class AbsenteeDetailView extends StatelessWidget {
  const AbsenteeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final absenceReport = Get.arguments as AbsenceReport;
    return Scaffold(
      appBar: AppBar(
        title: Text("Absentee Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Name
            ColumnText(
              label: "Name:",
              value: absenceReport.name,
            ),
            //Position
            ColumnText(
              label: "Position:",
              value: absenceReport.position,
            ),
            //Absence Date
            ColumnText(
              label: "Absence Date:",
              value: absenceReport.absenceDate,
            ),
            //Absence Type
            ColumnText(
              label: "Absence Type:",
              value: absenceReport.absenceType,
            ),
            //Replacement Name
            ColumnText(
              label: "Replacement Name:",
              value: absenceReport.rName,
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnText extends StatelessWidget {
  const ColumnText({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
            .textTheme.bodyText1
            ?.copyWith(color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              value,
              style: Theme.of(context).textTheme
              .headline3,
            ),
          )
        ],
      ),
    );
  }
}