import 'package:dreesu/login/example.dart';
import 'package:flutter/material.dart';

class MailOTPWrong extends StatefulWidget {
  MailOTPWrongState createState() => MailOTPWrongState();
}

class MailOTPWrongState extends State<MailOTPWrong> {
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
            padding: EdgeInsets.only(left: 110, right: 110),
            child: Text('We sent you a 4-digit code to your email address.',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.only(left: 110, right: 110),
            child: Text('Enter the 4-digit code we sent to name@example.com',
                style: TextStyle(color: Colors.white, fontSize: 13)),
          ),
          Container(
            padding: EdgeInsets.all(40),
            child: VerificationCodeInput(
              itemDecoration: BoxDecoration(
                  color: Colors.grey, border: Border.all(color: Colors.white)),
              keyboardType: TextInputType.number,
              length: 4,
              onCompleted: (String value) {},
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
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
          Container(
            padding: EdgeInsets.all(20),
            child: Text('I didn\'t receive a code.',
                style: TextStyle(
                    color: Colors.amber, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.only(left: 60, right: 60),
            child: Text(
                'Tap Continue to accept Facebook\'s Term, Data Policy and the Privacy Policy and Terms of Service of Dreesu.',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
