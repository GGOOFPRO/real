import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'dart:io';

import 'package:real/controller/permission_controller.dart';

class CameraControllerX extends GetxController {
  late CameraController cameraController;
  var cameras = <CameraDescription>[].obs;
  var isCameraInitialized = false.obs;
  var capturedImage = Rx<File?>(null);
  PermissionController permissionController = Get.put(PermissionController());

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }

  Future<void> initializeCamera() async {
    try {
      cameras.value = await availableCameras();
      if (cameras.isNotEmpty) {
        cameraController = CameraController(cameras[0], ResolutionPreset.high);
        await cameraController.initialize();
        isCameraInitialized.value = true;
      }
    } catch (e) {
      isCameraInitialized.value = false;
      // Optionally log or handle error
    }
  }

  Future<void> captureImage() async {
    try {
      if (!cameraController.value.isInitialized) return;
      final XFile file = await cameraController.takePicture();
      capturedImage.value = File(file.path);
    } catch (e) {
      // Optionally handle error
    }
  }
}
