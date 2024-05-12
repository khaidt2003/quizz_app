import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/features/authenticaiton/controllers/topics_controller.dart';
import 'package:quizz_app/features/authenticaiton/screens/flash_card/flash_card_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/course_cards.dart';

class ModuleTabScreen extends StatelessWidget {
  const ModuleTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TopicsController _topicsController = Get.put(TopicsController());
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: 'Tất cả',
                    onChanged: (newValue) {
                      // Handle dropdown selection
                    },
                    items: ['Tất cả', 'Item 1', 'Item 2', 'Item 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Bộ lọc',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Hôm nay',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: _topicsController.fetchCoursesStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No courses available'));
              }
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var course = snapshot.data![index];
                  List<dynamic>? words = course['words'];
                  return InkWell(
                    onTap: () {
                      print(snapshot.data!.length);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlashCardScreen(
                            words: words!,
                          ),
                        ),
                      );
                    },
                    child: CourseCard(
                      courseName: course['courseName'],
                      termCount: course['termCount'],
                      addedBy: course['addedBy'],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
