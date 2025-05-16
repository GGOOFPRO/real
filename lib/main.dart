import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real/view/camera_page.dart';
import 'package:real/view/login_page.dart';
import 'package:real/view/meme_page.dart';
import 'package:real/view/permission_page.dart';
import 'package:real/view/scanner_page.dart';
import 'package:real/view/sended.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Sent()),
        GetPage(name: '/sended', page: () => Sented()),
        GetPage(name: '/MEME', page: () => MemePage()),
        GetPage(name: '/permission', page: () => PermissionScreen()),
        GetPage(name: '/cam', page: () => CameraScreen()),
        GetPage(name: '/scanner', page: () => ScannerPage()),
      ],
    );
  }
}
