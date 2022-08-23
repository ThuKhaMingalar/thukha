import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  @JsonSerializable(explicitToJson: true)
  factory Order({
    required String id,
    required List<Item> itemsList,
    required String ownerID,
    required int status,
    required DateTime dateTime,
  }) = _Order;

  factory Order.fromJson(Map<String,dynamic> json) => _$OrderFromJson(json);
}