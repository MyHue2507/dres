import 'package:dreesu/payment_add_method.dart';
import 'package:dreesu/screen18_setting.dart';
import 'package:flutter/material.dart';

class PayMent22Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PayMent22ScreenState();
  }
}

class PayMent22ScreenState extends State<PayMent22Screen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: CloseButton(),
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
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 15,right: 15),
            margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 2.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset('images/screen22.png', height: 20,),
                      Text('     ****5322',style: TextStyle(color: Colors.white54),)
                    ],
                  ),
                  Icon(Icons.chevron_right,color: Colors.white54,size: 30,)
                ],
              ),
            ),
            color: Colors.white.withOpacity(0.2),
          ),
          Container(
            child: ListTile(
              onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => PaymentAddMethod())),
              title: Text(
                "Add Payment Method",
                style: TextStyle(color: Colors.amber, fontSize: 13.0),
              ),
            ),
            color: Colors.white.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
