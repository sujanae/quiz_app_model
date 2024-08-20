class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

Map<String, List<Question>> quizData = {
  'Biology': [
    Question(
      questionText: "What is the powerhouse of the cell?",
      options: ["Nucleus", "Mitochondria", "Ribosome", "Golgi Apparatus"],
      correctAnswerIndex: 1,
    ),
    // More Biology questions...
  ],
  'Physics': [
    Question(
      questionText: "What is the speed of light?",
      options: ["300,000 km/s", "150,000 km/s", "1,000 km/s", "10,000 km/s"],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "What is the speed of light?",
      options: ["300,000 km/s", "150,000 km/s", "1,000 km/s", "10,000 km/s"],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "What is the speed of light?",
      options: ["300,000 km/s", "150,000 km/s", "1,000 km/s", "10,000 km/s"],
      correctAnswerIndex: 0,
    ),
    // More Physics questions...
  ],
  'Maths': [
    Question(
      questionText: "What is 2 + 2?",
      options: ["300,000 km/s", "4", "1,000 km/s", "10,000 km/s"],
      correctAnswerIndex: 1,
    ),
    // More Physics questions...
  ],
  'CS': [
    Question(
      questionText: "What is RAM?",
      options: [
        "300,000 km/s",
        "150,000 km/s",
        "Random Access Memory",
        "10,000 km/s"
      ],
      correctAnswerIndex: 2,
    ),
    // More Physics questions...
  ],
  // Add more subjects with their respective questions...
};
