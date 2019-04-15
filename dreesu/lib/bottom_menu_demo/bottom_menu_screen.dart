import 'package:dreesu/add_product_demo/add_product_screen.dart';
import 'package:dreesu/bottom_menu_demo/user_chat.dart';
import 'package:dreesu/dashboard_demo/dashboard_screen.dart';
import 'package:dreesu/login_signup_demo/services/authentication.dart';
import 'package:dreesu/login_signup_demo/sigin_screen.dart';
import 'package:dreesu/my_dresses_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomScreen extends StatefulWidget {
  final Widget child;

  BottomScreen({Key key, this.child}) : super(key: key);

  _BottomScreenState createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  FirebaseUser firebaseUser ;
  Future<FirebaseUser> isSignedIn() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      firebaseUser = await _auth.currentUser();
      print('${firebaseUser.uid}');
      return firebaseUser ;
  }
  @override
    void initState() {
      isSignedIn();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          child: IconButton(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            iconSize: 50,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => DashboardScreen()));
            },
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: FlatButton(
                  // padding: EdgeInsets.only(left: 50),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => AddProductScreen()));
                  },
                  child: Text('Upload Your Product',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )),
            Container(
              child: FlatButton(
                  padding: EdgeInsets.all(0),
                child: Text(
                  'Message',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=> UserChatScreen(firebaseUser: firebaseUser)));
                },
              ),
            ),
            Container(
                child: FlatButton(
                  // padding: EdgeInsets.only(left: 50),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => MyDressesScreenDemo(firebaseUser:firebaseUser)));
                  },
                  child: Text('My Dresses',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )),
                Container(
                child: FlatButton(
                  // padding: EdgeInsets.only(left: 50),
                  onPressed: () async {
                    Auth auth = Auth();
                    await auth.signOut();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SignInScreen()));
                  },
                  child: Text('LogOut',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )),
          ],
        ),
      ),
    );
  }
}
