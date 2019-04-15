import 'package:dreesu/login/example.dart';
import 'package:flutter/material.dart';

class PhoneOTPWrong extends StatefulWidget {
  PhoneOTPWrongState createState() => PhoneOTPWrongState();
}

class PhoneOTPWrongState extends State<PhoneOTPWrong> {
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
            padding: EdgeInsets.only(left: 103, right: 103),
            child: Text('We could\'t verify your code. Please try again.',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.only(left: 103, right: 103, bottom: 30),
            child: Text('Enter the 4-digit code we sent to +61 0412****080',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
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
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 10, top: 20),
            child: Text('I didn\'t receive a code.',
                style: TextStyle(
                    color: Colors.amber, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.only(right: 55, left: 55),
            child: Text(
                'Tap Continue to accept Facebook\'s Term, Data Policy and the Privacy Policy and Terms of Service of Dreesu.',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
