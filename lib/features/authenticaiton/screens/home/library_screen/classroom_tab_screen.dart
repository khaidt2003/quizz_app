import 'package:flutter/material.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/new_class_screen.dart';

class ClassroomTabScreen extends StatelessWidget {
  const ClassroomTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: 64),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Góp tài liệu học để tiết kiệm thời gian và chia sẻ với các thành viên Quizlet khác',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewClassScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Màu nền của nút
                onPrimary: Colors.white, // Màu chữ của nút
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Độ bo tròn của viền nút
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // Padding của nút
              ),
              child: Text('Tạo Lớp học'),
            ),
          ],
        ),
      ),
    );
  }
}
