import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spd/quick_links/screens/dashboard/components/recent.dart';

import '../../../constants/paddings.dart';
import '../../controllers/recent_links_controller.dart';
import '../../responsive.dart';
import 'components/header.dart';

import 'components/recent_files.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecentLinksController recentLinksController =
        Get.put(RecentLinksController());
    return SingleChildScrollView(
      primary: false,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          // const Header(),
          // const SizedBox(height: defaultPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Recent(
                      recentLinksController: recentLinksController,
                    ),
                    const SizedBox(height: defaultPadding),
                    AllLinks(
                      recentLinksController: recentLinksController,
                    ),
                  ],
                ),
              ),

              // On Mobile means if the screen is less than 850 we dont want to show it
            ],
          )
        ],
      ),
    );
  }
}
