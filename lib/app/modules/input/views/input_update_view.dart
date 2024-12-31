import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/input/controllers/input_controller.dart';

class InputUpdateView extends GetView<InputController> {
  const InputUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Makanan'),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 0, 255, 8), // Menambahkan warna AppBar
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future:
            controller.GetDataById(Get.arguments), // Ambil data berdasarkan ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var data = snapshot.data!.data() as Map<String, dynamic>;

              // Pastikan data tidak null
              controller.cNamaMakanan.text = data['nama_makanan'] ?? '';
              controller.cJumlah.text = data['jumlah'] ?? '';
              controller.cBerat.text = data['berat'] ?? '';
              controller.cKategory.text = data['kategory'] ?? '';

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: controller.cNamaMakanan,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Nama Makanan",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 255, 8)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: controller.cJumlah,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Jumlah Protein",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 255, 8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.tealAccent),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: controller.cBerat,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Berat (kg)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 255, 8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.tealAccent),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: controller.cKategory,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: "Kategori",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 255, 8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.tealAccent),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Pastikan controller.Update menerima data dengan baik
                            controller.Update(
                              controller.cNamaMakanan.text,
                              controller.cJumlah.text,
                              controller.cBerat.text,
                              controller.cKategory.text,
                              Get.arguments, // ID untuk memperbarui data
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            iconColor: Colors.green, // Warna latar belakang hijau
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            elevation: 5, // Memberikan bayangan
                          ),
                          child: Text("Ubah"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text("Data tidak ditemukan",
                    style: TextStyle(fontSize: 18)),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
