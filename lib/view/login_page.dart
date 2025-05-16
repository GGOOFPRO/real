import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_cotroller.dart';
import '../widget/bottom_nav.dart';

class Sent extends StatelessWidget {
  Sent({super.key});

  final Controller loginController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: loginController.nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: loginController.numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Number"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String numText = loginController.numberController.text;
                int? number = int.tryParse(numText);

                if (numText.isEmpty || number == null) {
                  Get.snackbar(
                    "Error",
                    "Please enter a valid number",
                  ); // Shows error
                } else {
                  Get.toNamed(
                    '/sended',
                    arguments: {
                      'name': loginController.nameController.text,
                      'number': number,
                    },
                  );
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
