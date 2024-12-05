import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/input/controllers/input_controller.dart';
import 'package:myapp/app/modules/input/views/input_view.dart';
import 'detail_history_view.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});

  final InputController controller = Get.find<InputController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.historyData.isEmpty) {
          return const Center(
            child: Text('No history available.'),
          );
        }
        return ListView.builder(
          itemCount: controller.historyData.length,
          itemBuilder: (context, index) {
            final item = controller.historyData[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(item['name'] ?? 'Unknown'),
                subtitle: Text(
                  'Berat: ${item['weight']} | Kategori: ${item['category']}',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigasi ke halaman detail
                  Get.to(() => DetailHistoryView(detail: item));
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const InputView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
