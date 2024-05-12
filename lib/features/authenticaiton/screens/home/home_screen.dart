import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/features/authenticaiton/controllers/topics_controller.dart';
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
  final TopicsController _topicsController = Get.put(TopicsController());
  int _currentIndex = 0;

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
                                        const Text('Courses',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        InkWell(
                                          onTap: () {
                                            // Handle navigation to a screen that lists all courses
                                          },
                                          child: const Text('View All',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.blue)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    StreamBuilder<List<Map<String, dynamic>>>(
                                      stream: _topicsController
                                          .fetchCoursesStream(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        if (!snapshot.hasData ||
                                            snapshot.data!.isEmpty) {
                                          return Center(
                                              child:
                                                  Text('No courses available'));
                                        }
                                        return Container(
                                          height: 200,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              var course =
                                                  snapshot.data![index];
                                              List<dynamic>? words =
                                                  course['words'];
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            FlashCardScreen(
                                                              words: words!,
                                                            )),
                                                  );
                                                },
                                                child: CourseCard(
                                                  courseName:
                                                      course['courseName'],
                                                  termCount:
                                                      course['termCount'],
                                                  addedBy: course['addedBy'],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
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
                                      // Handle notifications button pressed
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Tìm Học Phần , Lời Giải',
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
                    const ClassroomScreen(),
                    const Text("Placeholder"),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang Chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Lời Giải'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Thêm'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Thư Viện'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Hồ Sơ'),
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
                  title: const Text('Tạo Học Phần'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddModuleScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.folder),
                  title: const Text('Tạo thư mục'),
                  onTap: () {
                    Navigator.pop(context);
                    FolderDialog.showAddFolderDialog(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text('Tạo Lớp Học'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewClassScreen()),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
