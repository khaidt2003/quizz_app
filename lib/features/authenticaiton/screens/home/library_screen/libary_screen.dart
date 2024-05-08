import 'package:flutter/material.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/add_folder_dialog.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/add_module_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/classroom_tab_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/folder_tab_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/module_tab_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/library_screen/new_class_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text(
          'Thư viện',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              _showDialogBasedOnTab(context);
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.7),
          tabs: const [
            Tab(text: 'Học phần'),
            Tab(text: 'Thư mục'),
            Tab(text: 'Lớp học'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ModuleTabScreen(),
          FolderTabScreen(),
          ClassroomTabScreen(),
        ],
      ),
    );
  }

  void _showDialogBasedOnTab(BuildContext context) {
    switch (_tabController.index) {
      case 0: // Tab Học phần
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddModuleScreen()),
        );
        break;
      case 1: // Tab Thư mục
        FolderDialog.showAddFolderDialog(context);
        break;
      case 2: // Tab Lớp học
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewClassScreen()),
        );
        break;
      default:
        break;
    }
  }
}
