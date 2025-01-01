import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProteinHewaniView extends GetView {
  const ProteinHewaniView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProteinHewaniView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProteinHewaniView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
