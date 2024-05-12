import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/features/authenticaiton/controllers/signup_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController _signUpController = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              child: Text(
                'N',
                style: TextStyle(fontSize: 50.0),
              ),
              radius: 50,
            ),
            const Text(
              'cuongdt09061400730',
              style: TextStyle(fontSize: 30.0),
            ),
            const SizedBox(height: 16),
            _interactiveListItem(context, 'Thêm khóa học', Icons.cake),
            _interactiveListItem(context, 'Cài đặt của bạn', Icons.settings),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Hành động khi nút được nhấn, ví dụ: đăng xuất
                    _signUpController.logOut();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.blueColor, // Màu nền của nút
                    onPrimary: Colors.white, // Màu của chữ và biểu tượng
                    elevation: 2, // Độ nổi của nút
                    shape: RoundedRectangleBorder(
                      // Hình dạng của nút
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12), // Đệm cho nút
                  ),
                  child: Text(
                    'Đăng Xuất', // Văn bản hiển thị trên nút
                    style: TextStyle(
                      fontSize: 16, // Kích thước chữ
                      fontWeight: FontWeight.bold, // Độ đậm của chữ
                    ),
                  ),
                ),
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
