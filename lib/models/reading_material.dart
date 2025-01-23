// lib/models/reading_material.dart
import 'package:json_annotation/json_annotation.dart';

part 'reading_material.g.dart';

@JsonSerializable(explicitToJson: true)
class ReadingMaterial {
  final int id;
  final List<String> keywords;
  final String? content;
  final String created_at;
  final String updated_at;
  final List<String> content_sections;
  final PracticeMaterial practice_material;

  ReadingMaterial({
    required this.id,
    required this.keywords,
    this.content,
    required this.created_at,
    required this.updated_at,
    required this.content_sections,
    required this.practice_material,
  });

  factory ReadingMaterial.fromJson(Map<String, dynamic> json) =>
      _$ReadingMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingMaterialToJson(this);
}

@JsonSerializable()
class PracticeMaterial {
  final List<String> content;
  final List<String> keywords;

  PracticeMaterial({
    required this.content,
    required this.keywords,
  });

  factory PracticeMaterial.fromJson(Map<String, dynamic> json) =>
      _$PracticeMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$PracticeMaterialToJson(this);
}
