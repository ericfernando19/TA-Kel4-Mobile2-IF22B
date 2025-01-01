import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HitungProteinView extends GetView {
  const HitungProteinView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HitungProteinView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HitungProteinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
