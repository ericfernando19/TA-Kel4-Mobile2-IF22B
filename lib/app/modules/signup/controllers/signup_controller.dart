import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  late TextEditingController cUsername;
  late TextEditingController cEmail;
  late TextEditingController cPass;

  @override
  void onInit() {
    super.onInit();
    cUsername = TextEditingController();
    cEmail = TextEditingController();
    cPass = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cUsername.dispose();
    cEmail.dispose();
    cPass.dispose();
    super.onClose();
  }
}