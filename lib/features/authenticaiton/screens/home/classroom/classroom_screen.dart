import 'package:flutter/material.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/classroom/task_cards.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lời giải chuyên gia',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // Màu xanh nước biển cho AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  focusColor: Colors.blue,
                  hintText: 'Sách giáo khoa, ISBN, câu hỏi',
                  prefixIcon:
                      const Icon(Icons.search), // Icon tìm kiếm trong TextField
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    // Viền mặc định khi không focus
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Viền khi TextField được focus
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Đã xem gần đây',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Xử lý sự kiện cho "Xem tất cả"
                    },
                    child: const Text(
                      'Xem tất cả',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const TaskCard(
              title: 'Bài tập 1',
              description:
                  'Realidades 2: Practice Workbook\nChương P | Trang 1',
              imageUrl:
                  'https://th.bing.com/th/id/OIP.HuRW9_7mC2HcNlRsUBQRTgHaHa?rs=1&pid=ImgDetMain',
            ),
            const TaskCard(
              title: 'Bài tập 2',
              description:
                  'Realidades 2: Practice Workbook\nChương P | Trang 2',
              imageUrl:
                  'https://th.bing.com/th/id/OIP.HuRW9_7mC2HcNlRsUBQRTgHaHa?rs=1&pid=ImgDetMain',
            ),
          ],
        ),
      ),
    );
  }
}
