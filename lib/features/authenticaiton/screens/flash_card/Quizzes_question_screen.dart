// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final Map<String, Color> optionColors;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.optionColors,
  });
}

class QuizletQuizScreen extends StatefulWidget {
  final List<dynamic> words;

  const QuizletQuizScreen({
    Key? key,
    required this.words,
  }) : super(key: key);

  @override
  _QuizletQuizScreenState createState() => _QuizletQuizScreenState();
}

class _QuizletQuizScreenState extends State<QuizletQuizScreen> {
  late List<String> words;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  List<Question> questions = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    List<dynamic> wordEntries = widget.words;
    words = wordEntries.map((entry) => entry['vietnamese'] as String).toList();
    _generateQuestions();
  }

  void _generateQuestions() {
    List<String> options = [];
    for (var word in words) {
      options = _generateRandomOptions(word);
    }
    for (var questionData in widget.words) {
      String questionText = questionData['english']!;
      String correctAnswer = questionData['vietnamese']!;
      Map<String, Color> optionColors = {};
      options.forEach((option) {
        optionColors[option] = Colors.white;
      });
      questions.add(Question(
        questionText: 'What is the Vietnamese meaning of "$questionText"?',
        options: options,
        correctAnswer: correctAnswer,
        optionColors: optionColors,
      ));
    }
  }

  List<String> _generateRandomOptions(String correctAnswer) {
    List<String> options = [];
    options.add(correctAnswer);
    while (options.length < widget.words.length) {
      String randomWord = words[Random().nextInt(words.length)];
      if (!options.contains(randomWord)) {
        options.add(randomWord);
      }
    }
    return options;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: _currentIndex < questions.length
          ? _buildQuestion(questions[_currentIndex])
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz completed!',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Correct answers: $correctAnswers',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Wrong answers: $wrongAnswers',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  question.questionText,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                ...question.options
                    .map(
                      (option) => ElevatedButton(
                        onPressed: () {
                          _showResult(option);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: question.optionColors[option],
                        ),
                        child: Text(option),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showResult(String selectedAnswer) {
    Question currentQuestion = questions[_currentIndex];
    String correctAnswer = currentQuestion.correctAnswer;
    bool isCorrect = selectedAnswer == correctAnswer;
    if (isCorrect) {
      setState(() {
        correctAnswers++;
      });
    } else {
      setState(() {
        wrongAnswers++;
      });
    }
    currentQuestion.options.forEach((option) {
      if (option == selectedAnswer) {
        setState(() {
          if (isCorrect) {
            currentQuestion.optionColors[option] = Colors.green;
          } else {
            currentQuestion.optionColors[option] = Colors.red;
          }
        });
      }
    });

    // Chờ 1 giây trước khi chuyển câu hỏi
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        // Chuyển qua câu hỏi tiếp theo sau khi trả lời
        _currentIndex++;
      });
    });
  }
}
