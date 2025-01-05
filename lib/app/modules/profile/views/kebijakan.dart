import 'package:flutter/material.dart';

class KebijakanDanPrivasi extends StatelessWidget {
  const KebijakanDanPrivasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan dan Privasi'),
        backgroundColor: Colors.blueAccent, // Warna app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul utama
              Text(
                'Kebijakan Privasi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),

              // Paragraf kebijakan privasi
              Text(
                'Kami menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi yang Anda berikan saat menggunakan aplikasi kami. Kebijakan ini menjelaskan jenis informasi yang kami kumpulkan, bagaimana kami menggunakannya, hak Anda sehubungan dengan data pribadi Anda, serta ketentuan penggunaan aplikasi.',
                style: TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),

              // Subjudul dan isi kebijakan
              _buildSection(
                title: '1. Informasi yang Kami Kumpulkan',
                content:
                    'Kami mengumpulkan informasi berikut saat Anda menggunakan aplikasi kami:\n'
                    '- Data Pengguna: Nama, alamat email, dan informasi lainnya yang Anda berikan secara sukarela.\n'
                    '- Data Penggunaan: Informasi tentang bagaimana Anda menggunakan aplikasi kami, termasuk interaksi dengan fitur penghitung protein.\n'
                    '- Data Perangkat: Informasi perangkat yang digunakan untuk mengakses aplikasi, seperti tipe perangkat, sistem operasi, dan ID perangkat.',
              ),
              SizedBox(height: 16),

              _buildSection(
                title: '2. Penggunaan Informasi',
                content:
                    'Kami menggunakan informasi yang kami kumpulkan untuk:\n'
                    '- Menyediakan dan meningkatkan fungsionalitas aplikasi penghitung protein.\n'
                    '- Menyesuaikan pengalaman pengguna dan memberikan rekomendasi yang relevan.\n'
                    '- Menghubungi Anda untuk memberi tahu pembaruan atau perubahan pada aplikasi.',
              ),
              SizedBox(height: 16),

              _buildSection(
                title: '3. Keamanan Data',
                content:
                    'Kami berkomitmen untuk melindungi data pribadi Anda dengan langkah-langkah keamanan yang sesuai, namun tidak ada metode pengiriman atau penyimpanan data yang sepenuhnya aman.',
              ),
              SizedBox(height: 16),

              _buildSection(
                title: '4. Berbagi Informasi',
                content:
                    'Kami tidak akan membagikan informasi pribadi Anda kepada pihak ketiga tanpa izin Anda, kecuali jika diwajibkan oleh hukum.',
              ),
              SizedBox(height: 16),

              _buildSection(
                title: '5. Hak Anda',
                content:
                    'Anda memiliki hak untuk mengakses, memperbarui, atau menghapus informasi pribadi yang kami miliki tentang Anda. Anda juga dapat menonaktifkan pengumpulan data jika diinginkan.',
              ),
              SizedBox(height: 16),

              _buildSection(
                title: '6. Penggunaan Aplikasi',
                content:
                    'Aplikasi ini hanya boleh digunakan untuk tujuan pribadi dan non-komersial. Anda setuju untuk tidak menggunakan aplikasi untuk tujuan yang melanggar hukum atau merugikan orang lain.',
              ),
              SizedBox(height: 16),

              _buildSection(
                title: '7. Akses ke Fitur',
                content:
                    'Kami memberikan akses terbatas dan tidak eksklusif kepada Anda untuk menggunakan aplikasi, tergantung pada jenis dan versi akun Anda.',
              ),
              SizedBox(height: 16),

              _buildSection(
                title: '8. Kewajiban Pengguna',
                content:
                    '- Anda bertanggung jawab atas informasi yang dimasukkan ke dalam aplikasi.\n'
                    '- Anda tidak boleh merusak, membobol, atau mengakses aplikasi dengan cara yang tidak sah.\n'
                    '- Anda setuju untuk tidak menyebarkan atau menggunakan informasi yang diperoleh dari aplikasi untuk tujuan yang tidak sah.',
              ),
              SizedBox(height: 16),

              _buildSection(
                title: '9. Pembatasan Tanggung Jawab',
                content:
                    'Kami tidak bertanggung jawab atas kerusakan atau kerugian yang timbul akibat penggunaan aplikasi, termasuk kesalahan dalam penghitungan protein yang disarankan. Penggunaan aplikasi sepenuhnya adalah risiko pengguna.',
              ),
              SizedBox(height: 16),

              _buildSection(
                title: '10. Perubahan pada Kebijakan',
                content:
                    'Kami berhak untuk mengubah kebijakan ini kapan saja tanpa pemberitahuan sebelumnya. Anda diharapkan untuk memeriksa kebijakan secara berkala untuk mengetahui pembaruan.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat bagian dengan subjudul dan isi kebijakan
  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 16, height: 1.6),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
