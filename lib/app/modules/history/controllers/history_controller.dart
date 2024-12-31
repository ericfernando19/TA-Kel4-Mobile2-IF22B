import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final selectedCategory = ''.obs;
  final categories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    final QuerySnapshot snapshot = await firestore.collection('input').get();
    final Set<String> uniqueCategories = {};
    
    for (var doc in snapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      if (data['kategori'] != null) {
        uniqueCategories.add(data['kategori'].toString());
      }
    }
    
    categories.value = uniqueCategories.toList()..sort();
  }

  Stream<QuerySnapshot<Object?>> streamHistory() {
    CollectionReference history = firestore.collection('input');
    return history.orderBy('nama_makanan', descending: false).snapshots();
  }
}