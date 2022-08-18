import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';

@freezed
class Shop with _$Shop{
  factory Shop({
    required String id,
    required String name,
    required String image,
  }) = _Shop;

  factory Shop.fromJson(Map<String,dynamic> json) => _$ShopFromJson(json);
}