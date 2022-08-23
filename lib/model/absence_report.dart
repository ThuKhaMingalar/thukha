import 'package:freezed_annotation/freezed_annotation.dart';

part 'absence_report.freezed.dart';
part 'absence_report.g.dart';

@freezed
class AbsenceReport with _$AbsenceReport {
  factory AbsenceReport({
    required String id,
    required String name,
    required String position,
    required String absenceDate,
    required String absenceType,
    required String rName,
    required DateTime dateTime,
    required String ownerID,
  }) = _AbsenceReport;

  factory AbsenceReport.fromJson(Map<String,dynamic> json) => 
  _$AbsenceReportFromJson(json);
}