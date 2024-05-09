import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/home_screen.dart';
import 'package:quizz_app/features/authenticaiton/screens/on_boarding/onboarding.dart';
import 'package:quizz_app/firebase_options.dart';
import 'package:quizz_app/utils/theme/theme.dart';
import 'package:get/get.dart';

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

  // Khởi tạo Firebase với các thông tin cấu hình cụ thể
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      home: const OnBoarding(),
    );
  }
}
