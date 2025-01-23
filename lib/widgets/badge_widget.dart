// lib/widgets/badge_widget.dart
import 'package:flutter/material.dart';
import '../models/badges.dart';

class BadgeWidget extends StatelessWidget {
  final Badges badge;

  BadgeWidget({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          badge.imageUrl,
          height: 60,
          width: 60,
        ),
        SizedBox(height: 5),
        Text(
          badge.name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
