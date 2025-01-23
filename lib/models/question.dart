// lib/models/question.dart
import 'package:json_annotation/json_annotation.dart';
import 'option.dart';
import 'reading_material.dart';

part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question {
  final int id;
  final String description;
  final String? difficulty_level;
  final String topic;
  final bool is_published;
  final String created_at;
  final String updated_at;
  final String detailed_solution;
  final String? type;
  final bool is_mandatory;
  final bool show_in_feed;
  final String? pyq_label;
  final int topic_id;
  final int reading_material_id;
  final String? fixed_at;
  final String? fix_summary;
  final String? created_by;
  final String? updated_by;
  final String? quiz_level;
  final String question_from;
  final String? language;
  final String? photo_url;
  final String? photo_solution_url;
  final bool is_saved;
  final String tag;
  final List<Option> options;
  final ReadingMaterial reading_material;

  Question({
    required this.id,
    required this.description,
    this.difficulty_level,
    required this.topic,
    required this.is_published,
    required this.created_at,
    required this.updated_at,
    required this.detailed_solution,
    this.type,
    required this.is_mandatory,
    required this.show_in_feed,
    this.pyq_label,
    required this.topic_id,
    required this.reading_material_id,
    this.fixed_at,
    this.fix_summary,
    this.created_by,
    this.updated_by,
    this.quiz_level,
    required this.question_from,
    this.language,
    this.photo_url,
    this.photo_solution_url,
    required this.is_saved,
    required this.tag,
    required this.options,
    required this.reading_material,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
