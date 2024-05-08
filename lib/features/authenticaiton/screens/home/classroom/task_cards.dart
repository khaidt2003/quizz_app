import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const TaskCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 60,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: () {
            // Xử lý khi nút "Lời giải đã xác minh" được nhấn
          },
          child: Text('Lời giải đã xác minh'),
        ),
      ),
    );
  }
}
