import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Makanan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 255, 8),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data?.docs ?? [];
            return listAllDocs.isNotEmpty
                ? ListView.builder(
                    itemCount: listAllDocs.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      var data =
                          listAllDocs[index].data() as Map<String, dynamic>;
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Text(
                            "${data["nama_makanan"]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                "Protein: ${data["jumlah"]}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Berat: ${data["berat"]} kg",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Kategori: ${data["kategori"]}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      "Belum ada riwayat makanan",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
