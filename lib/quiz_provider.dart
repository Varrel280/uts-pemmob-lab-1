import 'package:flutter/material.dart';
import '../data/dummy_questions.dart';

class QuizProvider extends ChangeNotifier {
  String _userName = '';
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOptionIndex;

  String get userName => _userName;
  int get currentIndex => _currentIndex;
  int get score => _score;
  int? get selectedOptionIndex => _selectedOptionIndex;
  int get totalQuestions => dummyQuestions.length;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void selectOption(int index) {
    _selectedOptionIndex = index;
    notifyListeners();
  }

  bool nextQuestion() {
    if (_selectedOptionIndex == null) return false;

    if (_selectedOptionIndex == dummyQuestions[_currentIndex].correctAnswerIndex) {
      _score += 20;
    }

    if (_currentIndex < dummyQuestions.length - 1) {
      _currentIndex++;
      _selectedOptionIndex = null;
      notifyListeners();
      return true;
    } else {
      return true; // Selesai
    }
  }

  void resetQuiz() {
    _userName = '';
    _currentIndex = 0;
    _score = 0;
    _selectedOptionIndex = null;
    notifyListeners();
  }
}