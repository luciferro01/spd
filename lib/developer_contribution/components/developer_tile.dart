import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spd/constants/gradients.dart';
import 'package:spd/constants/image_strings.dart';
import 'package:spd/developer_contribution/models/developer_contribution_model.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/colors.dart';

// Widget developerTile(
//     DeveloperContributionModel e, double width, double height) {
//   return Container(
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
//     width: width * 0.9,
//     child: Card(
//       elevation: 6,
//       child: Container(
//         margin: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage(e.profileImage),
//               radius: width * 0.3,
//             ),
//             SizedBox(
//               height: height * 0.02,
//             ),
//             SizedBox(
//               height: height * 0.004,
//             ),
//             Text(
//               e.name,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
//             ),
//             SizedBox(
//               height: height * 0.004,
//             ),
//             Text(
//               e.role,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//             SizedBox(
//               height: height * 0.001,
//             ),
//             Text(
//               e.designation.split(',')[0].toString(),
//               style: const TextStyle(
//                 fontSize: 18,
//                 color: Colors.blueGrey,
//               ),
//             ),
//             SizedBox(
//               height: height * 0.006,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               // crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SvgPicture.asset(
//                   linkedInSvg,
//                   height: width * 0.1,
//                 ),
//                 // SizedBox(width: width * 0.02),
//                 SvgPicture.asset(
//                   instagramSvg,
//                   height: width * 0.1,
//                 ),
//                 SvgPicture.asset(
//                   gitHubSvg,
//                   height: width * 0.09,
//                 ),
//                 SvgPicture.asset(
//                   twitterSvg,
//                   height: width * 0.1,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

class DeveloperTile extends StatelessWidget {
  final double width;
  final double height;
  final DeveloperContributionModel e;
  const DeveloperTile(
      {super.key, required this.width, required this.height, required this.e});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Container(
        // decoration: BoxDecoration(
        //   color: Colors.amber,

        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: Gradients.gentleCare,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: softBlack,
              blurRadius: 4,
              blurStyle: BlurStyle.normal,
              offset: Offset(2, 6),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 8,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(e.profileImage),
              radius: width * 0.3,
            ),
            const Spacer(
              flex: 3,
            ),
            Text(
              e.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              e.role,
              style: const TextStyle(
                fontSize: 16,
                // color: Colors.grey,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            FittedBox(
              child: Text(
                e.designation.split(',')[0].toString(),
                style: const TextStyle(
                  fontSize: 18,
                  // color: Colors.blueGrey,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.06),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: softBlack,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchUrl(
                        Uri.parse(e.linkedIn),
                      );
                    },
                    child: SvgPicture.asset(
                      linkedInSvg,
                      height: width * 0.1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(e.instagram));
                    },
                    child: SvgPicture.asset(
                      instagramSvg,
                      height: width * 0.1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(e.gitHub));
                    },
                    child: SvgPicture.asset(
                      gitHubSvg,
                      height: width * 0.09,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(e.twitter));
                    },
                    child: SvgPicture.asset(
                      twitterSvg,
                      height: width * 0.1,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
      back: Container(
        // decoration: BoxDecoration(
        //   color: Colors.amber,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: Gradients.gentleCare,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: softBlack,
              blurRadius: 4,
              blurStyle: BlurStyle.normal,
              offset: Offset(2, 6),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Spacer(
            //   flex: 8,
            // ),
            AnimatedTextKit(
              displayFullTextOnTap: true,
              animatedTexts: [
                TyperAnimatedText(
                  e.description,
                  textStyle: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.justify,
                  speed: const Duration(milliseconds: 50),
                )
              ],
            ),
            // const Spacer(
            //   flex: 3,
            // ),
          ],
        ),
      ),
    );
  }
}
