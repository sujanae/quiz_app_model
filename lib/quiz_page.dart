import 'package:flutter/material.dart';
import 'package:various_quiz/quiz_data.dart';

class QuizPage extends StatefulWidget {
  final String subject;
  final Function(String, int) onQuizComplete;

  QuizPage({required this.subject, required this.onQuizComplete});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;

  void answerQuestion(int selectedIndex) {
    if (selectedIndex ==
        quizData[widget.subject]![currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        score++;
      });
    }

    setState(() {
      if (currentQuestionIndex < quizData[widget.subject]!.length - 1) {
        currentQuestionIndex++;
      } else {
        // Quiz finished
        widget.onQuizComplete(widget.subject, score);
        Navigator.of(context).pop(); // Go back to the HomePage
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quizData[widget.subject]![currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...quizData[widget.subject]![currentQuestionIndex]
                .options
                .asMap()
                .entries
                .map((entry) {
              return ElevatedButton(
                child: Text(entry.value),
                onPressed: () => answerQuestion(entry.key),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
