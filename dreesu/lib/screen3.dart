import 'package:carousel_pro/carousel_pro.dart';
import 'package:dreesu/screen6.dart';
// import 'package:dress/screen6.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen3State();
  }
}

class Screen3State extends State<Screen3> {
  bool _popup = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            alignment: Alignment(0, 1),
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    height: 450.0,
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
                                    color: Color.fromARGB(200, 255, 170, 0),
                                  ),
                                  borderRadius: BorderRadius.circular(60.0)),
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Container(
                                  child: Icon(Icons.more_horiz,
                                      color: Colors.amber, size: 25),
                                  height: 30.0,
                                ),
                              )),
                          onPressed: () {
                            setState(() {
                              _popup = true;
                            });
                          },
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Container(
                  //   height: 15,
                  //   color: Color.fromARGB(150, 250, 250, 250),
                  //   // color: Colors.red,
                  // ),
                  // Container(
                  //   height: 25,
                  //   color: Color.fromARGB(220, 250, 250, 250),
                  // ),
                  Container(
                    // color: Color.fromARGB(255, 250, 250, 250),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white70,
                          // Colors.white54
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                      )
                    ),
                    height: 100,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Screen6()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.message,
                                ),
                                Text('Message')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
               Positioned(
            top: 20,
            left: 0,
            child: IconButton(
              color: Colors.white,
              iconSize: 40,
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context),
                    
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
                                    onPressed: () => _popup = false,
                                    child: Text(
                                      'Unmatch',
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
                              onPressed: () => _popup = false,
                              color: Colors.white,
                              disabledColor: Colors.white,
                              highlightColor: Colors.white,
                              splashColor: Colors.white,
                              child: Text(
                                'Report file',
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
          
        ],
      ),
    );
  }
}
