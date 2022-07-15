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

  Quality copyWith({
    String? id,
    String? name,
    String? paintId,
  }) {
    return Quality(
      id: id ?? this.id,
      name: name ?? this.name,
      paintId: paintId ?? this.paintId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'paintId': paintId,
    };
  }

  factory Quality.fromMap(Map<String, dynamic> map) {
    return Quality(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      paintId: map['paintId'] ?? '',
    );
  }

  @override
  String toString() => 'Quality(id: $id, name: $name, paintId: $paintId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quality &&
        other.id == id &&
        other.name == name &&
        other.paintId == paintId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ paintId.hashCode;
}
