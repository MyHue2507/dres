import 'package:dreesu/login/example.dart';
import 'package:flutter/material.dart';
import 'package:dreesu/login/phone_4code_wrong.dart';

class PhoneOTP extends StatefulWidget {
  PhoneOTPState createState() => PhoneOTPState();
}

class PhoneOTPState extends State<PhoneOTP> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 103, right: 103, bottom: 50),
                  child: Text(
                      'We sent you a 4-digit code. Enter the 4-digit code we sent to +61 0412****080',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 50),
            child: VerificationCodeInput(
              itemDecoration: BoxDecoration(
                  color: Colors.grey, border: Border.all(color: Colors.white)),
              keyboardType: TextInputType.number,
              length: 4,
              onCompleted: (String value) {},
            ),
          ),
          Center(
            child: RawMaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => PhoneOTPWrong()));
              },
              child: new Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 20.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.amber,
              padding: const EdgeInsets.all(15.0),
            ),
          )
        ],
      ),
    );
  }
}
