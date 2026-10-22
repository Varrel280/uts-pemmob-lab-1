import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dummy_questions.dart';
import '../providers/quiz_provider.dart';
import '../widgets/primary_button.dart';
import '../widgets/progress_header.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName;
  const QuizScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  int? selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final question = dummyQuestions[currentIndex];
    final List<String> optionLabels = ['A', 'B', 'C', 'D'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Soal ${currentIndex + 1} dari ${dummyQuestions.length}"),
        actions: [
          IconButton(
            icon: Icon(quizProvider.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: () => quizProvider.toggleTheme(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressHeader(currentIndex: currentIndex, totalQuestions: dummyQuestions.length),
              const SizedBox(height: 15),
              Text(
                "Pemain: ${widget.userName}",
                style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),

              // Card Pertanyaan
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  question.questionText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Pilih Jawaban:",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 10),

              // Opsi Jawaban A, B, C, D (Flexible/Expanded agar bebas overflow)
              Expanded(
                child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedOptionIndex == index;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? const Color(0xFF6C63FF)
                              : Theme.of(context).cardColor,
                          foregroundColor: isSelected
                              ? Colors.white
                              : (isDark ? Colors.white : Colors.black87),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: isSelected
                                  ? const Color(0xFF6C63FF)
                                  : (isDark ? Colors.grey.shade800 : Colors.grey.shade300),
                              width: 1.5,
                            ),
                          ),
                          elevation: isSelected ? 4 : 0,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedOptionIndex = index;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white.withOpacity(0.2)
                                    : (isDark ? Colors.grey.shade800 : Colors.grey.shade100),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                optionLabels[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : const Color(0xFF6C63FF),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                question.options[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              PrimaryButton(
                text: currentIndex == dummyQuestions.length - 1 ? "Selesai & Lihat Skor" : "Selanjutnya",
                color: const Color(0xFF4CAF50),
                onPressed: () {
                  if (selectedOptionIndex == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Silakan pilih salah satu jawaban terlebih dahulu!")),
                    );
                    return;
                  }

                  if (selectedOptionIndex == question.correctAnswerIndex) {
                    score += 20;
                  }

                  if (currentIndex < dummyQuestions.length - 1) {
                    setState(() {
                      currentIndex++;
                      selectedOptionIndex = null;
                    });
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          userName: widget.userName,
                          score: score,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}