import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProteinNabatiView extends StatelessWidget {
  const ProteinNabatiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protein Nabati'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jenis-Jenis Protein Nabati',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildProteinCard(
              'Kacang Kedelai',
              'Mengandung 28.6g protein per 100g',
              'Kacang kedelai merupakan sumber protein nabati terbaik dengan kandungan protein yang tinggi.',
              Icons.grass,
              Colors.green[100]!,
            ),
            _buildProteinCard(
              'Tempe',
              'Mengandung 20.8g protein per 100g',
              'Tempe adalah makanan fermentasi kedelai yang kaya protein dan mudah diserap tubuh.',
              Icons.lunch_dining,
              Colors.green[100]!,
            ),
            _buildProteinCard(
              'Tahu',
              'Mengandung 8g protein per 100g',
              'Tahu merupakan olahan kedelai yang rendah kalori namun tetap kaya akan protein.',
              Icons.restaurant,
              Colors.green[100]!,
            ),
            _buildProteinCard(
              'Kacang Merah',
              'Mengandung 23.6g protein per 100g',
              'Kacang merah tidak hanya kaya protein tapi juga mengandung serat dan mineral penting.',
              Icons.grain,
              Colors.green[100]!,
            ),
            _buildProteinCard(
              'Edamame',
              'Mengandung 11g protein per 100g',
              'Edamame adalah kedelai muda yang kaya protein dan rendah kalori.',
              Icons.eco,
              Colors.green[100]!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProteinCard(String title, String content, String description,
      IconData icon, Color backgroundColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.green, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        content,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}