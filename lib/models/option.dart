// lib/models/option.dart
import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  final int id;
  final String description;
  final int question_id;
  final bool is_correct;
  final String created_at;
  final String updated_at;
  final bool unanswered;
  final String? photo_url;

  Option({
    required this.id,
    required this.description,
    required this.question_id,
    required this.is_correct,
    required this.created_at,
    required this.updated_at,
    required this.unanswered,
    this.photo_url,
  });

  factory Option.fromJson(Map<String, dynamic> json) =>
      _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
