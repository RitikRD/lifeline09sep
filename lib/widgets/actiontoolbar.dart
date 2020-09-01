// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class ActionBar extends StatelessWidget {
//   // final String likes;
//   // final String comments;
//   // final String shares;
//   // // final String profileImg;
//   // // final String albumImg;
//   // const ActionBar({
//   //   Key key,
//   //   this.likes,
//   //   this.comments,
//   //   this.shares,
//   //   // this.profileImg,
//   //   // this.albumImg,
//   // }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//         //clipBehavior: Clip.antiAlias, //WithSaveLayer,
//         shape: CircularNotchedRectangle(),
//         child: Container(
//           height: 70,
//           color: Colors.black,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Icon(
//                     Icons.favorite,
//                     color: Colors.white,
//                     size: 28,
//                   ),
//                   Text(
//                     '',
//                     style: TextStyle(color: Colors.white),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 width: 2,
//               ),
//               Icon(
//                 FontAwesomeIcons.commentDots,
//                 color: Colors.white,
//                 size: 30,
//               ),
//               SizedBox(
//                 width: 40,
//               ),
//               Icon(
//                 FontAwesomeIcons.share,
//                 color: Colors.white,
//                 size: 28,
//               ),
//               SizedBox(
//                 width: 2,
//               ),
//               Icon(
//                 FontAwesomeIcons.solidEye,
//                 color: Colors.white,
//                 size: 28,
//               ),
//             ],
//           ),
//         ));
//   }
// }
