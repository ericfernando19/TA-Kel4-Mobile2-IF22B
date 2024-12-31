import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/input/views/input_add_view.dart';
import 'package:myapp/app/modules/input/views/input_update_view.dart';
import '../controllers/input_controller.dart';

class InputView extends GetView<InputController> {
  void showOption(String id) async {
    await Get.dialog(
      SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        title: Text('Menu Options',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        children: [
          ListTile(
            onTap: () {
              Get.back();
              if (id.isNotEmpty) {
                Get.to(InputUpdateView(),
                    arguments: id, transition: Transition.rightToLeftWithFade);
              } else {
                Get.snackbar("Error", "ID tidak valid.");
              }
            },
            leading: Tooltip(
              message: 'Edit food data',
              child: Icon(Icons.edit_note, color: Colors.blue, size: 28),
            ),
            title: Text('Update Data',
                style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.delete(id);
            },
            leading: Tooltip(
              message: 'Delete food data',
              child: Icon(Icons.delete_outline, color: Colors.red, size: 28),
            ),
            title: Text('Delete Data',
                style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          ListTile(
            onTap: () => Get.back(),
            leading: Tooltip(
              message: 'Close menu',
              child: Icon(Icons.close, color: Colors.grey, size: 28),
            ),
            title: Text('Close', style: TextStyle(fontWeight: FontWeight.w500)),
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, color: Colors.white),
            SizedBox(width: 8),
            Text('Tambah Protein',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.withOpacity(0.1), Colors.white],
          ),
        ),
        child: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.StreamData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listAllDocs = snapshot.data?.docs ?? [];
              return listAllDocs.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: listAllDocs.length,
                      itemBuilder: (context, index) {
                        var data =
                            listAllDocs[index].data() as Map<String, dynamic>;
                        return Tooltip(
                          message: 'Tap for more options',
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: Card(
                              elevation: 4,
                              shadowColor: Colors.green.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data["nama_makanan"]}",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green.shade800,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                "Food Category",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              showOption(listAllDocs[index].id),
                                          icon: Icon(Icons.more_vert),
                                          color: Colors.green,
                                          tooltip: 'More options',
                                        ),
                                      ],
                                    ),
                                    Divider(height: 24),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildInfoItem(
                                          Icons.scale_outlined,
                                          "${data["berat"]} kg",
                                          'Weight',
                                        ),
                                        _buildInfoItem(
                                          Icons.egg_outlined,
                                          "${data["jumlah"]}g",
                                          'Protein',
                                        ),
                                        _buildInfoItem(
                                          Icons.category_outlined,
                                          "${data["kategory"]}",
                                          'Category',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.no_meals_outlined,
                              size: 80, color: Colors.green.withOpacity(0.5)),
                          SizedBox(height: 16),
                          Text(
                            "No Food Data Available",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Add your first food item",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
                strokeWidth: 3,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Add new food item',
        child: FloatingActionButton.extended(
          onPressed: () =>
              Get.to(InputAddView(), transition: Transition.fadeIn),
          label:
              Text('Add Food', style: TextStyle(fontWeight: FontWeight.bold)),
          icon: Icon(Icons.add_circle_outline),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Tooltip(
      message: label,
      child: Column(
        children: [
          Icon(icon, color: Colors.green.shade700),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green.shade800,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
