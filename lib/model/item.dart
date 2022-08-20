import 'package:freezed_annotation/freezed_annotation.dart';

part "item.freezed.dart";
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item({
    required String id,
    required String name,
    required int count,
    required DateTime dateTime,
    required int unitCost,
    required int inHand,
    required String code,
    required DateTime expirationDate,
  }) = _Item;

  factory Item.fromJson(Map<String,dynamic> json) => _$ItemFromJson(json);
}