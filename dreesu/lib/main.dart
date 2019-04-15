import 'package:dreesu/intro/intro_1.dart';
import 'package:dreesu/login/login1_birthday.dart';
import 'package:dreesu/login_signup_demo/sigin_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Intro1(),
      theme: ThemeData(
            primaryColor: Colors.white,
            hintColor: Colors.white),
      // home: Intro1(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(top: 25),
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                   Center(
//                     child: GestureDetector(
//                       onTap: () => Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (_) => Screen6())),
//                       child: Container(
//                         child: Stack(
//                           children: <Widget>[
//                             Center(
//                               child: Container(
//                                 height: 170,
//                                 width: 170,
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey[300],
//                                     borderRadius: BorderRadius.circular(85)),
//                               ),
//                             ),
//                             Center(
//                               child: ClipRRect(
//                                 child: Image.asset(
//                                   'images/home1.jpg',
//                                   height: 160,
//                                 ),
//                                 borderRadius: BorderRadius.circular(85),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Stack(
//                       children: <Widget>[
//                         Center(
//                           child: Container(
//                             height: 170,
//                             width: 170,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(85)),
//                           ),
//                         ),
//                         Center(
//                           child: ClipRRect(
//                             child: Image.asset(
//                               'images/home2.jpg',
//                               height: 160,
//                             ),
//                             borderRadius: BorderRadius.circular(85),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: GestureDetector(
//                       onTap: () => Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (_) => Screen5())),
//                       child: Stack(
//                         children: <Widget>[
//                           Center(
//                             child: Container(
//                               height: 170,
//                               width: 170,
//                               decoration: BoxDecoration(
//                                   color: Colors.grey[300],
//                                   borderRadius: BorderRadius.circular(85)),
//                             ),
//                           ),
//                           Center(
//                             child: ClipRRect(
//                               child: Image.asset(
//                                 'images/home3.jpg',
//                                 height: 160,
//                               ),
//                               borderRadius: BorderRadius.circular(85),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Stack(
//                       children: <Widget>[
//                         Center(
//                           child: Container(
//                             height: 170,
//                             width: 170,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(85)),
//                           ),
//                         ),
//                         Center(
//                           child: ClipRRect(
//                             child: Image.asset(
//                               'images/home4.jpg',
//                               height: 160,
//                             ),
//                             borderRadius: BorderRadius.circular(85),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: Stack(
//                       children: <Widget>[
//                         Center(
//                           child: Container(
//                             height: 170,
//                             width: 170,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(85)),
//                           ),
//                         ),
//                         Center(
//                           child: ClipRRect(
//                             child: Image.asset(
//                               'images/home5.jpg',
//                               height: 160,
//                             ),
//                             borderRadius: BorderRadius.circular(85),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: Stack(
//                       children: <Widget>[
//                         Center(
//                           child: Container(
//                             height: 170,
//                             width: 170,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(85)),
//                           ),
//                         ),
//                         Center(
//                           child: ClipRRect(
//                             child: Image.asset(
//                               'images/home6.jpg',
//                               height: 160,
//                             ),
//                             borderRadius: BorderRadius.circular(85),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (_) => Screen17()));
//               },
//               child: Stack(
//                 alignment: Alignment(0, -1),
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(top: 5),
//                     alignment: Alignment(0, -1),
//                     child: Image.asset('images/hometop.png'),
//                     height: 200,
//                     width: 240,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 5),
//                     alignment: Alignment(0, -1),
//                     child: Text(
//                       'Dreesu',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     padding: EdgeInsets.only(top: 10),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               child: Positioned(
//                 left: 30,
//                 bottom: 0,
//                 child: GestureDetector(
//                   onTap: () => Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (_) => Screen8_7())),
//                   child: Stack(
//                     children: <Widget>[
//                       Image.asset(
//                         'images/homebot.png',
//                         width: 300,
//                       ),
//                       Positioned(
//                         top: 10,
//                         left: 135,
//                         child: Image.asset(
//                           'images/up_arrow.png',
//                           height: 30,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 15, right: 20),
//               alignment: Alignment(1, -1),
//               child: GestureDetector(
//                 child: Image.asset('images/refresh.png'),
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (_) => MatchesScreen()));
//                 },
//               ),
//               height: 40,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BlackClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0.0, size.height);
//     path.lineTo(size.width / 2 - 30.0, size.height);

//     var firstControlPoint =
//         Offset(size.width / 2 + 175.0, size.height / 2 - 30.0);
//     var firstEndPoint = Offset(size.width / 2, 0.0);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     // path.lineTo(size.width / 2 + 75.0, size.height / 2 - 30.0);

//     path.lineTo(size.width / 2, 0.0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
