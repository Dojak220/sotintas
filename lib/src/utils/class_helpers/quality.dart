import 'dart:convert';
import 'package:flutter/material.dart';

class Quality {
  final Icon icon;
  final String name;

  Quality(this.icon, this.name);

  Map<String, dynamic> toMap() {
    return {
      'icon': icon.icon!.codePoint,
      'name': name,
    };
  }

  factory Quality.fromMap(Map<String, dynamic> map) {
    return Quality(
      Icon(IconData(map['icon'])),
      map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Quality.fromJson(String source) =>
      Quality.fromMap(json.decode(source));
}
