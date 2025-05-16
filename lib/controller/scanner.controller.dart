import 'package:get/get.dart';

class ScannerController extends GetxController {
  var isScanned = false.obs;
  var scanned = ''.obs;

  void handleBarcode(String? code) {
    if (code != null && code.isNotEmpty && !isScanned.value) {
      isScanned.value = true;
      scanned.value = code;
    }
  }

  void resetScan() {
    isScanned.value = false;
    scanned.value = '';
  }
}
