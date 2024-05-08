import 'package:flutter/material.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/features/authenticaiton/screens/flash_card/flash_card_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/classroom/classroom_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/course_cards.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/curve_painter.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/add_folder_dialog.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/add_module_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/libary_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/new_class_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Giữ index hiện tại của tab
  final List<Map<String, dynamic>> courses = List.generate(10, (index) {
    return {
      "courseName": "Course ${index + 1}",
      "termCount": index * 5, // Ví dụ: số thuật ngữ tăng dần
      "addedBy": "User${index + 1}"
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: _currentIndex,
                  children: <Widget>[
                    Scaffold(
                      body: Stack(
                        children: [
                          Column(
                            children: <Widget>[
                              CustomPaint(
                                size: Size(
                                    MediaQuery.of(context).size.width, 250),
                                painter: CurvePainter(),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 90.0,
                                      left: 16,
                                      right: 16,
                                      bottom: 16),
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Học phần',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        InkWell(
                                          onTap: () {
                                            // Xử lý sự kiện cho "Xem tất cả"
                                            // Ví dụ: Điều hướng đến màn hình danh sách các khóa học
                                          },
                                          child: const Text('Xem tất cả',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.blue)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    // Thêm các card học phần
                                    Container(
                                      height:
                                          200, // Thiết lập chiều cao cho ListView ngang
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: courses
                                            .length, // Số lượng card, có thể đến từ một danh sách động
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                              onTap: () {
                                                // Hành động khi nhấn vào card
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FlashCardScreen()),
                                                );
                                              },
                                              child: CourseCard(
                                                courseName: courses[index]
                                                    ['courseName'],
                                                termCount: courses[index]
                                                    ['termCount'],
                                                addedBy: courses[index]
                                                    ['addedBy'],
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              AppBar(
                                backgroundColor: Colors.transparent,
                                automaticallyImplyLeading: false,
                                elevation: 0,
                                title: Text('Quizlet',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                                actions: [
                                  IconButton(
                                    icon: const Icon(Icons.notifications,
                                        color: Colors.white),
                                    onPressed: () {
                                      // Xử lý khi nút thông báo được nhấn
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText:
                                        'Học phần, sách giáo khoa, câu hỏi',
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
                    ),
                    const ClassroomScreen(), // Màn hình lớp học
                    const Text("aa"),
                    const LibraryScreen(),
                    const ProfileScreen(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.deepPurple,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            _showAddOptions(context);
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Lời giải'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Thêm'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Thư viện'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Hồ sơ'),
        ],
      ),
    );
  }

  void _showAddOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.widgets),
                  title: const Text('Học phần'),
                  onTap: () {
                    Navigator.pop(context); // Đóng bottom sheet
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddModuleScreen()),
                    ); // Điều hướng đến màn hình thêm học phần
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.folder),
                  title: const Text('Thư mục'),
                  onTap: () {
                    Navigator.pop(context); // Đóng bottom sheet
                    FolderDialog.showAddFolderDialog(
                        context); // Điều hướng đến màn hình thêm học phần
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text('Lớp học'),
                  onTap: () {
                    Navigator.pop(context); // Đóng bottom sheet
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewClassScreen()),
                    ); // Điều hướng đến màn hình thêm học phần
                  },
                ),
              ],
            ),
          );
        });
  }
}
