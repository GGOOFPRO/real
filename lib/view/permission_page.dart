import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/permission_controller.dart';
import '../widget/bottom_nav.dart';

class PermissionScreen extends StatelessWidget {
  final PermissionController permissionController = Get.put(
    PermissionController(),
  );

  PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Permission Example")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Obx(
                () => Text(
                  permissionController.hasMicrophonePermission.value
                      ? "Microphone Permission Granted"
                      : "Microphone Permission Denied",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Obx(
                () => Text(
                  permissionController.hasLocationPermission.value
                      ? "Location Permission Granted"
                      : "Location Permission Denied",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Obx(
                () => Text(
                  permissionController.hasCameraPermission.value
                      ? "Camera Permission Granted"
                      : "Camera Permission Denied",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => permissionController.microphonePermission(),
            child: const Icon(Icons.mic),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => permissionController.cameraPermission(),
            child: const Icon(Icons.camera),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => permissionController.checkLocationPermission(),
            child: const Icon(Icons.location_on),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
