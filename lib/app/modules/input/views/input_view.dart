import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/input_controller.dart';

class InputView extends GetView<InputController> {
  const InputView({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller untuk menangani input data
    final InputController controller = Get.put(InputController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Field 1: Nama Makanan
            TextField(
              controller: controller.field1Controller,
              decoration: InputDecoration(
                labelText: 'Nama Makanan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Add border radius
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Input Field 2: Berat Dikonsumsi
            TextField(
              controller: controller.field2Controller,
              decoration: InputDecoration(
                labelText: 'Berat Dikonsumsi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Add border radius
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Input Field 3: Kategori (Dropdown)
            DropdownButtonFormField<String>(
              value: controller.selectedCategory.isEmpty
                  ? null
                  : controller.selectedCategory,
              decoration: InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Add border radius
                ),
              ),
              items: controller.categories
                  .map((category) => DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectedCategory = value ?? '';
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a category';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            // Save Button with green background and styling
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  controller.saveData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Green background color
                  foregroundColor: Colors.black, // Text color on button
                  padding: const EdgeInsets.symmetric(
                      horizontal: 54, vertical: 12), // Padding for button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 19), // Font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
