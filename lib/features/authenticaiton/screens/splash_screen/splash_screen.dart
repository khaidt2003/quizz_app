import 'package:flutter/material.dart';
import 'package:quizz_app/constants/image_strings.dart';
import 'package:quizz_app/constants/sizes.dart';
import 'package:quizz_app/constants/text_strings.dart';
import 'package:quizz_app/features/authenticaiton/screens/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    StartAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity, // Chiều rộng bằng với chiều rộng màn hình
            height: double.infinity, // Chiều cao bằng với chiều cao màn hình
            child: Stack(
              children: [
                Positioned(
                  top: 250, // Di chuyển hình ảnh xuống 130 pixels
                  left: 0,
                  right: 0,
                  child: Image(
                    image: AssetImage(tSplashImage),
                    fit: BoxFit
                        .contain, // Điều chỉnh hình ảnh để phù hợp mà không làm thay đổi tỷ lệ
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: animate ? 0 : -30,
              left: animate ? 0 : -30,
              child: Image(
                image: AssetImage(tSplashIcon),
              )),
          Positioned(
            top: 128,
            left: tDefaultSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tAppName,
                    style: Theme.of(context).textTheme.headlineSmall),
                Text(tAppDescription,
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: tDefaultSize,
            child: Container(
              width: tSplastContainerSize,
              height: tSplastContainerSize,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future StartAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        animate = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    });
  }
}
