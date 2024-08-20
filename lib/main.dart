import 'package:flutter/material.dart';
import 'package:various_quiz/quiz_data.dart';
import 'package:various_quiz/quiz_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<String> completedQuizzes = {};
  Map<String, int> quizScores = {};

  void markQuizAsCompleted(String subject, int score) {
    setState(() {
      completedQuizzes.add(subject);
      quizScores[subject] = score;
    });
  }

  void refreshQuizzes() {
    setState(() {
      completedQuizzes.clear();
      quizScores.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Quiz Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.refresh),
              title: Text('Refresh Quizzes'),
              onTap: () {
                refreshQuizzes();
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.score),
              title: Text('View Quiz Marks'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuizResultsPage(quizScores: quizScores),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: quizData.keys.map((subject) {
          return _buildSubjectCard(context, subject);
        }).toList(),
      ),
    );
  }

  Widget _buildSubjectCard(BuildContext context, String subject) {
    bool isCompleted = completedQuizzes.contains(subject);
    return GestureDetector(
      onTap: () {
        if (!isCompleted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizPage(
                  subject: subject, onQuizComplete: markQuizAsCompleted),
            ),
          );
        }
      },
      child: Card(
        color: isCompleted ? Colors.green : Colors.grey[800],
        child: Center(
          child: Text(
            subject,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class QuizResultsPage extends StatelessWidget {
  final Map<String, int> quizScores;

  QuizResultsPage({required this.quizScores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Marks'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: quizScores.keys.length,
        itemBuilder: (context, index) {
          String subject = quizScores.keys.elementAt(index);
          int? score = quizScores[subject];

          return ListTile(
            title: Text(subject),
            trailing: Text(
              score != null
                  ? 'Score: $score/${quizData[subject]!.length}'
                  : 'Not taken',
            ),
          );
        },
      ),
    );
  }
}
