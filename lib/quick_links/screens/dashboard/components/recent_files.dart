import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spd/gpt_advanced/main.dart';
import 'package:spd/quick_links/controllers/recent_links_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/paddings.dart';
import '../../../models/link.dart';

class AllLinks extends StatelessWidget {
  const AllLinks({Key? key, required this.recentLinksController})
      : super(key: key);
  final RecentLinksController recentLinksController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: secondaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.infinity,
              child: CupertinoListSection(
                topMargin: 0,
                backgroundColor: softwhite,
                header: Text(
                  "Quick links",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                footer: Text("NOTE : None of the links are affiliated with us"),
                children: demoLinks
                    .map<CupertinoListTile>((e) => CupertinoListTile(
                          title: Text(e.title!),
                          subtitle: Text(e.description!),
                          onTap: () async {
                            Uri lTemp = Uri.parse(e.url!);
                            try {
                              await launchUrl(
                                lTemp,
                              );
                              // update recent links
                              recentLinksController.setRecentLinks(e);
                            } catch (e) {
                              debugPrint(e.toString());
                              debugPrint("Can't launch");
                            }
                          },
                          leading: SvgPicture.asset(
                            e.icon!,
                            height: 30,
                            width: 30,
                          ),
                        ))
                    .toList(),
              )),
        ],
      ),
    );
  }
}
