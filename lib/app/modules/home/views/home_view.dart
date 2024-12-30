import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/dashboard/views/dashboard_view.dart';
import 'package:myapp/app/modules/history/views/history_view.dart';
import 'package:myapp/app/modules/input/views/input_view.dart';
import 'package:myapp/app/modules/profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class MainHomeView extends GetView<HomeController> {
  // Ganti nama kelas wrapper untuk menghindari konflik
  final cAuth = Get.find<AuthController>();

  MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView(); // Arahkan ke HomeView yang baru
  }
}

class HomeView extends StatefulWidget {
  // Ganti nama dari DashboardAdmin
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;

  final List<Map> _fragment = [
    {'title': 'Home', 'view': const DashboardView()},
    {'title': 'Input', 'view': const InputView()},
    {'title': 'History', 'view': const HistoryView()},
    {'title': 'Profile', 'view': const ProfileView()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fragment[_index]['view'], // Tampilan utama
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (selectedIndex) {
          setState(() => _index = selectedIndex);
        },
        backgroundColor: const Color.fromARGB(
            255, 0, 255, 8), // Mengatur warna background navbar
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 112, 112, 112),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Input',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}