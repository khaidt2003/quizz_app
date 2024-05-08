import 'package:flutter/material.dart';

class FlashCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // Chế độ tối
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ứng dụng của tôi'),
          backgroundColor: Colors.blueGrey, // Điều chỉnh màu sắc của AppBar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors
                      .deepPurple, // Sử dụng màu tối hơn cho khối nội dung
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    // Thêm bóng đổ để tăng độ sâu
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'FlashCard Example',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Thăng cấp với Q+ Nâng cấp ngay',
                style: TextStyle(fontSize: 18, color: Colors.yellowAccent),
              ),
              SizedBox(height: 20),
              Text(
                'Example cuongdt09061400730 2 thuật ngữ',
                style: TextStyle(fontSize: 16, color: Colors.grey[300]),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nhấn Thẻ ghi nhớ
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo, // Màu nút
                      onPrimary: Colors.white, // Màu chữ
                    ),
                    child: Text('Thẻ ghi nhớ'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nhấn Học
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Học'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nhấn Kiểm tra
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Kiểm tra'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
