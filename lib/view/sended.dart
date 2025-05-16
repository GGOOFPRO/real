import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/bottom_nav.dart';

class Sented extends StatelessWidget {
  Sented({super.key});

  final Map<String, dynamic> data = Get.arguments as Map<String, dynamic>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Next Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${data['name']}"),
            Text("Number: ${data['number'].toString()}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(
                  '/',
                ); // Clears previous screens and moves to home
              },
              child: const Text("Go to Home"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
