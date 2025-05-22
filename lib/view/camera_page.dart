import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real/controller/permission_controller.dart';

import '../controller/camera_controller.dart';
import '../widget/bottom_nav.dart';

class CameraScreen extends StatelessWidget {
  final CameraControllerX controller = Get.put(CameraControllerX());
  final PermissionController permissionController = Get.put(
    PermissionController(),
  );
  CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GetX Camera")),
      body: Center(
        child: Obx(() {
          if (!permissionController.hasCameraPermission.value) {
            return const Text("Camera permission not granted.");
          }
          if (!controller.isCameraInitialized.value) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(child: CameraPreview(controller.cameraController)),
              if (controller.capturedImage.value != null)
                Image.file(controller.capturedImage.value!)
              else
                const Text("No image captured"),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.captureImage,
        child: const Icon(Icons.camera),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
