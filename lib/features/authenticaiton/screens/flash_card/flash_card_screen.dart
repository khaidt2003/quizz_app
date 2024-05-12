import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:quizz_app/features/authenticaiton/screens/flash_card/Quizzes_question_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/flash_card/choose_quizz_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/flash_card/words_card.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/course_cards.dart';

// Trong FlashCardScreen, thêm constructor để nhận danh sách các từ
class FlashCardScreen extends StatefulWidget {
  final List<dynamic> words;

  const FlashCardScreen({
    required this.words,
  });

  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  final FlutterTts flutterTts = FlutterTts();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ứng dụng của tôi'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.of(context).pop(), // Quay lại màn hình trước
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  child: PageView.builder(
                    itemCount: widget.words.length,
                    controller: PageController(viewportFraction: 0.8),
                    itemBuilder: (context, index) {
                      return FlipCard(
                        front: Card(
                          color: Colors.deepPurple,
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  widget.words[index]['english']!,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: Icon(Icons.volume_up,
                                      color: Colors.white),
                                  onPressed: () {
                                    flutterTts.setLanguage(
                                        'en-US'); // Đặt ngôn ngữ là tiếng Anh
                                    flutterTts.setSpeechRate(
                                        0.5); // Đặt tốc độ phát âm
                                    flutterTts.setVolume(10.0); // Đặt âm lượng
                                    flutterTts
                                        .speak(widget.words[index]['english']);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        back: Card(
                          color: Colors.red,
                          child: Stack(children: [
                            Center(
                              child: Text(
                                widget.words[index]['vietnamese']!,
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
                                icon:
                                    Icon(Icons.volume_up, color: Colors.white),
                                onPressed: () {
                                  flutterTts.setLanguage(
                                      'vi-Vn'); // Đặt ngôn ngữ là tiếng Anh
                                  flutterTts
                                      .setSpeechRate(0.5); // Đặt tốc độ phát âm
                                  flutterTts.setVolume(10.0); // Đặt âm lượng
                                  flutterTts
                                      .speak(widget.words[index]['vietnamese']);
                                },
                              ),
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                _buildFullWidthButton(
                    'Thẻ ghi nhớ',
                    Colors.indigo,
                    () => Get.to(() => ChooseQuizzScreen(
                          words: widget.words,
                        ))),
                _buildFullWidthButton(
                    'Học',
                    Colors.green,
                    () => Get.to(() => ChooseQuizzScreen(
                          words: widget.words,
                        ))),
                _buildFullWidthButton(
                    'Kiểm tra',
                    Colors.orange,
                    () => Get.to(() => ChooseQuizzScreen(
                          words: widget.words,
                        ))),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: widget.words.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: WordsCard(
                            Eng: widget.words[index]['english'],
                            VietNam: widget.words[index]['vietnamese'],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hàm xây dựng nút có chiều rộng đầy đủ
  Widget _buildFullWidthButton(
      String text, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          textStyle: TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(double.infinity, 50), // full width
        ),
        child: Text(text),
      ),
    );
  }
}
