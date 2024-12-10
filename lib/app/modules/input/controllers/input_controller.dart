import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InputController extends GetxController {
  // Controller untuk input teks
  final field1Controller = TextEditingController(); // Nama Makanan
  final field2Controller = TextEditingController(); // Berat Dikonsumsi

  // Daftar kategori
  final List<String> categories = [
    'Protein Hewani',
    'Protein Nabati',
  ];

  // Kategori yang dipilih (reaktif)
  var selectedCategory = ''.obs; // Gunakan RxString untuk membuatnya reaktif

  // Data history (reaktif)
  var historyData = <Map<String, String>>[].obs;

  // Fungsi untuk menyimpan data input ke history
  void saveData() {
    // Validasi apakah semua field telah diisi
    if (field1Controller.text.isNotEmpty &&
        field2Controller.text.isNotEmpty &&
        selectedCategory.value.isNotEmpty) {
      // Tambahkan data ke history
      historyData.add({
        'name': field1Controller.text,
        'weight': field2Controller.text,
        'category': selectedCategory.value, // Gunakan .value untuk mengambil nilai RxString
      });

      // Reset input
      field1Controller.clear();
      field2Controller.clear();
      selectedCategory.value = ''; // Reset nilai kategori

      // Kembali ke halaman sebelumnya
      Get.back();
    } else {
      // Tampilkan snackbar jika input tidak lengkap
      Get.snackbar(
        'Error',
        'Please complete all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
