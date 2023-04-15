import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:spd/constants/api_key.dart';
import 'dart:convert';
import 'dart:core';

const playListUrl =
    "https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&maxResults=500&fields=items/contentDetails/videoId,nextPageToken,pageInfo&key=";

class YtLengthCalculatorController extends GetxController {
  var controller = TextEditingController();
  List<String> videoIdList = [];
  late String playListId;

  youtubePlaylist() async {
    var res = await http
        .get(Uri.parse('$playListUrl$ytApiKey&playlistId=$playListId'));

    try {
      if (res.statusCode == 200) {
        var body = res.body;
        print(body);
        var data = jsonDecode(body);
        debugPrint(data);
        debugPrint(data['items'][0]['contentDetails']['videoId']);
        // for (dynamic i in (data['items'].length)) {
        //   videoIdList.add(data['items'][i]['contentDetails']['videoId']);
        // }
        print(
          data['items'].forEach(
            (e) => videoIdList.add(
              data['items'][e]['contentDetails']['videoId'],
            ),
          ),
        );
        debugPrint(videoIdList.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
