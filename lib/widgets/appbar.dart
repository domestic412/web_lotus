

// import 'package:flutter/material.dart';

// import '../assets/color.dart';
// import '../assets/style.dart';

// class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget  {
//   @override
//   Size get preferredSize => const Size.fromHeight(100);


//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       toolbarHeight: 50,
//       flexibleSpace: Container(
//         padding: EdgeInsets.all(7),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: 50,
//               padding: EdgeInsets.only(bottom: 5),
//               child: Image.asset('lib/assets/images/logo_appbar_web_lotus.png')
//               ),
//             Container(
//               width: 600,
//             ),
//             Container(
//               alignment: Alignment.bottomLeft,
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 30,
//                 padding: EdgeInsets.only(left: 10, right: 10),
//                 child: Text('Language', style: style18_black)),
//             ),
//             Row(
//               children: [
//                 Container(
//                   alignment: Alignment.bottomLeft,
//                   child: InkWell(
//                     onTap: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 30,
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: Text('VI', style: style18_black)),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.bottomLeft,
//                   child: InkWell(
//                     onTap: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 30,
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: Text('EN', style: style18_black)),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       title: Image.asset('lib/assets/images/logo_white_appbar_web_lotus.png',),
//       backgroundColor: MyColor.normalColor,
//     );
//   }
// }