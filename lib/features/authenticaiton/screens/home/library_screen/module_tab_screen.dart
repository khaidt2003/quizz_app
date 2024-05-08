import 'package:flutter/material.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/course_cards.dart';

class ModuleTabScreen extends StatelessWidget {
  const ModuleTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CourseCard(
                  courseName: "Toán cao cấp", termCount: 3, addedBy: "123"),
              CourseCard(
                  courseName: "Vật lý cơ bản", termCount: 5, addedBy: "456"),
              CourseCard(
                  courseName: "Hóa học nâng cao", termCount: 8, addedBy: "789"),
              CourseCard(
                  courseName: "Toán cao cấp", termCount: 3, addedBy: "123"),
              CourseCard(
                  courseName: "Vật lý cơ bản", termCount: 5, addedBy: "456"),
              CourseCard(
                  courseName: "Hóa học nâng cao", termCount: 8, addedBy: "789"),
              CourseCard(
                  courseName: "Toán cao cấp", termCount: 3, addedBy: "123"),
              CourseCard(
                  courseName: "Vật lý cơ bản", termCount: 5, addedBy: "456"),
              CourseCard(
                  courseName: "Hóa học nâng cao", termCount: 8, addedBy: "789"),
              // Thêm các CourseCard khác theo cùng mẫu
            ],
          ),
        ],
      ),
    );
  }
}
