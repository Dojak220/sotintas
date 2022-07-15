import 'package:json_annotation/json_annotation.dart';
import 'package:sotintas/src/external/models/product.dart';


part "cart_item.g.dart";

@JsonSerializable()
class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  @override
  String toString() {
    return "$product | $quantity und(s).";
  }
}
