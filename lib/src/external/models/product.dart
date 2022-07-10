import 'package:json_annotation/json_annotation.dart';
import 'package:sotintas/src/utils/class_helpers/quality.dart';

part "product.g.dart";

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final double price;
  final String pictureUrl;
  final bool freeShipping;
  final List<Quality> qualities;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.pictureUrl,
    required this.freeShipping,
    required this.qualities,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String toString() {
    return "$name R\$ $price";
  }
}
