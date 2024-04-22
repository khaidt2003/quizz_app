import 'package:flutter/material.dart';
import 'package:quizz_app/features/authenticaiton/screens/splash_screen/splash_screen.dart';
import 'package:quizz_app/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      home: const SplashScreen(),
    );
  }
}
