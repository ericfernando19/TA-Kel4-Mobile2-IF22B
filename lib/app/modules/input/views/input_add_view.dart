import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/input/controllers/input_controller.dart';

class InputAddView extends GetView<InputController> {
  const InputAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Makanan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 255, 8), // Warna AppBar
      ),
      body: Padding(
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
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 255, 8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 255, 8)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 255, 8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 255, 8)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 255, 8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.tealAccent),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 255, 8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 0, 255, 8)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
              SizedBox(height: 30),
              // Menambahkan widget Center agar tombol Simpan berada di tengah
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.add(
                      controller.cNamaMakanan.text,
                      controller.cJumlah.text,
                      controller.cBerat.text,
                      controller.cKategory.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    iconColor: const Color.fromARGB(
                        255, 0, 255, 8), // Warna hijau pada tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  child: Text("Simpan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
