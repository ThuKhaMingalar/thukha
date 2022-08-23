// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absence_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AbsenceReport _$$_AbsenceReportFromJson(Map<String, dynamic> json) =>
    _$_AbsenceReport(
      id: json['id'] as String,
      name: json['name'] as String,
      position: json['position'] as String,
      absenceDate: json['absenceDate'] as String,
      absenceType: json['absenceType'] as String,
      rName: json['rName'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      ownerID: json['ownerID'] as String,
    );

Map<String, dynamic> _$$_AbsenceReportToJson(_$_AbsenceReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'absenceDate': instance.absenceDate,
      'absenceType': instance.absenceType,
      'rName': instance.rName,
      'dateTime': instance.dateTime.toIso8601String(),
      'ownerID': instance.ownerID,
    };
