import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/paddings.dart';
import '../../../models/link.dart';

class AllLinks extends StatelessWidget {
  const AllLinks({
    Key? key,
  }) : super(key: key);

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
          const Text(
            "Quick links",
          ),
          SizedBox(
              width: double.infinity,
              child: CupertinoListSection(
                children: demoLinks
                    .map<CupertinoListTile>((e) => CupertinoListTile(
                          title: Text(e.title),
                          onTap: () async {
                            Uri lTemp = Uri.parse(e.url);
                            try {
                              await launchUrl(
                                lTemp,
                              );
                            } catch (e) {
                              debugPrint(e.toString());
                              debugPrint("Can't launch");
                            }
                          },
                          leading: SvgPicture.asset(
                            e.icon,
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
