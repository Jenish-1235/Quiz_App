// lib/models/user.dart
import 'package:json_annotation/json_annotation.dart';

import 'badge.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String username;
  final String avatarUrl;
  final int totalScore;
  final List<Badge> earnedBadges;

  User({
    required this.username,
    required this.avatarUrl,
    required this.totalScore,
    required this.earnedBadges,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
