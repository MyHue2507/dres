import 'package:flutter/material.dart';

class SettingPassword extends StatefulWidget {
  SettingPasswordState createState() => SettingPasswordState();
}

class SettingPasswordState extends State<SettingPassword> {
  TextEditingController _passWordTextController;
  @override
  void initState() {
    super.initState();
    _passWordTextController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                border: BorderDirectional(
                    top: BorderSide.none,
                    bottom: BorderSide(color: Colors.white))),
            child: TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: _passWordTextController,
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                prefix: Container(
                  padding: EdgeInsets.only(
                    right: 0,
                  ),
                  child: Container(
                    height: 20,
                    width: 0,
                    decoration: BoxDecoration(
                        border: Border(),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            padding: EdgeInsets.all(40),
            child: RawMaterialButton(
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
          )
        ]));
  }
}
