import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final cAuth = Get.find<AuthController>();

  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 80),
              Center(
                child: Image.asset(
                  '../assets/images/protein.jpg', // Ganti dengan path gambar lokal
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Sign Up",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.cEmail,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.cPass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  cAuth.signup(controller.cEmail.text, controller.cPass.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 255, 19),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,  // Teks tidak bold
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
