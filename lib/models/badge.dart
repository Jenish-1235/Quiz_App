// lib/models/badge.dart
import 'package:json_annotation/json_annotation.dart';

part 'badge.g.dart';

@JsonSerializable()
class Badge {
  final String name;
  final String description;
  final String imageUrl;

  Badge({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Badge.fromJson(Map<String, dynamic> json) =>
      _$BadgeFromJson(json);

  Map<String, dynamic> toJson() => _$BadgeToJson(this);
}
