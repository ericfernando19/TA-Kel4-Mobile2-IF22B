import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HitungProteinController extends GetxController {
  final beratBadan = TextEditingController();
  final targetProtein = TextEditingController();
  final RxDouble hasilPerhitungan = 0.0.obs;
  final RxBool isCalculated = false.obs;

  void hitungProtein() {
    if (beratBadan.text.isNotEmpty) {
      double berat = double.parse(beratBadan.text);
      // Rumus: 1.6 gram protein per kg berat badan untuk aktivitas normal
      hasilPerhitungan.value = berat * 1.6;
      isCalculated.value = true;
    }
  }

  @override
  void onClose() {
    beratBadan.dispose();
    targetProtein.dispose();
    super.onClose();
  }
}

class HitungProteinView extends GetView<HitungProteinController> {
  HitungProteinView({Key? key}) : super(key: key);

  final controller = Get.put(HitungProteinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Protein'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Input Data',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: controller.beratBadan,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Berat Badan (kg)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.monitor_weight),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: controller.hitungProtein,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Hitung Kebutuhan Protein',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.isCalculated.value) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hasil Perhitungan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kebutuhan Protein Harian:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${controller.hasilPerhitungan.value.toStringAsFixed(1)} gram',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Rekomendasi Asupan:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildRecommendationItem(
                          'Pagi (30%)',
                          (controller.hasilPerhitungan.value * 0.3)
                              .toStringAsFixed(1),
                        ),
                        _buildRecommendationItem(
                          'Siang (40%)',
                          (controller.hasilPerhitungan.value * 0.4)
                              .toStringAsFixed(1),
                        ),
                        _buildRecommendationItem(
                          'Malam (30%)',
                          (controller.hasilPerhitungan.value * 0.3)
                              .toStringAsFixed(1),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return SizedBox();
            }),
            SizedBox(height: 20),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.green),
                        SizedBox(width: 8),
                        Text(
                          'Informasi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      '• Kebutuhan protein dihitung berdasarkan berat badan\n'
                      '• Perhitungan menggunakan standar 1.6 gram protein per kg berat badan\n'
                      '• Pembagian asupan protein direkomendasikan sesuai waktu makan\n'
                      '• Konsultasikan dengan ahli gizi untuk kebutuhan spesifik',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            '$value gram',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
