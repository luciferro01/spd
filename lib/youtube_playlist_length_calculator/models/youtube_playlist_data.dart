import 'dart:convert';

YoutubePlaylistData youtubePlaylistDataFromJson(String str) =>
    YoutubePlaylistData.fromJson(json.decode(str));

String youtubePlaylistDataToJson(YoutubePlaylistData data) =>
    json.encode(data.toJson());

class YoutubePlaylistData {
  YoutubePlaylistData({
    required this.items,
  });

  List<Item> items;

  factory YoutubePlaylistData.fromJson(Map<String, dynamic> json) =>
      YoutubePlaylistData(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.contentDetails,
  });

  ContentDetails contentDetails;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "contentDetails": contentDetails.toJson(),
      };
}

class ContentDetails {
  ContentDetails({
    required this.videoId,
  });

  String videoId;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
      };
}
