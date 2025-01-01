import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/history/controllers/history_controller.dart';
import 'package:myapp/app/modules/input/controllers/input_controller.dart';
import 'package:myapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:myapp/app/utils/loading.dart';

import 'app/routes/app_pages.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Perbaikan di sini
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Inisialisasi AuthController
  Get.put(AuthController(), permanent: true);

  // Inisialisasi InputController
  Get.put(InputController(), permanent: true); // Inisialisasi InputController

  Get.lazyPut<HistoryController>(() => HistoryController());

  Get.lazyPut<ProfileController>(() => ProfileController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Get.find<AuthController>().streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: "Application",
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                    ? Routes.HOME
                    : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }
        return const Loading();
      },
    );
  }
}
