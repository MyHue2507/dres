import 'dart:async';

import 'package:dreesu/dashboard_demo/dashboard_screen.dart';
import 'package:dreesu/intro/intro_2_category.dart';
import 'package:dreesu/login_signup_demo/sigin_screen.dart';
import 'package:dreesu/screen1/screen1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Intro1 extends StatefulWidget {
  final Widget child;

  Intro1({Key key, this.child}) : super(key: key);

  _Intro1State createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
   FirebaseUser firebaseUser  ;
  void isSignedIn() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      firebaseUser = await _auth.currentUser();
  }
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  Future navigationPage() async {
    firebaseUser == null
        ? Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => SignInScreen()))
        : Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => DashboardScreen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
    isSignedIn();

  }
  // startTime() async {
  //   var _duration = new Duration(seconds: 5);
  //   return Timer(_duration, navigationPage);
  // }

  // Future navigationPage() async {
  //   Navigator.of(context)
  //       .pushReplacement(MaterialPageRoute(builder: (_) => Intro2Category()));
  // }

  // @override
  // void initState() {
  //   startTime();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     // Stack(
      //     //   children: <Widget>[
      //     //     Container(
      //     //       alignment: Alignment.center,
      //     //       child: Image.asset(
      //     //         'images/dress1_dresu_spash.png',
      //     //       ),
      //     //     ),
      //     //     Container(
      //     //       padding: EdgeInsets.only(top: 5),
      //     //       alignment: Alignment.center,
      //     //       child: Image.asset('images/dress3_dresu_splash.png'),
      //     //     ),
      //     //     Container(
      //     //       padding: EdgeInsets.only(top: 58),
      //     //       alignment: Alignment.bottomCenter,
      //     //       child: Image.asset('images/dress_dresu_spash.png'),
      //     //     ),
      //     //   ],
      //     // ),
      //     Container(
      //       // padding: EdgeInsets.only(top: 10),
      //       child: Text('DreS',style: TextStyle(color: Colors.white,fontSize :20)),
      //     ),
      //   ],
      // ),
      body: Center(child:
           Container(
            // padding: EdgeInsets.only(top: 10),
            child: Text('DreS',style: TextStyle(color: Colors.white,fontSize :20)),
          )),
    );
  }
}
