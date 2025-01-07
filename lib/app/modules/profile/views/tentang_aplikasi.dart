import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penghitung Protein',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutPage(),
    );
  }
}
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Tentang Aplikasi Penghitung Protein',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Aplikasi ini dirancang untuk membantu pengguna menghitung kebutuhan protein harian.', 
              
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
             SizedBox(height: 20),
            Text(
              'Fitur Utama:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Kalkulator kebutuhan protein harian.\n'
              '2. Input Protein.\n'
              '3. Riwayat Protein.\n'
              '4.Informasi Protein Hewani dan Nabati.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
              SizedBox(height: 20),
            Text(
              'Pengembang: Tim Aplikasi Kesehatan',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}