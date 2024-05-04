import 'package:flutter/material.dart';
import 'package:quizz_app/constants/image_strings.dart';
import 'package:quizz_app/constants/sizes.dart';
import 'package:quizz_app/constants/text_strings.dart';
import 'package:quizz_app/features/authenticaiton/screens/login/login_screen.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: AssetImage(welcomeScreen),
            height: height * 0.6,
          ),
          Text(
            tWelcome,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            tWelcomeSubTiltle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        foregroundColor: Colors.black,
                        primary: Colors.black,
                        side: BorderSide(color: Colors.black),
                        padding: EdgeInsets.symmetric(vertical: tButtonSize)),
                    child: Text(tLogin.toUpperCase())),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.amber,
                        primary: Colors.black,
                        side: BorderSide(color: Colors.black),
                        padding: EdgeInsets.symmetric(vertical: tButtonSize)),
                    child: Text(tSignUp.toUpperCase())),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
