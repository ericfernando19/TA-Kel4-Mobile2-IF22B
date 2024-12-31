import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Stream untuk mendapatkan data secara realtime
  Stream<QuerySnapshot<Object?>> streamHistory() {
    CollectionReference history = firestore.collection('input');
    return history.orderBy('nama_makanan', descending: false).snapshots();
  }
}
