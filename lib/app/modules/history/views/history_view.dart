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
        title: const Text(
          'Riwayat Makanan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 255, 8),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedCategory.value.isEmpty ? null : controller.selectedCategory.value,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.green.shade200),
                    ),
                    hintText: 'Filter berdasarkan kategori',
                  ),
                  items: [
                    const DropdownMenuItem(
                      value: '',
                      child: Text('Semua Kategori'),
                    ),
                    ...controller.categories.map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    )),
                  ],
                  onChanged: (value) {
                    controller.selectedCategory.value = value ?? '';
                  },
                )),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: controller.streamHistory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var listAllDocs = snapshot.data?.docs ?? [];
                    var filteredDocs = controller.selectedCategory.value.isEmpty
                        ? listAllDocs
                        : listAllDocs.where((doc) {
                            var data = doc.data() as Map<String, dynamic>;
                            return data['kategori'] == controller.selectedCategory.value;
                          }).toList();

                    return filteredDocs.isNotEmpty
                        ? ListView.builder(
                            itemCount: filteredDocs.length,
                            padding: const EdgeInsets.all(16),
                            itemBuilder: (context, index) {
                              var data = filteredDocs[index].data() as Map<String, dynamic>;
                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.white, Colors.green.shade50],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 0, 255, 8).withOpacity(0.1),
                                        borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.restaurant,
                                            color: Colors.green.shade700,
                                            size: 24,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              "${data["nama_makanan"]}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          _buildInfoRow(
                                            Icons.science,
                                            "Protein",
                                            "${data["jumlah"]}",
                                          ),
                                          const SizedBox(height: 12),
                                          _buildInfoRow(
                                            Icons.scale,
                                            "Berat",
                                            "${data["berat"]} kg",
                                          ),
                                          const SizedBox(height: 12),
                                          _buildInfoRow(
                                            Icons.category,
                                            "Kategori",
                                            "${data["kategori"]}",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.no_food,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "Belum ada riwayat makanan",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 0, 255, 8),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.green.shade700,
        ),
        const SizedBox(width: 12),
        Text(
          "$label:",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}