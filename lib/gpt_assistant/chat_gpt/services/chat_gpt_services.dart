import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../constants/api_key.dart';

class ChatGptServices extends GetConnect {
  final List<Map<String, String>> messages = [];
  String http = "https://api.openai.com/v1/chat/completions";

  Future chatGptResponse(String prompt) async {
    messages.add({'role': 'user', 'content': prompt});

    Response<dynamic> res = await post(http, {
      // {
      jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": messages,
      }),
      // },
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    });
    if (res.statusCode == 200) {
      String content = jsonDecode(res.body)['choices'][0]['message']['content'];
      content = content.trim();
      debugPrint(content);

      return content;
    }
  }
}
