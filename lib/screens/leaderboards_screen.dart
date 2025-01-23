// lib/screens/leaderboards_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user.dart';
import 'package:lottie/lottie.dart';

class LeaderboardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // For demonstration, using mock data. Replace with actual data source.
    final List<User> topUsers = [
      User(
        username: 'Alice',
        avatarUrl: 'assets/images/avatars/avatar1.png',
        totalScore: 300,
        earnedBadges: [],
      ),
      User(
        username: 'Bob',
        avatarUrl: 'assets/images/avatars/avatar2.png',
        totalScore: 250,
        earnedBadges: [],
      ),
      // Add more users
    ];

    final userProvider = Provider.of<UserProvider>(context);
    final currentUser = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboards'),
      ),
      body: Stack(
        children: [
          // Background Animation
          Positioned.fill(
            child: Lottie.asset(
              'assets/animations/leaderboard_bg.json',
              fit: BoxFit.cover,
              repeat: true,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Top Performers',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: topUsers.length,
                    itemBuilder: (context, index) {
                      final user = topUsers[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(user.avatarUrl),
                        ),
                        title: Text(user.username),
                        trailing: Text(
                          '${user.totalScore}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
                Divider(),
                // Current User
                if (currentUser != null)
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(currentUser.avatarUrl),
                    ),
                    title: Text(currentUser.username),
                    trailing: Text(
                      '${currentUser.totalScore}',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
