import 'package:dreesu/screen20_premium.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAccountScreenState();
  }
}

class MyAccountScreenState extends State<MyAccountScreen> {
  var _color = Colors.amber;

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
            margin: EdgeInsets.only(right: 30.0),
            child: Text(
              'My Account',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 2.0),
            child: ListTile(
                onTap: () {},
                leading: Text("Heleana", style: TextStyle(color: _color)),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("4.6 ",
                        style:
                            TextStyle(color: Colors.white54, fontSize: 10.0)),
                    Icon(
                      Icons.star,
                      color: _color,
                      size: 17.0,
                    ),
                  ],
                )),
            color: Colors.white12,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 2.0),
            child: ListTile(
              onTap: () {},
              title: Text(
                "Subscription",
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300),
              ),
              trailing: Text(
                "Free Version",
                style: TextStyle(color: _color, fontWeight: FontWeight.w200),
              ),
            ),
            color: Colors.white12,
          ),
          // SizedBox(
          //   height: 320,
          // ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 320, bottom: 10),
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: _color),
              child: FlatButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => PremiumScreen())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Get Dreesu Premium',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Icon(
                      Icons.chevron_right,
                    )
                  ],
                ),
              ),
            ),
          ),

          Center(
            child: Text(
              "Try Premium free for 30 days. Only \$4.99/month after",
              style: TextStyle(color: Colors.white54, fontSize: 10.0),
            ),
          )
        ],
      ),
    );
  }
}
