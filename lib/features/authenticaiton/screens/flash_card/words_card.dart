import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WordsCard extends StatelessWidget {
  final String Eng;
  final String VietNam;
  final FlutterTts flutterTts = FlutterTts();

  WordsCard({
    super.key,
    // ignore: non_constant_identifier_names
    required this.Eng,
    // ignore: non_constant_identifier_names
    required this.VietNam,
  });
  Future _speak() async {
    await flutterTts.setLanguage('en-US'); // Đặt ngôn ngữ là tiếng Anh
    await flutterTts.setSpeechRate(1.0); // Đặt tốc độ phát âm
    await flutterTts.setVolume(10.0); // Đặt âm lượng
    await flutterTts.speak("aaaaa"); // Phát âm từ
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Đảm bảo các biểu tượng được đặt sang phải
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Eng, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(VietNam, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.volume_up), // Icon nói
                  onPressed: () {
                    flutterTts
                        .setLanguage('en-US'); // Đặt ngôn ngữ là tiếng Anh
                    flutterTts.setSpeechRate(0.5); // Đặt tốc độ phát âm
                    flutterTts.setVolume(10.0); // Đặt âm lượng
                    flutterTts.speak(Eng);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star_border), // Icon sao
                  onPressed: () {
                    // Xử lý khi nhấn nút sao
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border), // Icon tim
                  onPressed: () {
                    // Xử lý khi nhấn nút tim
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
