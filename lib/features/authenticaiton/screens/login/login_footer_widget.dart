import 'package:flutter/material.dart';
import 'package:quizz_app/constants/image_strings.dart';
import 'package:quizz_app/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: Image(
                image: AssetImage(tGoogleLogoImage),
              ),
              onPressed: () {},
              label: Text(tGoogleSignIn)),
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextButton(
            onPressed: () {},
            child: Text.rich(TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                      text: tSignUp,
                      style: TextStyle(color: Colors.blue))
                ])))
      ],
    );
  }
}
