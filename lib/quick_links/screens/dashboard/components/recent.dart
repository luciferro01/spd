import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spd/quick_links/controllers/recent_links_controller.dart';
import 'package:spd/quick_links/models/link.dart';

import '../../../../constants/paddings.dart';

import '../../../responsive.dart';
import 'file_info_card.dart';

class Recent extends StatelessWidget {
  const Recent({
    Key? key,
    required this.recentLinksController,
  }) : super(key: key);
  final recentLinksController;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    print("rebuild recent links");
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Links",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Obx(
          () => Responsive(
            mobile: FileInfoCardGridView(
              demoRecentLink: recentLinksController.recentLinks.value,
              crossAxisCount: size.width < 650 ? 2 : 5,
              childAspectRatio: size.width < 650 ? 1.3 : 1,
            ),
            tablet: FileInfoCardGridView(
              demoRecentLink: recentLinksController.recentLinks.value,
            ),
            desktop: FileInfoCardGridView(
              demoRecentLink: recentLinksController.recentLinks.value,
              childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
        )
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    required this.demoRecentLink,
    this.crossAxisCount = 5,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final List<dynamic> demoRecentLink;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoRecentLink.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          FileInfoCard(info: demoRecentLink[index]),
    );
  }
}
