import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:spd/developer_contribution/components/developer_tile.dart';
import 'package:spd/developer_contribution/data/developer_contribution_data.dart';

class DeveloperContributionScreen extends StatelessWidget {
  DeveloperContributionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<DeveloperTile> tiles = [
      DeveloperTile(
          width: width, height: height, e: developerContributionData[0]),
      DeveloperTile(
          width: width, height: height, e: developerContributionData[1]),
      DeveloperTile(
          width: width, height: height, e: developerContributionData[2])
    ];
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Developers',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      child: Container(
        margin: EdgeInsets.only(
            left: 10, right: 10, top: height * 0.12, bottom: height * 0.1),
        width: double.infinity,
        height: height * 0.8,
        child: CardSwiper(
          cardsCount: developerContributionData.length,
          cardBuilder: (context, index) => tiles[index],
        ),
      ),
      // child: Container(
      //   width: double.maxFinite,
      //   // height: height * 0.4,
      //   margin: EdgeInsets.only(top: height * 0.12),
      //   // child: Column(
      //   //   children: [
      //   //     ...developerContributionData
      //   //         .map((e) => developerTile(e, width, height)),
      //       // List.generate(
      //       //   developerContributionData.length,
      //       //   (index) => Column(
      //       //     children: [],
      //       //   ),
      //       // )
      //     // ],
      //   // ),
      // )
    );
  }
}
