import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
// import 'package:get/get.dart';
import '../../../constants/api_key.dart';
import 'package:http/http.dart' as http;

class ChatGptController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final List<Map<String, String>> messages = [];
  String https = "https://api.openai.com/v1/chat/completions";

  Future chatGptResponse(String prompt) async {
    messages.add({'role': 'user', 'content': prompt});
    debugPrint('$messages');
    try {
      var res = await http.post(
        Uri.parse(https),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );
      debugPrint(res.statusCode.toString());
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        // content = content.trim();
        debugPrint(content);
        return content;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
