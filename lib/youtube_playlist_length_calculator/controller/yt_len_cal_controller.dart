import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../keys.dart';
import 'dart:convert';
import 'dart:core';
import '../models/youtube_playlist_data.dart';

const playListUrl =
    "https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&maxResults=500&fields=items/contentDetails/videoId&key=";

class YtLengthCalculatorController extends GetxController {
  var controller = TextEditingController();
  List<YoutubePlaylistData> videoIdList = [];
  late String playListId;

  youtubePlaylist() async {
    var res = await http
        .get(Uri.parse('$playListUrl$ytApiKey&playlistId=$playListId'));

    var data = jsonDecode(res.body.toString());
    try {
      if (res.statusCode == 200) {
        debugPrint(data);
        // debugPrint(data['items'][0]['contentDetails']['videoId']);
        // for (Map<String, dynamic> i in (data['items'].length)) {
        //   videoIdList.add(data['items'][i]);
        // }
        for (Map<String, dynamic> index in data) {
          videoIdList.add(YoutubePlaylistData.fromJson(index));
        }
        debugPrint(videoIdList.toString());
        // print(
        //   data['items'].forEach(
        //     (e) => videoIdList.add(
        //       data['items'][e]['contentDetails']['videoId'],
        //     ),
        // ),
        // );
        debugPrint(videoIdList.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
