import 'package:TikTokUI/pages/home_page.dart';
import 'package:TikTokUI/theme/colors.dart';
import 'package:TikTokUI/widgets/actiontoolbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Image.asset(
      //     'assets/videocam.png',
      //     height: 100,
      //     width: 150,
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: ActionBar(),
    );
  }

  // Widget getBody() {
  //   return IndexedStack(
  //     index: pageIndex,
  //     children: <Widget>[
  //       HomePage(),
  //       //Screen2
  //       Center(
  //         child: Text(
  //           "Discover",
  //           style: TextStyle(
  //               color: black, fontSize: 20, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       //Screen3
  //       Center(
  //         child: Text(
  //           "Upload",
  //           style: TextStyle(
  //               color: black, fontSize: 20, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       //Screen4
  //       Center(
  //         child: Text(
  //           "Share With",
  //           style: TextStyle(
  //               color: black, fontSize: 20, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       //Screen5
  //       Center(
  //         child: Text(
  //           "Views",
  //           style: TextStyle(
  //               color: black, fontSize: 20, fontWeight: FontWeight.bold),
  //         ),
  //       )
  //     ],
  //   );
  // }

//   Widget getFooter() {
//     List bottomItems = [
//       {"i": FontAwesomeIcons.heart, "label": "", "isIcon": true},
//       {"i": Icons.message, "label": "", "isIcon": true},
//       {"i": "", "label": "", "isIcon": false},
//       {"i": FontAwesomeIcons.shareAlt, "label": "", "isIcon": true},
//       {"i": FontAwesomeIcons.eye, "label": "", "isIcon": true}
//     ];

//     return Container(
//       height: 80,
//       width: double.infinity,
//       decoration: BoxDecoration(color: appBgColor),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(bottomItems.length, (index) {
//             return bottomItems[index]['isIcon']
//                 ? InkWell(
//                     onTap: () {
//                       selectedTab(index);
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Icon(
//                           bottomItems[index]['i'],
//                           color: white,
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Center(
//                           child: Text(
//                             bottomItems[index]['label'],
//                             style: TextStyle(color: white, fontSize: 10),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 : InkWell(
//                     onTap: () {
//                       selectedTab(index);
//                     },
//                     child: Column(
//                       children: <Widget>[
//                         BigHeartIcon(),
//                       ],
//                     ));
//           }),
//         ),
//       ),
//     );
//   }

//   selectedTab(index) {
//     setState(() {
//       pageIndex = index;
//     });
//   }
}
