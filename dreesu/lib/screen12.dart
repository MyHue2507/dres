import 'package:dreesu/screen7and8.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Screen12 extends StatefulWidget {
  @override
  _Screen12State createState() => _Screen12State();
}

class _Screen12State extends State<Screen12> {
  var _price = ['\$50', '\$60', '\$70', '\$80', '\$90', 'Price'];
  var purchasePrice = 'Price';

  var _size = ['2', '4', '6', '8'];
  var _defaultSize = '8';

  var _countrySize = [
    'USA',
    'UK',
    'AS',
    'RUS',
  ];
  var _defaultCountrySize = 'USA';

  bool sellNowPriceSwitch = false;
  bool activeSwitch = false;

  @override
  void initState() {
    // _purchasePrice = 'price';
    super.initState();
  }

  var _controller = ScrollController();

  bool canClose = true;

  @override
  Widget build(BuildContext context) {
    // _controller.offset > 100
    //     ? setState(() => canClose = false)
    //     : setState(() => canClose = true);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        // leading: canClose
        // ?
        leading: IconButton(
          icon: Icon(
          Icons.close,
          color: Colors.white,
          size: 30,
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen8_7()));
        },
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Dreesu',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, right: 15, bottom: 20),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Screen8_7()));
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.yellow[700], fontSize: 16),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'images/matches4.JPG',
                  fit: BoxFit.fitHeight,
                ),
                height: MediaQuery.of(context).size.height - 100,
              ),
              Opacity(
                opacity: 0.5,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height - 70,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 50,
                left: 10,
                child: Container(
                  height: 340,
                  width: 340,
                  decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   alignment: FractionalOffset.center,
                      //   image: AssetImage(
                      //     'images/matches4.JPG',
                      //   ),
                      // ),
                      border: Border.all(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.circular(200)),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Category',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Opacity(
                              opacity: 0.3,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/screen12_1.png',
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Wedding',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'images/screen12_2.png',
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Cocktail',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Opacity(
                              opacity: 0.3,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/screen12_5.png',
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Formal',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Opacity(
                              opacity: 0.3,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/screen12_4.png',
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Casual',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(170),
                          topRight: Radius.circular(170))),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ],
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Photos',
                  style: TextStyle(fontSize: 18),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 18, color: Colors.yellow[700]),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 110,
                    width: 110,
                    color: Colors.grey[200],
                  ),
                  Positioned(
                      top: 2,
                      left: 30,
                      child: Text(
                        'Image 1',
                        style: TextStyle(fontSize: 12),
                      )),
                  Positioned(
                    top: 28,
                    left: 20,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(
                        'images/screen12_6.png',
                      ),
                    ),
                    height: 60,
                    width: 60,
                  ),
                  Positioned(
                    top: 37,
                    left: 40,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(
                        'images/screen12_5.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 110,
                    width: 110,
                    color: Colors.grey[200],
                  ),
                  Positioned(
                      top: 2,
                      left: 30,
                      child: Text(
                        'Image 2',
                        style: TextStyle(fontSize: 12),
                      )),
                  Positioned(
                    top: 28,
                    left: 20,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(
                        'images/screen12_6.png',
                      ),
                    ),
                    height: 60,
                    width: 60,
                  ),
                  Positioned(
                    top: 37,
                    left: 40,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(
                        'images/screen12_5.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 110,
                    width: 110,
                    color: Colors.grey[200],
                  ),
                  Positioned(
                      top: 2,
                      left: 30,
                      child: Text(
                        'Image 3',
                        style: TextStyle(fontSize: 12),
                      )),
                  Positioned(
                    top: 28,
                    left: 20,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(
                        'images/screen12_6.png',
                      ),
                    ),
                    height: 60,
                    width: 60,
                  ),
                  Positioned(
                    top: 37,
                    left: 40,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(
                        'images/screen12_5.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Divider(
            height: 60,
          ),
          Container(
            child: Text(
              'Colour',
              style: TextStyle(fontSize: 18),
            ),
            padding: EdgeInsets.only(left: 20, bottom: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Light',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              Text(
                'Neutral',
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.grey[400]),
              ),
              Text(
                'Bright',
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.grey[400]),
              ),
              Text(
                'Dark',
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.grey[400]),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey[300])),
                  height: 40,
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(4)),
                  height: 40,
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(4)),
                  height: 40,
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(4)),
                  height: 40,
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(4)),
                  height: 40,
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.indigo[100],
                      borderRadius: BorderRadius.circular(4)),
                  height: 40,
                  width: 40,
                ),
              ],
            ),
          ),
          Divider(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Purchase price',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 30,
                ),
                // CupertinoD
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey[300], width: 1.5)),
                  child: Container(
                    margin: EdgeInsets.only(left: 18, right: 15),
                    // padding: EdgeInsets.only(left: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        colorIcon: Colors.grey[300],
                        isDense: true,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            purchasePrice = newValueSelected;
                          });
                        },
                        items: _price.map((String dropDownListItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownListItem,
                            child: Text(dropDownListItem),
                          );
                        }).toList(),
                        value: purchasePrice,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          Divider(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Branch',
                  style: TextStyle(fontSize: 18),
                ),
                new Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: new TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Type here',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),
                )),
              ],
            ),
          ),
          Divider(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Title',
                  style: TextStyle(fontSize: 18),
                ),
                new Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: new TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Type here',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),
                )),
              ],
            ),
          ),
          Divider(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Decription',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'e.g. Was taylor made for my wedding'),
            ),
          ),
          Divider(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sell Now Price',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  height: 31,
                  width: 51,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(
                          color:
                              sellNowPriceSwitch ? Colors.amber : Colors.grey),
                      color: sellNowPriceSwitch ? Colors.amber : Colors.grey),
                  child: CupertinoSwitch(
                    activeColor: Colors.amber,
                    value: sellNowPriceSwitch,
                    onChanged: (bool value) {
                      setState(() {
                        sellNowPriceSwitch = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Allow Dreesu members to buy your dress.',
                style: TextStyle(fontSize: 11),
              )),
          Divider(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Size',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 50,
                width: 95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300], width: 1.5)),
                child: Container(
                  margin: EdgeInsets.only(left: 18, right: 15),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      colorIcon: Colors.grey[300],
                      isDense: true,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          _defaultCountrySize = newValueSelected;
                        });
                      },
                      items: _countrySize.map((String dropDownListItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownListItem,
                          child: Text(dropDownListItem),
                        );
                      }).toList(),
                      value: _defaultCountrySize,
                    ),
                  ),
                ),
              ),
              Container(
                height: 49,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300], width: 1.5)),
                child: Container(
                  margin: EdgeInsets.only(left: 18, right: 15),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      colorIcon: Colors.grey[300],
                      isDense: true,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          _defaultSize = newValueSelected;
                        });
                      },
                      items: _size.map((String dropDownListItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownListItem,
                          child: Text(dropDownListItem),
                        );
                      }).toList(),
                      value: _defaultSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                'You will only be matched with dresses of the same size',
                style: TextStyle(fontSize: 11),
              )),
          Divider(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Active',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  height: 31,
                  width: 51,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(
                          color: activeSwitch ? Colors.amber : Colors.grey),
                      color: activeSwitch ? Colors.amber : Colors.grey),
                  child: CupertinoSwitch(
                    activeColor: Colors.amber,
                    value: activeSwitch,
                    onChanged: (bool value) {
                      setState(() {
                        activeSwitch = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Turn off to make your dress invisible for others.',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'You can activate or deactivate anytime you want.',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
