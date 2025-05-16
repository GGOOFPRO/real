import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  var hasLocationPermission = false.obs;
  var hasCameraPermission = false.obs;
  var hasMicrophonePermission = false.obs;

  Future<void> microphonePermission() async {
    var status = await Permission.microphone.status;
    if (status.isGranted) {
      hasMicrophonePermission.value = true;
    } else{
      await Permission.microphone.request();
      hasMicrophonePermission.value = await Permission.microphone.isGranted;
    }
  }

  Future<void> cameraPermission() async {
   var status = await Permission.camera.status;
   if (status.isGranted) {
     hasCameraPermission.value = true;
   } else {
     await Permission.camera.request();
     hasCameraPermission.value = await Permission.camera.isGranted;
   }
  }

  Future<void> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      hasLocationPermission.value = true;
    } else {
      await Permission.location.request();
      hasLocationPermission.value = await Permission.location.isGranted;
    }
  }
}