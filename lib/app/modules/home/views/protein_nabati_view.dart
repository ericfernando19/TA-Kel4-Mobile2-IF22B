import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProteinNabatiView extends GetView {
  const ProteinNabatiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProteinNabatiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProteinNabatiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
