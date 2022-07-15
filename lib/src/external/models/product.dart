import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:sotintas/src/external/models/quality.dart';

part "product.g.dart";

@JsonSerializable(genericArgumentFactories: true)
class Product {
  final String id;
  final String name;
  final String price;
  final String coverImage;
  final bool deliveryFree;
  final List<Quality>? qualities;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.coverImage,
    required this.deliveryFree,
    required this.qualities,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    String? id,
    String? name,
    String? price,
    String? coverImage,
    bool? deliveryFree,
    List<Quality>? qualities,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      coverImage: coverImage ?? this.coverImage,
      deliveryFree: deliveryFree ?? this.deliveryFree,
      qualities: qualities ?? this.qualities,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'coverImage': coverImage,
      'deliveryFree': deliveryFree,
      'qualities': qualities?.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      coverImage: map['coverImage'] ?? '',
      deliveryFree: map['deliveryFree'] ?? false,
      qualities: map['qualities'] != null
          ? List<Quality>.from(map['qualities']?.map((x) => Quality.fromMap(x)))
          : null,
    );
  }

  @override
  String toString() {
    return "$name R\$ $price";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.coverImage == coverImage &&
        other.deliveryFree == deliveryFree &&
        listEquals(other.qualities, qualities);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        coverImage.hashCode ^
        deliveryFree.hashCode ^
        qualities.hashCode;
  }
}
