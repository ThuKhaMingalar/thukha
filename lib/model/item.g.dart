// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String,
      name: json['name'] as String,
      count: json['count'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      unitCost: json['unitCost'] as int,
      inHand: json['inHand'] as int,
      code: json['code'] as String,
      expirationDate: DateTime.parse(json['expirationDate'] as String),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'dateTime': instance.dateTime.toIso8601String(),
      'unitCost': instance.unitCost,
      'inHand': instance.inHand,
      'code': instance.code,
      'expirationDate': instance.expirationDate.toIso8601String(),
    };
