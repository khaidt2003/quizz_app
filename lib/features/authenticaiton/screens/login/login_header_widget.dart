import 'package:flutter/material.dart';
import 'package:quizz_app/constants/image_strings.dart';
import 'package:quizz_app/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(welcomeScreen), height: size.height * 0.2),
        Text(tLogin, style: Theme.of(context).textTheme.headlineLarge),
        Text(tSubTitleLogin, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
