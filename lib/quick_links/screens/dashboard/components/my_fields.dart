// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:spd/quick_links/controllers/recent_links_controller.dart';
// import 'package:spd/quick_links/models/link.dart';

// import '../../../../constants/paddings.dart';

// import '../../../responsive.dart';
// import 'file_info_card.dart';

// class RecentLinks extends StatelessWidget {
//   const RecentLinks({
//     Key? key,
//     required this.recentLinksController,
//   }) : super(key: key);
//   final RecentLinksController recentLinksController;

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "My Files",
//             ),
//             CupertinoButton(
//               padding: EdgeInsets.symmetric(
//                 horizontal: defaultPadding * 1.5,
//                 vertical:
//                     defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
//               ),
//               onPressed: () {},
//               child: Row(
//                 children: const [
//                   Icon(Icons.add),
//                   SizedBox(width: defaultPadding / 2),
//                   Text("Add New"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: defaultPadding),
//         Responsive(
//           mobile: FileInfoCardGridView(
//             recentLinksController: recentLinksController,
//             crossAxisCount: size.width < 650 ? 2 : 4,
//             childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1,
//           ),
//           tablet: FileInfoCardGridView(
//             recentLinksController: recentLinksController,
//           ),
//           desktop: FileInfoCardGridView(
//             recentLinksController: recentLinksController,
//             childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class FileInfoCardGridView extends StatelessWidget {
//   const FileInfoCardGridView({
//     Key? key,
//     required this.recentLinksController,
//     this.crossAxisCount = 4,
//     this.childAspectRatio = 1,
//   }) : super(key: key);
//   final RecentLinksController recentLinksController;

//   final int crossAxisCount;
//   final double childAspectRatio;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: recentLinksController.recentLinks.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         crossAxisSpacing: defaultPadding,
//         mainAxisSpacing: defaultPadding,
//         childAspectRatio: childAspectRatio,
//       ),
//       itemBuilder: (context, index) =>
//           FileInfoCard(info: recentLinksController.recentLinks[index]),
//     );
//   }
// }
