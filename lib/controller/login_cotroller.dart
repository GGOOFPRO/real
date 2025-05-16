import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var nameController = TextEditingController();
  var numberController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
