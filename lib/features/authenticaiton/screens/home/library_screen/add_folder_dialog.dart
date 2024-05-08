import 'package:flutter/material.dart';

class FolderDialog {
  static void showAddFolderDialog(BuildContext context) {
    final TextEditingController folderNameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tạo thư mục'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Tên thư mục:'),
                TextFormField(
                  controller: folderNameController,
                  decoration: InputDecoration(
                    hintText: 'Nhập tên thư mục',
                  ),
                ),
                SizedBox(height: 10),
                Text('Mô tả:'),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Nhập mô tả cho thư mục',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Hủy'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Thêm hành động lưu thư mục tại đây
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
