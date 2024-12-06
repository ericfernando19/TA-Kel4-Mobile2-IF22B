import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_history_view.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildHistoryCard(
              context: context,
              color: Colors.greenAccent.shade100,
              icon: Icons.eco,
              title: 'Desk 1',
              description: 'Deskripsi 1',
            ),
            _buildHistoryCard(
              context: context,
              color: Colors.yellow.shade100,
              icon: Icons.person,
              title: 'Desk 2',
              description: 'Deskripsi 2',
            ),
            _buildHistoryCard(
              context: context,
              color: Colors.pink.shade100,
              icon: Icons.person_outline,
              title: 'Desk 3',
              description: 'Deskripsi 3',
            ),
            _buildHistoryCard(
              context: context,
              color: Colors.blue.shade100,
              icon: Icons.person_pin,
              title: 'Desk 4',
              description: 'Deskripsi 4',
            ),
            _buildHistoryCard(
              context: context,
              color: Colors.grey.shade300,
              icon: Icons.person_add,
              title: 'Desk 5',
              description: 'Deskripsi 5',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        onTap: () {
          // Navigasi ke halaman detail saat kartu diklik
          Get.to(() => DetailHistoryView(
                title: title,
                description: description,
              ));
        },
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.black),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
