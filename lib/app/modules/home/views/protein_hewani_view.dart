import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProteinHewaniView extends StatelessWidget {
  const ProteinHewaniView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protein Hewani'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jenis-Jenis Protein Hewani',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildProteinCard(
              'Daging Sapi',
              'Mengandung 26g protein per 100g',
              'Daging sapi kaya akan protein berkualitas tinggi dan zat besi untuk membantu pembentukan sel darah merah.',
              Icons.lunch_dining,
              Colors.red[100]!,
            ),
            _buildProteinCard(
              'Daging Ayam',
              'Mengandung 31g protein per 100g',
              'Ayam adalah sumber protein rendah lemak dan mudah dicerna oleh tubuh.',
              Icons.dinner_dining,
              Colors.red[100]!,
            ),
            _buildProteinCard(
              'Ikan',
              'Mengandung 22g protein per 100g',
              'Ikan mengandung protein berkualitas tinggi dan asam lemak omega-3 yang baik untuk kesehatan jantung.',
              Icons.set_meal,
              Colors.red[100]!,
            ),
            _buildProteinCard(
              'Telur',
              'Mengandung 13g protein per 100g',
              'Telur merupakan sumber protein lengkap dengan semua asam amino esensial yang dibutuhkan tubuh.',
              Icons.egg,
              Colors.red[100]!,
            ),
            _buildProteinCard(
              'Susu',
              'Mengandung 3.4g protein per 100ml',
              'Susu mengandung protein berkualitas tinggi dan kalsium untuk kesehatan tulang.',
              Icons.coffee,
              Colors.red[100]!,
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
                  child: Icon(icon, color: Colors.red, size: 24),
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