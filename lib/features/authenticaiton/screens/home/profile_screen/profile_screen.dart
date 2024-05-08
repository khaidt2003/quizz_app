import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            CircleAvatar(
              child: Text(
                'N',
                style: TextStyle(fontSize: 50.0),
              ),
              radius: 50,
            ),
            Text(
              'cuongdt09061400730',
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(height: 16),
            _interactiveListItem(context, 'Thêm khóa học', Icons.cake),
            _interactiveListItem(context, 'Cài đặt của bạn', Icons.settings),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.whatshot),
                Text('Chuỗi 2 ngày'),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _interactiveListItem(
      BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Nền màu trắng cho Container
          borderRadius: BorderRadius.circular(10), // Bo tròn góc
          border: Border.all(
              color: Colors.grey.shade300), // Đường viền màu xám nhạt
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 2), // Đổ bóng
            ),
          ],
        ),
        child: ListTile(
          title: Text(title),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            // Điều hướng hoặc thực hiện hành động
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Hành động'),
                  content: Text('Bạn đã nhấn vào $title'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Đóng'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
