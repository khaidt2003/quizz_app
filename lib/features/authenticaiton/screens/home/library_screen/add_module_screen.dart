import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/features/authenticaiton/controllers/topics_controller.dart';
import 'package:quizz_app/repository/topic_repository/topic_repository.dart';
import 'term_definition_card.dart'; // Đảm bảo import đúng đường dẫn

class AddModuleScreen extends StatefulWidget {
  const AddModuleScreen({super.key});

  @override
  State<AddModuleScreen> createState() => _AddModuleScreenState();
}

class _AddModuleScreenState extends State<AddModuleScreen> {
  final TopicsController _topicsController = Get.put(TopicsController());
  List<TextEditingController> _termControllers = [];
  List<TextEditingController> _definitionControllers = [];
  TextEditingController _topicNameController = TextEditingController();

  bool _allowMembersToAdd = false;

  @override
  void initState() {
    super.initState();
    // Khởi tạo hai card ban đầu
    Get.put(TopicRepository());
    addCard();
    addCard();
  }

  void addCard() {
    _termControllers.add(TextEditingController());
    _definitionControllers.add(TextEditingController());
  }

  @override
  void dispose() {
    // Đảm bảo giải phóng tài nguyên của các controllers
    for (var controller in _termControllers) {
      controller.dispose();
    }
    for (var controller in _definitionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Tạo học phần',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.of(context).pop(), // Quay lại màn hình trước
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings), // Biểu tượng lưu
              onPressed: () {
                // Thêm hành động lưu dữ liệu
                print('Save button pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.check), // Biểu tượng chia sẻ
              onPressed: () {
                _topicsController.saveTopicWithWords(
                    _topicNameController.text,
                    _allowMembersToAdd,
                    _termControllers,
                    _definitionControllers);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _topicNameController,
                  decoration: InputDecoration(
                    hintText: 'chủ đề, chương, đơn vị',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Danh sách học phần'),
                    Row(
                      children: [
                        Text('Chế độ riêng tư'),
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
                ...List.generate(_termControllers.length, (index) {
                  return TermDefinitionCard(
                    termController: _termControllers[index],
                    definitionController: _definitionControllers[index],
                  );
                }),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              addCard();
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
