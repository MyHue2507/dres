import 'package:dreesu/screen18_setting.dart';
import 'package:dreesu/screen22_payment.dart';
import 'package:flutter/material.dart';

class PayMentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PayMentScreenState();
  }
}

class PayMentScreenState extends State<PayMentScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => SettingScreen())),
        ),
        elevation: 0,
        centerTitle: true,
        title: Center(
          child: Container(
            margin: EdgeInsets.only(right: 40.0),
            child: Text(
              'Payment',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 2.0),
        child: ListTile(
          onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => PayMent22Screen())),
          title: Text(
            "Add Payment Method",
            style: TextStyle(color: Colors.amber, fontSize: 13.0),
          ),
        ),
        color: Colors.white.withOpacity(0.2),
      ),
    );
  }
}
