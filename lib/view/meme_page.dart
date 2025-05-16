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
              Obx(() => apiController.meme.value == null
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                children: [
                  Text(apiController.meme.value!.title, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  const SizedBox(height: 10,),
                  Image.network(apiController.meme.value!.url, width: 500,height: 500,),
                ],)
              ),
            ],
          ),
        ),
        ),
      floatingActionButton: ElevatedButton(onPressed: (){
        apiController.fetchMeme();
      }, child: const Text("ReMEME")),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
