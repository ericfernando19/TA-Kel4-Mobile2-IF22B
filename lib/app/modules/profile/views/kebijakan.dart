import 'package:flutter/material.dart';

class KebijakanDanPrivasi extends StatelessWidget {
  const KebijakanDanPrivasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan dan Privasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kebijakan Privasi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
             Text(
  
  'Kami di [Nama Aplikasi] menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi yang Anda berikan saat menggunakan aplikasi kami. Kebijakan ini menjelaskan jenis informasi yang kami kumpulkan, bagaimana kami menggunakannya, hak Anda sehubungan dengan data pribadi Anda, serta ketentuan penggunaan aplikasi.\n\n'
  '1. Informasi yang Kami Kumpulkan\n'
  'Kami mengumpulkan informasi berikut saat Anda menggunakan aplikasi kami:\n'
  '- Data Pengguna: Nama, alamat email, dan informasi lainnya yang Anda berikan secara sukarela.\n'
  '- Data Penggunaan: Informasi tentang bagaimana Anda menggunakan aplikasi kami, termasuk interaksi dengan fitur penghitung protein.\n'
  '- Data Perangkat: Informasi perangkat yang digunakan untuk mengakses aplikasi, seperti tipe perangkat, sistem operasi, dan ID perangkat.\n\n'
  '2. Penggunaan Informasi\n'
  'Kami menggunakan informasi yang kami kumpulkan untuk:\n'
  '- Menyediakan dan meningkatkan fungsionalitas aplikasi penghitung protein.\n'
  '- Menyesuaikan pengalaman pengguna dan memberikan rekomendasi yang relevan.\n'
  '- Menghubungi Anda untuk memberi tahu pembaruan atau perubahan pada aplikasi.\n\n'
  '3. Keamanan Data\n'
  'Kami berkomitmen untuk melindungi data pribadi Anda dengan langkah-langkah keamanan yang sesuai, namun tidak ada metode pengiriman atau penyimpanan data yang sepenuhnya aman.\n\n'
  '4. Berbagi Informasi\n'
  'Kami tidak akan membagikan informasi pribadi Anda kepada pihak ketiga tanpa izin Anda, kecuali jika diwajibkan oleh hukum.\n\n'
  '5. Hak Anda\n'
  'Anda memiliki hak untuk mengakses, memperbarui, atau menghapus informasi pribadi yang kami miliki tentang Anda. Anda juga dapat menonaktifkan pengumpulan data jika diinginkan.\n\n'
  '6. Penggunaan Aplikasi\n'
  'Aplikasi ini hanya boleh digunakan untuk tujuan pribadi dan non-komersial. Anda setuju untuk tidak menggunakan aplikasi untuk tujuan yang melanggar hukum atau merugikan orang lain.\n\n'
  '7. Akses ke Fitur\n'
  'Kami memberikan akses terbatas dan tidak eksklusif kepada Anda untuk menggunakan aplikasi, tergantung pada jenis dan versi akun Anda.\n\n'
  '8. Kewajiban Pengguna\n'
  '- Anda bertanggung jawab atas informasi yang dimasukkan ke dalam aplikasi.\n'
  '- Anda tidak boleh merusak, membobol, atau mengakses aplikasi dengan cara yang tidak sah.\n'
  '- Anda setuju untuk tidak menyebarkan atau menggunakan informasi yang diperoleh dari aplikasi untuk tujuan yang tidak sah.\n\n'
  '9. Pembatasan Tanggung Jawab\n'
  'Kami tidak bertanggung jawab atas kerusakan atau kerugian yang timbul akibat penggunaan aplikasi, termasuk kesalahan dalam penghitungan protein yang disarankan. Penggunaan aplikasi sepenuhnya adalah risiko pengguna.\n\n'
  '10. Perubahan pada Kebijakan\n'
  'Kami berhak untuk mengubah kebijakan ini kapan saja tanpa pemberitahuan sebelumnya. Anda diharapkan untuk memeriksa kebijakan secara berkala untuk mengetahui pembaruan.',
  style: TextStyle(fontSize: 16),
)

            ],
          ),
        ),
      ),
    );
  }
}
