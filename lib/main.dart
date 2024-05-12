import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/home_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/on_boarding/onboarding.dart';
import 'package:quizz_app/firebase_options.dart';
import 'package:quizz_app/repository/authentication_repository/authentication_repository.dart';
import 'package:quizz_app/repository/topic_repository/topic_repository.dart';
import 'package:quizz_app/utils/theme/theme.dart';

MaterialColor customColor = const MaterialColor(0xFF4054AC, {
  50: Color.fromRGBO(64, 84, 172, .1),
  100: Color.fromRGBO(64, 84, 172, .2),
  200: Color.fromRGBO(64, 84, 172, .3),
  300: Color.fromRGBO(64, 84, 172, .4),
  400: Color.fromRGBO(64, 84, 172, .5),
  500: Color.fromRGBO(64, 84, 172, .6),
  600: Color.fromRGBO(64, 84, 172, .7),
  700: Color.fromRGBO(64, 84, 172, .8),
  800: Color.fromRGBO(64, 84, 172, .9),
  900: Color.fromRGBO(64, 84, 172, 1),
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthenticationRepository());
  Get.put(
      TopicRepository()); // Đặt AuthenticationRepository sau khi Firebase khởi tạo hoàn tất
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomeScreen(); // Người dùng đã đăng nhập
            }
            return const OnBoarding(); // Người dùng chưa đăng nhập
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                  child:
                      CircularProgressIndicator()), // Hiển thị màn hình loading
            );
          }
          return const Scaffold(
            body: Center(
              child: Text('Có lỗi xảy ra'), // Xử lý trường hợp có lỗi
            ),
          );
        },
      ),
    );
  }
}
