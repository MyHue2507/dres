import 'package:dreesu/main.dart';
import 'package:dreesu/screen1/screen1.dart';
import 'package:flutter/material.dart';

class Intro3Size extends StatefulWidget {
  String imageCategory;
  String nameCategory;
  final Widget child;

  Intro3Size({Key key, this.child, this.imageCategory, this.nameCategory})
      : super(key: key);

  _Intro3SizeState createState() => _Intro3SizeState();
}

class _Intro3SizeState extends State<Intro3Size> {
  bool isPick = true;
  bool isStart = false;
  var _defaultCountrySize = 'Pick a size';
  var _countrySize = [
    'Pick a size',
    'USA 2',
    'USA 4',
    'USA 6',
    'USA 8',
  ];
  buildItem() {
    return Container(
      child: Opacity(
        opacity: 1,
        child: Column(
          children: <Widget>[
            Container(
                height: 73,
                width: 48,
                child: Image.asset('images/${widget.imageCategory}.png')),
            Container(
              height: 18,
              margin: EdgeInsets.only(top: 7),
              child: Text(
                widget.nameCategory,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 130),
            alignment: Alignment.topCenter,
            child: Text(
              'With Size',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            alignment: Alignment.center,
            child: buildItem(),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: Container(
              height: 49,
              width: 160,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: <Widget>[
                  //  isPick ? Container(
                  //   //  decoration: BoxDecoration(
                  //   //    border: Border.all(color: Colors.amber),
                  //   //    borderRadius: BorderRadius.circular(30)
                  //   //  ),
                  //    child: FlatButton(
                  //      onPressed: (){
                  //        setState(() {
                  //         isPick =false ;
                  //         isStart = true ;
                  //        });
                  //      },
                  //      child: Container(
                  //        margin: EdgeInsets.only(left: 20),
                  //        child: Text('Pick a size',style: TextStyle(fontSize: 15,color: Colors.amber),)),
                  //    ),
                  //  ):
                  Container(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        //  icon: Icon(Icons.chevron_right),
                        icon: Icons.chevron_right,
                        value: _defaultCountrySize,
                        colorIcon: Colors.amber,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            _defaultCountrySize = newValueSelected;
                            setState(() {
                              if (_defaultCountrySize == 'Pick a size')
                                isStart = false;
                              else
                                isStart = true;
                            });
                          });
                        },
                        items: _countrySize.map((String dropDownListItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownListItem,
                            child: Container(
                              margin: EdgeInsets.only(left: 40),
                              child: Text(
                                dropDownListItem,
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 0),
                  //   child: Image.asset("images/button_ick.png"),
                  // ),
                ],
              ),
            ),
          ),
          isStart
              ? Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 100,
                      left: (MediaQuery.of(context).size.width - 294) / 2),
                  // alignment: Alignment.center,
                  height: 45,
                  width: 294,
                  // color: Colors.amber,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => Screen1()));
                      },
                      child: Text(
                        'Start',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
