import 'package:flutter/material.dart';
import 'package:dreesu/login/login1_phone_and_email.dart';

class Login1_Birthday extends StatefulWidget {
  Login1_BirthdayState createState() => Login1_BirthdayState();
}

class Login1_BirthdayState extends State<Login1_Birthday> {
  TextEditingController _phoneNumberTextController;
  @override
  void initState() {
    super.initState();
    _phoneNumberTextController = new TextEditingController();
  }

  bool isPick = true;
  bool isStart = false;
  var _defaultMonth = 'Jan';
  var _month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  var _defaultDay = '10';
  var _day = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];
  var _defaultYear = '1980';
  var _year = [
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
  ];
  final BorderSide side = BorderSide(
    color: Colors.amber,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 0, top: 60, bottom: 7, right: 100),
            child: Text(
              'What\'s your birthday?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 0, right: 45),
            child: Text(
              'Your birthday won\'t be shown publicly',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 40, left: 0, bottom: 50),
                // alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 114,
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                        top: BorderSide.none,
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _defaultMonth,
                            onChanged: (String newValueSelected) {
                              setState(() {
                                _defaultMonth = newValueSelected;
                                setState(() {
                                  isStart = true;
                                });
                              });
                            },
                            items: _month.map((String dropDownListItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownListItem,
                                child: Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Text(
                                    dropDownListItem,
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40, left: 0, bottom: 50),
                // alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                        top: BorderSide.none,
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _defaultDay,
                            onChanged: (String newValueSelected) {
                              setState(() {
                                _defaultDay = newValueSelected;
                                setState(() {
                                  isStart = true;
                                });
                              });
                            },
                            items: _day.map((String dropDownListItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownListItem,
                                child: Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Text(
                                    dropDownListItem,
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40, left: 0, bottom: 50),
                // alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 125,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: BorderDirectional(
                        top: BorderSide.none,
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _defaultYear,
                            onChanged: (String newValueSelected) {
                              setState(() {
                                _defaultYear = newValueSelected;
                                setState(() {
                                  isStart = true;
                                });
                              });
                            },
                            items: _year.map((String dropDownListItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownListItem,
                                child: Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Text(
                                    dropDownListItem,
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          RawMaterialButton(
            onPressed: () {
              // dialog(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Login1_Tabbar()));
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
        ],
      ),
    );
  }

  Future<bool> dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Sorry. Looks like you are not eligible for Dreesu.',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 70, bottom: 30),
                  child: Text(
                    'But thanks for checking us out.',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Confirm')),
              ],
            ),
          );
        });
  }
}
