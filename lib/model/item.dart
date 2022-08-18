import 'package:freezed_annotation/freezed_annotation.dart';

part "item.freezed.dart";
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item({
    required String id,
    required String name,
    required String count,
    required String dateTime,
  }) = _Item;

  factory Item.fromJson(Map<String,dynamic> json) => _$ItemFromJson(json);
}