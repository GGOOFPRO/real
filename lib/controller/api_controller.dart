import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/meme.dart';

class ApiController extends GetxController {
  final Rxn<Meme> meme = Rxn<Meme>();

  @override
  void onInit() {
    fetchMeme();
    super.onInit();
  }

  Future<void> fetchMeme() async {
    final response = await http.get(Uri.parse('https://meme-api.com/gimme'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      meme.value = Meme.fromJson(data);
    } else {
      Get.snackbar("Error", "Failed to load meme");
    }
  }
}
