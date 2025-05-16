import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Get.offAndToNamed('/');
            },
            child: const Text("Home"),
          ),
          TextButton(
            onPressed: () {
              Get.offAndToNamed('/MEME');
            },
            child: const Text("MEME"),
          ),
          TextButton(
            onPressed: () {
              Get.offAndToNamed('/permission');
            },
            child: const Text("Permission"),
          ),
          TextButton(
            onPressed: () {
              Get.offAndToNamed('/cam');
            },
            child: const Text("Camera"),
          ),
          TextButton(
            onPressed: () {
              Get.offAndToNamed('/scanner');
            },
            child: const Text("Scanner"),
          ),
        ],
      ),
    );
  }
}
