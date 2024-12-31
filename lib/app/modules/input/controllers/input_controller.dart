import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  late TextEditingController cNamaMakanan;
  late TextEditingController cJumlah;
  late TextEditingController cBerat;
  late TextEditingController cKategory;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference input = firestore.collection('input');
    return input.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference input = firestore.collection('input');
    return input.snapshots();
  }

  void add(
      String namaMakanan, String jumlah, String berat, String kategori) async {
    CollectionReference input = firestore.collection("input");

    try {
      await input.add({
        "nama_makanan": namaMakanan,
        "jumlah": jumlah,
        "berat": berat,
        "kategori": kategori,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data makanan",
          onConfirm: () {
            cNamaMakanan.clear();
            cJumlah.clear();
            cBerat.clear();
            cKategory.clear();
            Get.back();
            Get.back();
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Makanan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("input").doc(id);
    return docRef.get();
  }

  void Update(String namaMakanan, String jumlah, String berat, String kategori,
      String id) async {
    DocumentReference inputById = firestore.collection("input").doc(id);

    try {
      await inputById.update({
        "nama_makanan": namaMakanan,
        "jumlah": jumlah,
        "berat": berat,
        "kategori": kategori,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Makanan.",
        onConfirm: () {
          cNamaMakanan.clear();
          cJumlah.clear();
          cBerat.clear();
          cKategory.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Mengubah Data.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("input").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    cNamaMakanan = TextEditingController();
    cJumlah = TextEditingController();
    cBerat = TextEditingController();
    cKategory = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNamaMakanan.dispose();
    cJumlah.dispose();
    cBerat.dispose();
    cKategory.dispose();
    super.onClose();
  }
}
