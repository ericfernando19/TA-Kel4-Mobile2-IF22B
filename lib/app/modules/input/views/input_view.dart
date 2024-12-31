import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/input/views/input_add_view.dart';
import 'package:myapp/app/modules/input/views/input_update_view.dart';
import '../controllers/input_controller.dart';

class InputView extends GetView<InputController> {
  void showOption(String id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              // Pastikan id yang diteruskan tidak null
              if (id.isNotEmpty) {
                Get.to(
                  InputUpdateView(),
                  arguments: id, // Pastikan ID valid
                  transition:
                      Transition.rightToLeftWithFade, // Animasi transisi
                );
              } else {
                Get.snackbar("Error", "ID tidak valid.");
              }
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.delete(id); // Menghapus data berdasarkan id
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input View'),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 0, 255, 8), // Mengganti warna AppBar
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.StreamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data?.docs ?? [];
            return listAllDocs.isNotEmpty
                ? ListView.builder(
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) {
                      var data =
                          listAllDocs[index].data() as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('${index + 1}'),
                                backgroundColor:
                                    Color.fromARGB(255, 248, 248, 248),
                              ),
                              title: Text(
                                "${data["nama_makanan"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4),
                                  Text("Berat: ${data["berat"]} kg"),
                                  Text("Jumlah Protein: ${data["jumlah"]}"),
                                  Text("Kategori: ${data["kategory"]}"),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () =>
                                    showOption(listAllDocs[index].id),
                                icon: Icon(Icons.more_vert),
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("Data Kosong", style: TextStyle(fontSize: 18)),
                  );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman InputAddView tanpa membawa argumen
          Get.to(InputAddView(), transition: Transition.fadeIn);
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(
            255, 0, 255, 8), // Mengganti warna tombol Add ke Hijau
        tooltip: 'Add New Item',
      ),
    );
  }
}
