// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as String,
      itemsList: (json['itemsList'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownerID: json['ownerID'] as String,
      status: json['status'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'itemsList': instance.itemsList.map((e) => e.toJson()).toList(),
      'ownerID': instance.ownerID,
      'status': instance.status,
      'dateTime': instance.dateTime.toIso8601String(),
    };
