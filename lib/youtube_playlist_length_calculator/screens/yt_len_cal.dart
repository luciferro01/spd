import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:spd/youtube_playlist_length_calculator/controller/yt_len_cal_controller.dart';

class YtLengthCalculator extends StatelessWidget {
  YtLengthCalculator({super.key});
  final _controller = Get.put(YtLengthCalculatorController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Exam Helper',
          style: TextStyle(fontSize: 25),
        ),
      ),
      child: Container(
        height: height * 1.0,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: height * 0.088,
          left: width * 0.06,
          right: width * 0.06,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Paste your Link here 👇',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            CupertinoTextField(
              padding: const EdgeInsets.all(10),
              controller: _controller.controller,
              style: const TextStyle(
                fontSize: 21,
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            CupertinoButton.filled(
              onPressed: () {
                // _controller.playListId = _controller.controller.text
                //     .split('https://www.youtube.com/playlist?list=')
                //     .toString();
                _controller.playListId =
                    _controller.controller.text.substring(34);
                _controller.youtubePlaylist();
              },
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
