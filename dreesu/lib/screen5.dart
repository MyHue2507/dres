import 'package:carousel_pro/carousel_pro.dart';
import 'package:dreesu/screen1/screen1.dart';
import 'package:dreesu/screen14.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen5State();
  }
}

class Screen5State extends State<Screen5> {
  List<String> listImage = List<String>();
  @override
  void initState() {
    listImage.add(
        'https://lumiere-a.akamaihd.net/v1/images/file_9f77fec9.jpeg?width=1200&region=0%2C0%2C2000%2C2000&quality=8');
    listImage.add(
        'https://dynamic.zacdn.com/thCjBvo_9CE9txxhV33Pe-iDIcI=/fit-in/346x500/filters:quality(95):fill(ffffff)/http://static.ph.zalora.net/p/zalora-5215-864169-1.jpg');
    listImage.add(
        'https://s7d9.scene7.com/is/image/Aritzia/medium/f18_04_a08_69045_1274_on_a.jpg');
    super.initState();
  }

  bool _addDress = false;
  bool _popup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment(0, 1),
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                height: 400.0,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blueGrey[100]),
                child: Carousel(
                  dotSize: 5.0,
                  dotSpacing: 10.0,
                  dotBgColor: Colors.white.withOpacity(0.0),
                  overlayShadow: false,
                  boxFit: BoxFit.cover,
                  images: listImage.map((url) => NetworkImage(url)).toList(),
                ),
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.category,
                          color: Colors.grey,
                        ),
                        Container(
                          width: 5,
                        ),
                        Text('Black evening dress',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.amber,
                              ),
                              borderRadius: BorderRadius.circular(60.0)),
                          child: new CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Container(
                              child: Icon(
                                Icons.more_horiz,
                                color: Colors.amber,
                                size: 25,
                              ),
                              height: 30.0,
                            ),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.directions,
                          color: Colors.grey,
                        ),
                        Container(
                          width: 5,
                        ),
                        Text('Zara',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        '3 km away',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                child: Divider(
                  height: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Buy Now',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: MaterialButton(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      highlightColor: Colors.grey,
                      child: Text(
                        '\$60',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Text(
                    'This automatically sends a message to the owner to let them kmow you want to buy it ....',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  )),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                child: Divider(
                  height: 20,
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Textile/Fabric',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text('100% Cotton',
                        style: TextStyle(
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                child: Divider(
                  height: 20,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text('Description',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                    'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...'),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                child: Divider(
                  height: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Member information',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Row(
                      children: <Widget>[
                        Text('4.6'),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text('Anna Carlton'),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                child: Divider(
                  height: 20,
                ),
              ),
              Container(
                height: 150,
              )
            ],
          ),
          Positioned(
              bottom: -230,
              left: -40,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      color: Color.fromARGB(230, 0, 0, 0),
                    ),
                    height: 350,
                    width: 450,
                  ),
                  Positioned(
                    top: 6,
                    left: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Select items to ',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          'Swap',
                          style: TextStyle(
                              color: Colors.amber),
                        ),
                        Icon(
                          Icons.refresh,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 63,
                    top: 35,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(85)),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/home1.jpg',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(85)),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/home1.jpg',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(85)),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/home1.jpg',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _popup = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(85)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15, left: 15),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      'images/screen5_icon.png',
                                      height: 40,
                                    ),
                                    borderRadius: BorderRadius.circular(85),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
              Positioned(
            top: 20,
            left: 0,
            child: IconButton(
              color: Colors.white,
              iconSize: 40,
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) => Screen1())),
            ),
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
}
