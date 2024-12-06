import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

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
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Ganti dengan URL gambar Anda
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
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
                _buildMenuItem(Icons.person, 'Edit Data Diri'),
                _buildMenuItem(Icons.lock, 'Ubah Password'),
                _buildMenuItem(Icons.star, 'Beri Rating Aplikasi'),
                _buildMenuItem(Icons.phone, 'Kontak Kami'),
                _buildMenuItem(
                    Icons.info, 'Ketentuan Layanan & Kebijakan Privasi'),
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

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        // Tambahkan aksi yang sesuai
      },
    );
  }
}
