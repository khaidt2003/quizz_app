import 'package:flutter/material.dart';

class NewClassScreen extends StatefulWidget {
  const NewClassScreen({super.key});

  @override
  _NewClassScreenState createState() => _NewClassScreenState();
}

class _NewClassScreenState extends State<NewClassScreen> {
  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _classDescriptionController =
      TextEditingController();
  bool _allowMembersToAdd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lớp mới', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: () {
              // Xử lý khi nút thông báo được nhấn
            },
          ),
        ],
        backgroundColor: Colors.blue, // Màu nền của AppBar
        iconTheme: IconThemeData(
          color: Colors.white, // Đặt màu biểu tượng trên AppBar là màu trắng
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _classNameController,
              decoration: InputDecoration(
                hintText:
                    'Nhập tên lớp', // Hiển thị khi trường rỗng và không được focus
                labelText:
                    'Tên lớp', // Hiển thị trên cùng khi trường được focus
                floatingLabelBehavior: FloatingLabelBehavior
                    .auto, // Tự động nâng label lên khi có focus
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _classDescriptionController,
              decoration: InputDecoration(
                hintText: 'Nhập mô tả lớp', // Tương tự như trên
                labelText: 'Mô tả',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                      'Cho phép thành viên lớp thêm học phần và thành viên mới'),
                ),
                Switch(
                  value: _allowMembersToAdd,
                  onChanged: (newValue) {
                    setState(() {
                      _allowMembersToAdd = newValue;
                    });
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
