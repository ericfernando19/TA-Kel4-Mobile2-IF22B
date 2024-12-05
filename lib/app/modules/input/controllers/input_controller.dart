import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  // Controllers untuk setiap input field
  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();

  // Variabel untuk memilih kategori
  String selectedCategory = '';

  // Daftar kategori untuk dropdown
  final List<String> categories = [
    'Protein Hewani',
    'Protein Nabati',
  ];

  // Fungsi untuk menyimpan data
  void saveData() {
    final field1 = field1Controller.text;
    final field2 = field2Controller.text;

    // Logika untuk menyimpan data atau validasi
    if (field1.isEmpty || field2.isEmpty || selectedCategory.isEmpty) {
      Get.snackbar(
        'Error',
        'All fields are required!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      // Simpan data (bisa disimpan ke database atau backend)
      Get.snackbar(
        'Success',
        'Data saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Clear all fields
      field1Controller.clear();
      field2Controller.clear();
      selectedCategory = '';
    }
  }
}
