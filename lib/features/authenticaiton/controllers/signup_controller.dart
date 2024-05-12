import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/features/authenticaiton/models/UserModel.dart';
import 'package:quizz_app/features/authenticaiton/screens/home/home_screen.dart';
import 'package:quizz_app/repository/authentication_repository/authentication_repository.dart';
import 'package:quizz_app/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final birthday = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void register(UserModel user) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(user.email!, user.password!);
  }

  Future<void> createUser(UserModel user) async {
    register(user);
    await userRepo.createUser(user);
    Get.to(() => const HomeScreen());
  }

  void logOut() {
    AuthenticationRepository.instance.logOut();
  }
}
