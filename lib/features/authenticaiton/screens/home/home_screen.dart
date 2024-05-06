import 'package:flutter/material.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/course_cards.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/curve_painter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 250),
                painter: CurvePainter(),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(
                      top: 90.0, left: 16, right: 16, bottom: 16),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Học phần',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {
                            // Xử lý sự kiện cho "Xem tất cả"
                            // Ví dụ: Điều hướng đến màn hình danh sách các khóa học
                          },
                          child: Text('Xem tất cả',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Thêm các card học phần
                    CourseCard(
                        courseName: "Toán cao cấp",
                        termCount: 3,
                        addedBy: "123"),
                    CourseCard(
                        courseName: "Toán cao cấp",
                        termCount: 3,
                        addedBy: "123"),
                    CourseCard(
                        courseName: "Toán cao cấp",
                        termCount: 3,
                        addedBy: "123"),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text('Quizlet',
                    style: Theme.of(context).textTheme.headlineLarge),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      // Xử lý khi nút thông báo được nhấn
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Học phần, sách giáo khoa, câu hỏi',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.deepPurple,
        unselectedItemColor: AppColors.colorWord,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.class_), label: 'Lớp học'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Thêm'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Thư viện'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Hồ sơ'),
        ],
      ),
    );
  }
}
