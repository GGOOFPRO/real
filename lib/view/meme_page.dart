import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/api_controller.dart';
import '../widget/bottom_nav.dart';

class MemePage extends StatelessWidget {
  MemePage({super.key});
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MEME!!!"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(() {
                if (apiController.isMEMEING.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (apiController.teext.value.isNotEmpty) {
                  return Text(
                    apiController.teext.value,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                if (apiController.meme.value == null) {
                  return const SizedBox();
                }
                return Column(
                  children: [
                    Text(
                      apiController.meme.value!.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.network(
                      apiController.meme.value!.url,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 300,
                      fit: BoxFit.contain,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.error),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          apiController.fetchMeme();
        },
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
