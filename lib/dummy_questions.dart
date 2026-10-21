import '../models/question.dart';

final List<Question> dummyQuestions = [
  Question(
    questionText: "Apa kepanjangan dari widget StatelessWidget di Flutter?",
    options: [
      "Widget yang memiliki state/kondisi yang dapat berubah",
      "Widget yang tidak memiliki state yang berubah (statis)",
      "Widget bawaan database lokal",
      "Widget untuk navigasi halaman"
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    questionText: "Bahasa pemrograman apa yang digunakan oleh framework Flutter?",
    options: ["Java", "Python", "Dart", "C++"],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: "Fungsi utama dari StatefulWidget adalah...",
    options: [
      "Menampilkan teks statis",
      "Mengelola perubahan data/state pada UI secara dinamis",
      "Mempercepat koneksi internet",
      "Menyimpan file ke cloud"
    ],
    correctAnswerIndex: 1,
  ),
];