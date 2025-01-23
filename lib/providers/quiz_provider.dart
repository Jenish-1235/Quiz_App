// lib/providers/quiz_provider.dart
import 'package:flutter/material.dart';
import '../models/quiz.dart';
import '../models/question.dart';
import '../services/api_service.dart';
import '../services/badge_service.dart';
import '../services/storage_service.dart';
import '../models/user.dart';
import '../models/badges.dart';

class QuizProvider with ChangeNotifier {
  Quiz? _quiz;
  bool _isLoading = false;
  String? _error;

  int _currentQuestionIndex = 0;
  int _score = 0;
  List<int> _selectedAnswers = [];
  List<Badges> _earnedBadges = [];

  final BadgeService _badgeService = BadgeService();
  final StorageService _storageService = StorageService();

  Quiz? get quiz => _quiz;
  bool get isLoading => _isLoading;
  String? get error => _error;

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  List<int> get selectedAnswers => _selectedAnswers;
  List<Badges> get earnedBadges => _earnedBadges;

  Future<void> loadQuiz() async {
    _isLoading = true;
    notifyListeners();

    try {
      _quiz = await ApiService().fetchQuiz();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectAnswer(int selectedIndex) {
    if (_quiz == null) return;
    Question currentQuestion = _quiz!.questions[_currentQuestionIndex];
    _selectedAnswers.add(selectedIndex);

    if (currentQuestion.options[selectedIndex].is_correct) {
      _score += _quiz!.correct_answer_marks.toInt();
    } else {
      _score -= _quiz!.negative_marks.toInt();
    }

    notifyListeners();
  }

  void nextQuestion() {
    if (_quiz == null) return;
    if (_currentQuestionIndex < _quiz!.questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  bool get isLastQuestion =>
      _quiz != null && _currentQuestionIndex == _quiz!.questions.length - 1;

  void evaluateBadges() {
    if (_quiz == null) return;
    _earnedBadges = _badgeService.evaluateBadges(_score, _quiz!.questions_count * _quiz!.correct_answer_marks.toInt());
    notifyListeners();
  }

  Future<void> saveUserData(String username, String avatarUrl) async {
    User user = User(
      username: username,
      avatarUrl: avatarUrl,
      totalScore: _score,
      earnedBadges: _earnedBadges,
    );
    await _storageService.saveUser(user);
    notifyListeners();
  }

  Future<User?> getUserData() async {
    return await _storageService.getUser();
  }
}
