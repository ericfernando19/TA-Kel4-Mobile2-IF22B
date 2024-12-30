import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'ubah_add_view.dart'; // Import halaman UbahPasswordView

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Ganti dengan URL gambar Anda
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Galih Pribadi Utomo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '727101710340001',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Menu items
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(
                  icon: Icons.person,
                  title: 'Edit Data Diri',
                  onTap: () {
                    // Aksi untuk Edit Data Diri
                  },
                ),
                _buildMenuItem(
                  icon: Icons.lock,
                  title: 'Ubah Password',
                  onTap: () {
                    // Navigasi ke halaman Ubah Password
                    Get.to(() => const UbahAddView());
                  },
                ),
                _buildMenuItem(
                  icon: Icons.star,
                  title: 'Beri Rating Aplikasi',
                  onTap: () {
                    // Aksi untuk Beri Rating
                  },
                ),
                _buildMenuItem(
                  icon: Icons.phone,
                  title: 'Kontak Kami',
                  onTap: () {
                    // Aksi untuk Kontak Kami
                  },
                ),
                _buildMenuItem(
                  icon: Icons.info,
                  title: 'Ketentuan Layanan & Kebijakan Privasi',
                  onTap: () {
                    // Aksi untuk Ketentuan Layanan
                  },
                ),
              ],
            ),
          ),

          // Logout button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextButton(
              onPressed: () {
                // Tambahkan logika logout di sini
              },
              child: const Text(
                'LOG OUT',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
