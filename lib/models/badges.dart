// lib/models/badges.dart
import 'package:json_annotation/json_annotation.dart';

part 'badge.g.dart';

@JsonSerializable()
class Badges {
  final String name;
  final String description;
  final String imageUrl;

  Badges({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Badges.fromJson(Map<String, dynamic> json) =>
      _$BadgeFromJson(json);

  Map<String, dynamic> toJson() => _$BadgeToJson(this);
}
