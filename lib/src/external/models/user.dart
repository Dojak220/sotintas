import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

@JsonSerializable()
class User {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? token;
  final String? avatar;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.token,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return "$name ($email)";
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? token,
    String? avatar,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      avatar: avatar ?? this.avatar,
    );
  }
}
