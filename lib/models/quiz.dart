// lib/models/quiz.dart
import 'package:json_annotation/json_annotation.dart';
import 'question.dart';

part 'quiz.g.dart';

@JsonSerializable(explicitToJson: true)
class Quiz {
  final int id;
  final String? name;
  final String title;
  final String description;
  final String? difficulty_level;
  final String topic;
  final String time;
  final bool is_published;
  final String created_at;
  final String updated_at;
  final int duration;
  final String end_time;
  final double negative_marks;
  final double correct_answer_marks;
  final bool shuffle;
  final bool show_answers;
  final bool lock_solutions;
  final bool is_form;
  final bool show_mastery_option;
  final String? reading_material;
  final String? quiz_type;
  final bool is_custom;
  final String? banner_id;
  final String? exam_id;
  final bool show_unanswered;
  final String ends_at;
  final String? lives;
  final String live_count;
  final int coin_count;
  final int questions_count;
  final String daily_date;
  final int max_mistake_count;
  final List<dynamic> reading_materials;
  final List<Question> questions;

  Quiz({
    required this.id,
    this.name,
    required this.title,
    required this.description,
    this.difficulty_level,
    required this.topic,
    required this.time,
    required this.is_published,
    required this.created_at,
    required this.updated_at,
    required this.duration,
    required this.end_time,
    required this.negative_marks,
    required this.correct_answer_marks,
    required this.shuffle,
    required this.show_answers,
    required this.lock_solutions,
    required this.is_form,
    required this.show_mastery_option,
    this.reading_material,
    this.quiz_type,
    required this.is_custom,
    this.banner_id,
    this.exam_id,
    required this.show_unanswered,
    required this.ends_at,
    this.lives,
    required this.live_count,
    required this.coin_count,
    required this.questions_count,
    required this.daily_date,
    required this.max_mistake_count,
    required this.reading_materials,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  Map<String, dynamic> toJson() => _$QuizToJson(this);
}
