import 'package:flutter/material.dart';

class ProgressHeader extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;

  const ProgressHeader({
    Key? key,
    required this.currentIndex,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: (currentIndex + 1) / totalQuestions,
      backgroundColor: Colors.blue.shade100,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      minHeight: 8,
    );
  }
}