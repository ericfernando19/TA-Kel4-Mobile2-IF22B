import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import '../controllers/profile_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';



class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  final authController = Get.find<AuthController>();

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
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Obx(() => Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userName.value,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          controller.userId.value,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildMenuItem(
                  icon: Icons.person_outline,
                  title: 'Edit Data Diri',
                  onTap: () => _showEditProfileDialog(context),
                ),
                _buildMenuItem(
                  icon: Icons.lock_outline,
                  title: 'Reset Password',
                  onTap: () => _showResetPasswordDialog(context),
                ),
                  
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: const Text(
                    'LOG OUT',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    final nameController =
        TextEditingController(text: controller.userName.value);
    final idController = TextEditingController(text: controller.userId.value);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Data Diri'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.updateProfile(
                nameController.text,
                idController.text,
              );
              Navigator.pop(context);
              Get.snackbar(
                'Sukses',
                'Data profil berhasil diperbarui',
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showResetPasswordDialog(BuildContext context) {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Masukan email Anda untuk menerima link reset password',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (emailController.text.isNotEmpty) {
                authController.resetPassword(emailController.text);
                Navigator.pop(context);
                Get.snackbar(
                  'Sukses',
                  'Link reset password telah dikirim ke email Anda',
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              } else {
                Get.snackbar(
                  'Error',
                  'Masukan Email Yang Sudah Terdaftar',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('Kirim'),
          ),
        ],
      ),
    );
  }

 // <-- Kurung kurawal penutup ditambahkan untuk metode
}
