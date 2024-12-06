import 'package:get/get.dart';

class HistoryController extends GetxController {
  // List data history
  final historyData = <Map<String, String>>[
    {'name': 'Apel', 'weight': '0.5 kg', 'category': 'Protein Nabati'},
    {'name': 'Ayam', 'weight': '1.2 kg', 'category': 'Protein Hewani'},
    {'name': 'Susu', 'weight': '0.8 liter', 'category': 'Protein Hewani'},
    {'name': 'Tahu', 'weight': '0.3 kg', 'category': 'Protein Nabati'},
    {'name': 'Tempe', 'weight': '0.4 kg', 'category': 'Protein Nabati'},
  ].obs;

  // Ambil detail berdasarkan indeks
  Map<String, String> getDetail(int index) {
    return historyData[index];
  }
}
