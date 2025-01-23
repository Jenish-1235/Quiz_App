// lib/screens/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/option_widget.dart';
import '../widgets/progress_widget.dart';
import 'result_screen.dart';
import 'package:lottie/lottie.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    // Initialize any necessary data
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    if (quizProvider.quiz == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final question = quizProvider.quiz!.questions[quizProvider.currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // Background Animation
          Positioned.fill(
            child: Lottie.asset(
              'assets/animations/quiz_bg.json',
              fit: BoxFit.cover,
              repeat: true,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Progress Widget
                  ProgressWidget(
                    current: quizProvider.currentQuestionIndex + 1,
                    total: quizProvider.quiz!.questions.length,
                  ),
                  SizedBox(height: 20),
                  // Timer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Score: ${quizProvider.score}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // Implement Timer widget if needed
                    ],
                  ),
                  SizedBox(height: 20),
                  // Question Text
                  Text(
                    question.description,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30),
                  // Options List
                  Expanded(
                    child: ListView.builder(
                      itemCount: question.options.length,
                      itemBuilder: (context, index) {
                        final option = question.options[index];
                        bool isSelected = quizProvider.selectedAnswers.length > quizProvider.currentQuestionIndex &&
                            quizProvider.selectedAnswers[quizProvider.currentQuestionIndex] == index;

                        return OptionWidget(
                          option: option,
                          isSelected: isSelected,
                          isAnswered: quizProvider.selectedAnswers.length > quizProvider.currentQuestionIndex,
                          onTap: () {
                            if (quizProvider.selectedAnswers.length > quizProvider.currentQuestionIndex) return;
                            quizProvider.selectAnswer(index);
                            if (quizProvider.isLastQuestion) {
                              quizProvider.evaluateBadges();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultScreen()),
                              );
                            } else {
                              Future.delayed(Duration(seconds: 1), () {
                                quizProvider.nextQuestion();
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  // Current Score Display
                  Text(
                    'Current Score: ${quizProvider.score}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
