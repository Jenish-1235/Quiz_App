// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quiz.dart';

class ApiService {
  final String apiUrl = 'https://api.jsonserve.com/Uw5CrX';

  Future<Quiz> fetchQuiz() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return Quiz.fromJson(data);
      } else {
        throw Exception('Failed to load quiz data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
