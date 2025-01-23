// lib/screens/badges_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../models/badges.dart';
import 'package:lottie/lottie.dart';

class BadgesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final badges = quizProvider.earnedBadges;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Badges'),
      ),
      body: badges.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events, size: 100, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'No badges earned yet.',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      )
          : GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3 / 4),
        itemCount: badges.length,
        itemBuilder: (context, index) {
          final badge = badges[index];
          return GestureDetector(
            onTap: () {
              // Optionally, show badge details
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    badge.imageUrl,
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(height: 10),
                  Text(
                    badge.name,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      badge.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
