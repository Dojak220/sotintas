import 'package:json_annotation/json_annotation.dart';

part 'quality.g.dart';

@JsonSerializable()
class Quality {
  final String id;
  final String name;
  final String paintId;

  Quality({
    required this.name,
    required this.id,
    required this.paintId,
  });

  factory Quality.fromJson(Map<String, dynamic> json) =>
      _$QualityFromJson(json);

  Map<String, dynamic> toJson() => _$QualityToJson(this);
}
