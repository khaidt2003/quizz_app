import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/features/authenticaiton/screens/flash_card/Quizzes_question_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/flash_card/essay_exam.dart';

class ChooseQuizzScreen extends StatefulWidget {
  final List<dynamic> words;

  const ChooseQuizzScreen({
    super.key,
    required this.words,
  });

  @override
  State<ChooseQuizzScreen> createState() => _ChooseQuizzScreenState();
}

class _ChooseQuizzScreenState extends State<ChooseQuizzScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // Màu nền xanh nước biển
        appBar: AppBar(
          title: Text('Flutter Quiz'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.of(context).pop(), // Quay lại màn hình trước
          ),
          iconTheme: IconThemeData(color: Colors.white), // Tiêu đề màn hình
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity, // Chiều rộng full màn hình
                margin: EdgeInsets.symmetric(
                    horizontal: 20), // Khoảng cách lề ngang
                child: ElevatedButton(
                  onPressed: () =>
                      Get.to(() => QuizletQuizScreen(words: widget.words)),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bo tròn góc
                    ),
                  ),
                  child: Text('Thi Trắc Nghiệm'), // Văn bản trên nút
                ),
              ),
              SizedBox(height: 20), // Khoảng cách giữa hai nút
              Container(
                width: double.infinity, // Chiều rộng full màn hình
                margin: EdgeInsets.symmetric(
                    horizontal: 20), // Khoảng cách lề ngang
                child: ElevatedButton(
                  onPressed: () =>
                      Get.to(() => EssayQuizScreen(words: widget.words)),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bo tròn góc
                    ),
                  ),
                  child: Text('Thi Tự Luận'), // Văn bản trên nút
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
