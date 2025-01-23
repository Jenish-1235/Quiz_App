// lib/services/badge_service.dart
import '../models/badge.dart';

class BadgeService {
  final List<Badge> availableBadges = [
    Badge(
      name: 'Beginner',
      description: 'Complete your first quiz.',
      imageUrl: 'assets/images/badges/beginner.png',
    ),
    Badge(
      name: 'Intermediate',
      description: 'Score over 70% in a quiz.',
      imageUrl: 'assets/images/badges/advanced.png',
    ),
    Badge(
      name: 'Expert',
      description: 'Score over 90% in a quiz.',
      imageUrl: 'assets/images/badges/expert.png',
    ),
    // Add more badges as needed
  ];

  List<Badge> evaluateBadges(int score, int total) {
    double percentage = (score / total) * 100;
    List<Badge> earned = [];

    if (percentage >= 70) {
      earned.add(availableBadges[1]); // Intermediate
    }
    if (percentage >= 90) {
      earned.add(availableBadges[2]); // Expert
    }
    if (earned.isEmpty && score > 0) {
      earned.add(availableBadges[0]); // Beginner
    }

    return earned;
  }
}
