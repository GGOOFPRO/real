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

  Future<void> initializeCamera() async {
    cameras.value = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController = CameraController(cameras[0], ResolutionPreset.high);
      await cameraController.initialize();
      isCameraInitialized.value = true;
    }
  }

  Future<void> captureImage() async {
    if (!cameraController.value.isInitialized) return;
    final XFile file = await cameraController.takePicture();
    capturedImage.value = File(file.path);
  }
}
