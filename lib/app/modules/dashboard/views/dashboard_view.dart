import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Adding space at the top
              const SizedBox(height: 40), // Adds space from the top

              // Greeting Text
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hallo Selamat Datang',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.search, color: Colors.black),
                ],
              ),
              const SizedBox(height: 8),

              // Health Status Header
              const Text(
                'Jaga Kesehatanmu Sekarang',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),

              // Protein Section with Circular Progress
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Protein'),
                      SizedBox(height: 10),
                      CircularProgressIndicator(
                        value: 0.6,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation(Colors.teal),
                      ),
                      SizedBox(height: 8),
                      Text('60% Tempe, 40% Telor, 20% Susu'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Graph Status Section (Bar chart / Line chart like in image)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildGraphCard('65%', 'Status'),
                  _buildGraphCard('65%', 'Status'),
                ],
              ),
              const SizedBox(height: 30),

              // Category Section
              const Text('Category', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryCard(
                    imagePath: '../assets/images/hewani.png',
                    label: 'Protein Hewani',
                  ),
                  _buildCategoryCard(
                    imagePath:
                        'https://png.pngtree.com/png-vector/20241105/ourmid/pngtree-natural-plant-based-protein-powder-with-ingredients-on-table-healthy-food-png-image_14230458.png',
                    label: 'Protein Nabati',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGraphCard(String percentage, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      width: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            percentage,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({String? imagePath, required String label}) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: imagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                )
              : const Center(
                  child: Icon(Icons.category, color: Colors.green),
                ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
