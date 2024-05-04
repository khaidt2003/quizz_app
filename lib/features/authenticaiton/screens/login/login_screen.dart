import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizz_app/constants/image_strings.dart';
import 'package:quizz_app/constants/sizes.dart';
import 'package:quizz_app/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                  image: AssetImage(welcomeScreen), height: size.height * 0.2),
              Text(tLogin, style: Theme.of(context).textTheme.headlineLarge),
              Text(tLogin, style: Theme.of(context).textTheme.bodyLarge),
              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0 - 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          suffixIcon: IconButton(
                              onPressed: null,
                              icon: Icon(Icons.remove_red_eye_sharp)),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text('Forgot Password?'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(tLogin.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
