import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/link.dart';

class RecentLinksController extends GetxController {
  List<Link> recentLinks = (demoLinks.sublist(0, 5)).obs;
  @override
  onInit() {
    super.onInit();
    getRecentLinks();
  }

  setRecentLinks(Link e) {
    recentLinks.removeLast();
    recentLinks.insert(0, e);
    setRecentLinksInSharedPreferences();
  }

  Future getRecentLinks() async {
    // form shared preferences
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? list = pref.getStringList("recent_links");
    if (list != null) {
      recentLinks =
          demoLinks.where((element) => list.contains(element.title)).toList();
      print("list updated");
    } else {
      print("list is null");
    }
    return recentLinks;
  }

  Future setRecentLinksInSharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(
        "recent_links", recentLinks.map<String>((e) => e.title!).toList());
    print("list set");
    // form shared preferences
  }
}
