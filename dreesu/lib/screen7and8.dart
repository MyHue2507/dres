import 'package:dreesu/add_product_demo/add_product_screen.dart';
import 'package:dreesu/main.dart';
import 'package:dreesu/screen1/screen1.dart';
import 'package:dreesu/screen14.dart';
import 'package:dreesu/screen6.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Screen8_7 extends StatefulWidget {
  _Screen8_7State createState() => _Screen8_7State();
}

class _Screen8_7State extends State<Screen8_7> {
  bool _popup = false ;
  Color _color = Colors.amber;
  List<String> images = [
    'https://www.childrensplace.com/wcsstore/GlobalSAS/images/tcp/products/500/2139284_2153-6.jpg',
    'https://lumiere-a.akamaihd.net/v1/images/file_6090f3bc.jpeg?width=1200&region=0%2C0%2C2000%2C2000&quality=8',
    'https://lumiere-a.akamaihd.net/v1/images/file_1934f295.jpeg?width=1200&region=0%2C0%2C2000%2C2000&quality=8',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1Fv6eeTerlwXCffyDgm3HucMC6F4JkgsTmZG98Qvn6CuKDk_lDQ'
  ];
  Widget itemSlide(String url) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen6()));
      },
          child: Container(
        // padding: EdgeInsets.only(left: 5, right: 5),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: 163,
                width: 163,
                decoration: BoxDecoration(
                    color: _color, borderRadius: BorderRadius.circular(85)),
              ),
            ),
            Center(
              child: Container(
                // padding: EdgeInsets.only(top: 5, left: 5),
                child: ClipRRect(
                  child: Image.network(
                    url,
                    height: 155,
                  ),
                  borderRadius: BorderRadius.circular(85),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isbuy = true;
  @override
  Widget build(BuildContext context) {
    _screen7() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Veronica\'s Ball dress',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Text(
                    '\$85',
                    style: TextStyle(color: _color),
                  )
                ],
              ),
              leading: Opacity(
                opacity: 0.7,
                child: Container(
                  // padding: EdgeInsets.only(left: 5, right: 5),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                            color: _color,
                            borderRadius: BorderRadius.circular(85)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        child: ClipRRect(
                          child: Hero(
                            tag: 'tag',
                            child: Image.asset(
                              'images/home1.jpg',
                              height: 75,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(85),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              trailing: Container(
                margin: EdgeInsets.only(right: 15.0, top: 50),
                height: 25,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _color,
                ),
                child: MaterialButton(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  highlightColor: Colors.grey,
                  child: Text(
                    'Buy',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.0),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 100, right: 30, top: 10),
              child: Divider(
                color: Colors.grey[500],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Veronica\'s Ball dress',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    Text(
                      '\$85',
                      style: TextStyle(color: _color),
                    )
                  ],
                ),
                leading: Opacity(
                  opacity: 0.7,
                  child: Container(
                    // padding: EdgeInsets.only(left: 5, right: 5),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(85)),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: ClipRRect(
                            child: Hero(
                              tag: 'tag1',
                              child: Image.asset(
                                'images/home1.jpg',
                                height: 75,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(85),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                trailing: Container(
                  margin: EdgeInsets.only(right: 15.0, top: 50),
                  height: 25,
                  width: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: _color),
                  child: MaterialButton(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    // elevation: 1,

                    // color: _color,
                    // minWidth: 15.0,
                    // height: 30.0,
                    highlightColor: Colors.grey,
                    child: Text(
                      'Buy',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.0),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 100, right: 30, top: 10),
              child: Divider(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    _screen8() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Stack(
          alignment: Alignment(0, 1),
          children: <Widget>[
            ListView(
              children: <Widget>[
                CarouselSlider(
                  autoPlay: true,
                  // aspectRatio: 1/2,
                  // distortion: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.55,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  height: 170,
                  items: images.map((url) => itemSlide(url)).toList(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 40),
                  height: 70,
                  color: Colors.grey[900],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.message,
                        color: _color,
                      ),
                      Text(
                        'Message',
                        style: TextStyle(color: _color),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Louisa\'s Sliver night dress',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  subtitle: Text(
                    'Hi. Is this avaliable ?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  leading: Opacity(
                    opacity: 0.7,
                    child: Container(
                      // padding: EdgeInsets.only(left: 5, right: 5),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                                color: _color,
                                borderRadius: BorderRadius.circular(85)),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, left: 5),
                            child: ClipRRect(
                              child: Hero(
                                tag: 'tag',
                                child: Image.asset(
                                  'images/home1.jpg',
                                  height: 75,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(85),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 100, right: 30, top: 10),
                  child: Divider(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Text(
                      'Anna\'s Black evening dress',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Text(
                          'You: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Hi. Is this avaliable ?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    leading: Opacity(
                      opacity: 0.7,
                      child: Container(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        child: ClipRRect(
                          child: Hero(
                            tag: 'tag1',
                            child: Image.asset(
                              'images/home1.jpg',
                              height: 75,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(85),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 100, right: 30, top: 10),
                  child: Divider(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ListTile(
                    title: Text(
                      'Lisa\'s White summer dress',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    subtitle: Text(
                      'Hi there!Swap dress tomorrow after...',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: Opacity(
                      opacity: 0.7,
                      child: Container(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        child: ClipRRect(
                          child: Image.asset(
                            'images/home2.jpg',
                            height: 75,
                          ),
                          borderRadius: BorderRadius.circular(85),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 100, right: 30, top: 10),
                  child: Divider(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Column(
                      children: <Widget>[
                        Image.asset('images/coin.png'),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              '\$75',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    title: Column(
                      children: <Widget>[
                        Text(
                          'Jaclyn wants to buy your item',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 15.0, top: 15),
                              height: 28,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(color: _color),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                              ),
                              child: MaterialButton(
                                padding: EdgeInsets.only(left: 0, right: 0),
                                highlightColor: Colors.grey,
                                child: Text(
                                  'Decline',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: _color,
                                      fontSize: 12.0),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15.0, top: 15),
                              height: 28,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _color,
                              ),
                              child: MaterialButton(
                                padding: EdgeInsets.only(left: 0, right: 0),
                                highlightColor: Colors.grey,
                                child: Text(
                                  'Cell',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 12.0),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 30, top: 20),
                  child: Divider(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Column(
                      children: <Widget>[
                        Image.asset('images/coin.png'),
                        // Text('abc', style: TextStyle(color: Colors.white)),
                        // Icon(Icons.),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              '\$75',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    // leading:Image.asset('images/coin.png') ,
                    title: Column(
                      children: <Widget>[
                        Text(
                          'Rosa wants to buy your item',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 15.0, top: 15),
                              height: 28,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(color: _color),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                              ),
                              child: MaterialButton(
                                padding: EdgeInsets.only(left: 0, right: 0),
                                highlightColor: Colors.grey,
                                child: Text(
                                  'Decline',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: _color,
                                      fontSize: 12.0),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15.0, top: 15),
                              height: 28,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _color,
                              ),
                              child: MaterialButton(
                                padding: EdgeInsets.only(left: 0, right: 0),
                                highlightColor: Colors.grey,
                                child: Text(
                                  'Cell',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 12.0),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 30, top: 20),
                  child: Divider(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 100,
                )
              ],
            ),
            Container(
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                      // _popup = true ;
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddProductScreen()));
                  },
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Colors.black,
                    Colors.black87,
                  ])),
              height: 80,
            ),
            _popup
              ? GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(150, 179, 179, 179),
                  ),
                  onTap: () => setState(() {
                        _popup = false;
                      }),
                )
              : SizedBox(),
          _popup
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    size: 30,
                                  ),
                                  onPressed: () =>
                                      setState(() => _popup = false),
                                ),
                              ),
                              FlatButton(
                                color: Colors.white,
                                disabledColor: Colors.white,
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => Screen14())),
                                child: Text(
                                  'Camera',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 10,
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Screen14())),
                          color: Colors.white,
                          disabledColor: Colors.white,
                          highlightColor: Colors.white,
                          splashColor: Colors.white,
                          child: Text(
                            'Photo Libary',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
            child: AppBar(
            leading: Container(),
            title:MaterialButton(
              child: Image.asset('images/up_arrow.png',height: 20,),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen1()));
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            flexibleSpace: Container(
                margin: EdgeInsets.only(top: 40),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      //  height: 90,
                      margin: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MaterialButton(
                            // padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                isbuy = true;
                                print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                              });
                            },
                            child: Text(
                              'Buy',
                              style:
                                  TextStyle(color: isbuy ? _color : Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(0),
                            height: 2,
                            width: 150,
                            color: isbuy ? _color : Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MaterialButton(
                              // padding: EdgeInsets.all(0),
                              onPressed: () {
                                setState(() {
                                  isbuy = false;
                                  print('bbbbbbbbbbbbbbbbbbbbbbbbb$isbuy');
                                });
                              },
                              child: Text(
                                'My Dresses',
                                style: TextStyle(
                                    color: !isbuy ? _color : Colors.white),
                              )),
                          Container(
                            margin: EdgeInsets.all(0),
                            width: 150,
                            height: 2,
                            color: !isbuy ? _color : Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
        body: Container(
            color: Colors.black, child: isbuy ? _screen7() : _screen8()));
  }
}
