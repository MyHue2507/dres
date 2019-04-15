import 'package:flutter/material.dart';
import 'package:dreesu/login/phone_4code.dart';

import 'package:dreesu/login/mail_4code.dart';
import 'package:flutter/cupertino.dart';

class Login1_Tabbar extends StatefulWidget {
  Login1_Tabbar({Key key}) : super(key: key);
  Login1_TabbarState createState() => Login1_TabbarState();
}

class Login1_TabbarState extends State<Login1_Tabbar>
    with SingleTickerProviderStateMixin {
  Color _color = Colors.amber;
  TextEditingController _phoneNumberTextController;
  TextEditingController _emailTextController;
  TabController controller;
  // Country _selected;
  @override
  void initState() {
    super.initState();
    _phoneNumberTextController = new TextEditingController();
    _emailTextController = new TextEditingController();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isStart = false;
  bool ispick = true;
  @override
  Widget build(BuildContext context) {
    _screenPhone() {
      return Column(
        children: <Widget>[
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
              controller: _phoneNumberTextController,
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
                    // child: CountryPicker(
                    //   onChanged: (Country country) {
                    //     setState(() {
                    //       _selected = country;
                    //     });
                    //   },
                    //   selectedCountry: _selected,
                    // ),
                  ),
                ),
                hintText: "0412345678",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                prefixIcon: Container(
                  width: 90,
                  height: 15,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'images/Image 95.png',
                        scale: 2,
                        height: 15,
                        width: 30,
                      ),
                      Image.asset(
                        'images/Group 589.png',
                        scale: 2,
                        height: 15,
                      ),
                      Image.asset(
                        'images/+61.png',
                        scale: 2,
                        height: 20,
                      )
                    ],
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              "Dreesu will send you an SMS to confirm your phone number and SMS fees may apply.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => PhoneOTP()));
            },
            child: new Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 20.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: _color,
            padding: const EdgeInsets.all(15.0),
          ),
        ],
      );
    }

    _screenEmail() {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
          ),
          Container(
            // padding: EdgeInsets.only(right: 20,left: 20),
            decoration: BoxDecoration(
                color: Colors.black,
                border: BorderDirectional(
                    top: BorderSide.none,
                    bottom: BorderSide(
                      color: Colors.white,
                    ))),
            child: TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: _emailTextController,
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                prefix: Container(
                  padding: EdgeInsets.only(
                    right: 0,
                  ),
                  child: Container(
                    height: 20,
                    width: 15,
                  ),
                ),
                hintText: "abcxyz@mail.com",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
            child: Text(
              "By signing up, you confirm that you agree to our Term of Use and have read and understood our Privay Policy.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MailOTP()));
            },
            child: new Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 20.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: _color,
            padding: const EdgeInsets.all(15.0),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              child: Text(
                'Phone',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Tab(
              child: Text(
                'Email',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: new TabBarView(
          controller: controller,
          children: <Widget>[_screenPhone(), _screenEmail()]),
    );
  }

  // Widget _buildDropdownItem(Country country) => Container(
  //       child: Row(
  //         children: <Widget>[
  //           CountryPickerUtils.getDefaultFlagImage(country),
  //           SizedBox(
  //             width: 8.0,
  //           ),
  //           Text("+${country.phoneCode}(${country.isoCode})"),
  //         ],
  //       ),
  //     );
}
