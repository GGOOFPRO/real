import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../controller/permission_controller.dart';
import '../controller/scanner.controller.dart';
import '../widget/bottom_nav.dart';

class ScannerPage extends StatelessWidget {
  final ScannerController controller = Get.put(ScannerController());
  final PermissionController permissionController = Get.put(
    PermissionController(),
  );

  ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanner')),
      body: Obx(
        () => Stack(
          children: [
            if (permissionController.hasCameraPermission.value)
              MobileScanner(
                onDetect: (capture) {
                  final barcode = capture.barcodes.first.rawValue;
                  controller.handleBarcode(barcode);
                },
              )
            else
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!permissionController.hasCameraPermission.value)
                    ElevatedButton(
                      onPressed: () {
                        permissionController.cameraPermission();
                      },
                      child: const Text("scan"),
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      "waiting for camera permission",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.black,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.isScanned.value
                            ? "Scanned: ${controller.scanned.value}"
                            : "Scan a QR or Barcode",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (controller.isScanned.value)
                        ElevatedButton(
                          onPressed: controller.resetScan,
                          child: const Text('Scan Again'),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
