import 'package:dreesu/screen17.dart';
import 'package:dreesu/screen19_account.dart';
import 'package:dreesu/screen21_payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingScreenState();
  }
}

class SettingScreenState extends State<SettingScreen> {
  bool _messageSwitch = false;
  bool _vibrationSwitch = false;
  bool _soundSwitch = false;

  double _sizeText = 12.0;
  Color _colorContainer = Colors.white.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: FlatButton(
            onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen17())),
            child: Icon(
              Icons.chevron_left,
              size: 30.0,
              color: Colors.white,
            )),
        actions: <Widget>[
          FlatButton(
              onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen17())),
              child: Text(
                "Done",
                style: TextStyle(fontSize: 16.0, color: Colors.amber),
              ))
        ],
        elevation: 0,
        centerTitle: true,
        title: Center(
          child: Container(
            child: Text(
              'Settings',
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
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MyAccountScreen()));
              },
              title: Text(
                "My Account",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            color: _colorContainer,
          ),
          Container(
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => PayMentScreen()));
              },
              title: Text(
                "Payment",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            color: _colorContainer,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
            child: Text(
              "Notifications",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: _sizeText,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: _colorContainer,
            child: ListTile(
              title: Text(
                "Message",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
              trailing: Container(
                height: 31,
                width: 51,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(
                        color: _messageSwitch ? Colors.amber : Colors.white),
                    color: _messageSwitch ? Colors.amber : Colors.white),
                child: CupertinoSwitch(
                  activeColor: Colors.amber,
                  value: _messageSwitch,
                  onChanged: (bool value) {
                    setState(() {
                      _messageSwitch = value;
                    });
                  },
                ),
              ),
            ),
            margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 2.0),
          ),
          Container(
            color: _colorContainer,
            child: ListTile(
              title: Text(
                "In-App Vibrations",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
              trailing: Container(
                height: 31,
                width: 51,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(
                        color: _vibrationSwitch ? Colors.amber : Colors.white),
                    color: _vibrationSwitch ? Colors.amber : Colors.white),
                child: CupertinoSwitch(
                  activeColor: Colors.amber,
                  value: _vibrationSwitch,
                  onChanged: (bool value) {
                    setState(() {
                      _vibrationSwitch = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            color: _colorContainer,
            child: ListTile(
              title: Text(
                "In-App Sounds",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
              trailing: Container(
                height: 31,
                width: 51,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(
                        color: _soundSwitch ? Colors.amber : Colors.white),
                    color: _soundSwitch ? Colors.amber : Colors.white),
                child: CupertinoSwitch(
                  activeColor: Colors.amber,
                  value: _soundSwitch,
                  onChanged: (bool value) {
                    setState(() {
                      _soundSwitch = value;
                    });
                  },
                ),
              ),
            ),
            margin: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 5.0),
            child: Text(
              "Favorites",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: _sizeText,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  onTap: () {},
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.amber,
                        size: 13.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Locations and Time",
                                style: TextStyle(
                                    color: Colors.white, fontSize: _sizeText),
                              ),
                              margin: EdgeInsets.only(bottom: 5.0),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 90.0),
                                  child: Text(
                                    "Std",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9.0),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15.0),
                                  child: Text(
                                    "143/27 Phan Boi Chau",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9.0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            color: _colorContainer,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 1.0),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 2.0),
            child: ListTile(
              onTap: () {},
              title: Text(
                "Help and Support",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
            ),
            color: _colorContainer,
          ),
          Container(
            child: ListTile(
              onTap: () {},
              title: Text(
                "Rate Us",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
            ),
            color: _colorContainer,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
            child: ListTile(
              onTap: () {},
              title: Text(
                "Share Dreesu",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
            ),
            color: _colorContainer,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 5.0),
            child: Text(
              "Legal",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: _sizeText,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 2.0),
            child: ListTile(
              onTap: () {},
              title: Text(
                "Privacy Policy",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            color: _colorContainer,
          ),
          Container(
            child: ListTile(
              onTap: () {},
              title: Text(
                "Terms of use",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            color: _colorContainer,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 80.0),
            child: ListTile(
              onTap: () {},
              title: Text(
                "Delete Account",
                style: TextStyle(color: Colors.amber, fontSize: _sizeText),
              ),
            ),
            color: _colorContainer,
          ),
          Center(
            child: Container(
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Log out",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 70,
              margin: EdgeInsets.only(top: 20),
              child: Image.asset('images/Group 482.png'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Version: 1.01",
              style: TextStyle(color: Colors.amber, fontSize: 10.0),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
