// lib/providers/badge_provider.dart
import 'package:flutter/material.dart';
import '../models/badges.dart';
import '../services/badge_service.dart';

class BadgeProvider with ChangeNotifier {
  List<Badges> _earnedBadges = [];
  final BadgeService _badgeService = BadgeService();

  List<Badges> get earnedBadges => _earnedBadges;

  void addBadges(int score, int total) {
    _earnedBadges = _badgeService.evaluateBadges(score, total);
    notifyListeners();
  }
}
