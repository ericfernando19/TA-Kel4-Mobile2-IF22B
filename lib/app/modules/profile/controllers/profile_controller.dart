import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  // Observable variables for profile data
  final userName = 'Galih Pribadi Utomo'.obs;
  final userId = '727101710340001'.obs;

  @override
  void onInit() {
    super.onInit();
    // You can load initial data here if needed
    // loadProfileData();
  }

  // Method to update profile information
  void updateProfile(String name, String id) {
    userName.value = name;
    userId.value = id;
    
    // Show success message
    Get.snackbar(
      'Sukses',
      'Data profil berhasil diperbarui',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  // Optional: Method to load profile data from backend/storage
  // Future<void> loadProfileData() async {
  //   try {
  //     // Add your data loading logic here
  //     // Example:
  //     // final userData = await getUserProfile();
  //     // userName.value = userData.name;
  //     // userId.value = userData.id;
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Gagal memuat data profil',
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  // Optional: Method to save profile data to backend/storage
  // Future<void> saveProfileToBackend(String name, String id) async {
  //   try {
  //     // Add your API call here
  //     // Example:
  //     // await apiService.updateProfile(name, id);
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Gagal menyimpan data profil',
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }
}