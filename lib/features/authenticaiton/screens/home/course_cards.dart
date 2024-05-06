import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String courseName;
  final int termCount;
  final String addedBy;

  const CourseCard({
    Key? key,
    required this.courseName,
    required this.termCount,
    required this.addedBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Đặt độ cao để tạo bóng cho Card
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(courseName, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('$termCount thuật ngữ',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text('Thêm bởi $addedBy',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
