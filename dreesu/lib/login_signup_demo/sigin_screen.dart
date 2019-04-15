import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/dashboard_demo/dashboard_screen.dart';
import 'package:dreesu/intro/intro_1.dart';
import 'package:dreesu/login_signup_demo/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dreesu/login_signup_demo/signup_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // void _addNewUser(String userId, String userName, String email) async {
  //   final DocumentReference documentReference =
  //       Firestore.instance.document("users/$userId");
  //   Map<String, String> data = <String, String>{
  //     "email": email,
  //     "userId": userId,
  //     "username": userName
  //   };
  //   await documentReference.setData(data).whenComplete(() {
  //     print("Document Added");
  //   }).catchError((e) => print(e));
  // }

  Color _color = Colors.white;
  BaseAuth auth = Auth();
  String _errorMessage;
  bool _isLoading = false;
  String _userName;
  String _email;
  String _password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  

  

  Future<String> getEmail() async {
    await Firestore.instance
        .collection('userNameKey')
        .document(_userName)
        .get()
        .then((snapshot) {

      if (snapshot.exists == false) {
        setState(() {
          print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
          _isLoading = false;
          _email = "";
          _errorMessage = 'Username does not exist';
        });
      } else {
        var email = snapshot['email'];
        _email = email;
      }

      return _email;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _showCircularProgress() {
      if (_isLoading) {
        print('aaaaaaaaaaaaaaaa');
        return Center(child: CircularProgressIndicator());
      }
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
                // Align(
                //   child: Image.asset('images/Group 482.png',height: 100,),
                  
                //   alignment: Alignment(0, -0.6),
                // ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            icon: Image.asset(
                              'images/username_icon.png',
                              height: 19.44,
                            ),
                            hintText: 'User Name',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Colors.white)),
                        onChanged: (value) {
                          print(value);
                          _userName = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Image.asset(
                              'images/password_icon.png',
                              width: 17.61,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Colors.white)),
                        onChanged: (value) {
                          print(value);
                          _password = value;
                        },
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 5, left: 80),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "${_errorMessage ?? ""}",
                            style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 40, left: 20, right: 20),
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      String userId = "";
                      await getEmail();
                      if (_email != "") {
                        try {
                          userId = await auth.signIn(_email, _password);
                          print('Signed in: $userId');
                          setState(() {
                            _isLoading = false;
                          });
                          if (userId.length > 0 && userId != null) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (_) =>DashboardScreen()));
                          }
                        } catch (e) {
                          print('Error: $e');
                          setState(() {
                            _isLoading = false;

                            _errorMessage = e.message;
                          });
                        }
                      } else {}
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(2)),
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Dont\'t have an account?',
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: 11),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => SignUpScreen())),
                        child: Container(
                          height: 12,
                          width: 40,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.white))),
                          child: Text('Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 11)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          _isLoading
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.height)
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
          _showCircularProgress()
        ],
      ),
    );
  }
}
