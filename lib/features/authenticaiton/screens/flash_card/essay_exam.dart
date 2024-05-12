import 'dart:async';

import 'package:flutter/material.dart';

class Question {
  final String questionText;
  final String correctAnswer;

  Question({required this.questionText, required this.correctAnswer});
}

class EssayQuizScreen extends StatefulWidget {
  final List<dynamic> words;

  const EssayQuizScreen({
    Key? key,
    required this.words,
  }) : super(key: key);

  @override
  State<EssayQuizScreen> createState() => _EssayQuizScreenState();
}

class _EssayQuizScreenState extends State<EssayQuizScreen> {
  int correctAnswers = 0;
  int wrongAnswers = 0;
  List<Question> quizQuestions = [];
  int _currentIndex = 0;
  List<String> _userAnswers = [];
  TextEditingController _answerController = TextEditingController();
  Timer? _timer;
  int _secondsRemaining = 90;

  @override
  void initState() {
    super.initState();
    _generateQuestions();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _generateQuestions() {
    for (var questionData in widget.words) {
      String questionText = questionData['english']!;
      String correctAnswer = questionData['vietnamese']!;
      quizQuestions.add(Question(
        questionText: questionText,
        correctAnswer: correctAnswer,
      ));
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0 && _currentIndex < quizQuestions.length) {
          _secondsRemaining--;
        } else {
          _currentIndex = quizQuestions.length + 1;
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'Time: $_secondsRemaining seconds',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      body: _currentIndex < quizQuestions.length
          ? _buildQuestion(quizQuestions[_currentIndex])
          : Column(
              children: [
                Center(
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
                if (_currentIndex >=
                    3) // Display user's answers and correct answers when all questions are answered
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Your Answers:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      for (int i = 0; i < _userAnswers.length; i++)
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Question ${i + 1}: ${_userAnswers[0]}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Correct Answer: ${quizQuestions[i].correctAnswer}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: _userAnswers[0] ==
                                              quizQuestions[0].correctAnswer
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
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
                  'Question:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  question.questionText,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Answer:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _answerController,
                  maxLines: 5,
                  enabled: _currentIndex <
                      quizQuestions
                          .length, // Disable text field when all questions are answered
                  decoration: InputDecoration(
                    hintText: 'Write your answer here',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex < quizQuestions.length) {
                      _showResult(_answerController.text);
                    }
                  },
                  child: Text(_currentIndex < quizQuestions.length - 1
                      ? 'Submit'
                      : 'Done'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showResult(String selectedAnswer) {
    Question currentQuestion = quizQuestions[_currentIndex];
    String correctAnswer = currentQuestion.correctAnswer;
    bool isCorrect = selectedAnswer.toLowerCase().trim() ==
        correctAnswer.toLowerCase().trim();
    if (isCorrect) {
      setState(() {
        correctAnswers++;
      });
    } else {
      setState(() {
        wrongAnswers++;
      });
    }

    // Lưu câu trả lời của người dùng
    _userAnswers.add(selectedAnswer);

    // Chờ 1 giây trước khi chuyển câu hỏi
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        // Chuyển qua câu hỏi tiếp theo sau khi trả lời
        _currentIndex++;
        _answerController.clear();
      });
    });
    _secondsRemaining = 90; // 3 minutes
  }
}
