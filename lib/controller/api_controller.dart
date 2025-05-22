import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/meme.dart';

class ApiController extends GetxController {
  final Rxn<Meme> meme = Rxn<Meme>();
  var isMEMEING = false.obs;
  var teext = ''.obs;
  @override
  void onInit() {
    fetchMeme();
    super.onInit();
  }

  Future<void> fetchMeme() async {
    isMEMEING.value = true; // Set loading before request
    try {
      final response = await http.get(Uri.parse('https://meme-api.com/gimme'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        meme.value = Meme.fromJson(data);
        teext.value = '';
      } else {
        teext.value = "NIGGA PLEASE";
      }
    } catch (e) {
      teext.value = "NIGGA PLEASE";
    } finally {
      isMEMEING.value = false;
    }
  }
}
