// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/user_provider.dart';
import 'quiz_screen.dart';
import 'badges_screen.dart';
import 'leaderboards_screen.dart';
import 'profile_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    quizProvider.loadQuiz();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.loadUser();
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgrounds/home_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // User Profile
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/avatars/avatar1.png')
                        as ImageProvider,
                      ),
                      SizedBox(width: 10),
                      Text(
                        userProvider.user?.username ?? 'Guest',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.settings, size: 30),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  // Start Quiz Button
                  ElevatedButton.icon(
                    onPressed: quizProvider.isLoading
                        ? null
                        : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizScreen()),
                      );
                    },
                    icon: Icon(Icons.play_arrow, size: 30),
                    label: Text(
                      'Start Quiz',
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Badges Preview
                  Text(
                    'Your Achievements',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                      quizProvider.earnedBadges.length > 5 ? 5 : quizProvider.earnedBadges.length,
                      itemBuilder: (context, index) {
                        final badge = quizProvider.earnedBadges[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Column(
                            children: [
                              Image.asset(
                                badge.imageUrl,
                                height: 60,
                                width: 60,
                              ),
                              SizedBox(height: 5),
                              Text(
                                badge.name,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  // Leaderboard Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LeaderboardsScreen()),
                      );
                    },
                    icon: Icon(Icons.leaderboard, size: 30),
                    label: Text(
                      'View Leaderboards',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}
