import 'package:carousel_pro/carousel_pro.dart';
import 'package:dreesu/screen12.dart';
import 'package:dreesu/screen16.dart';
import 'package:flutter/material.dart';

class Screen6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen6State();
  }
}

class Screen6State extends State<Screen6> {
  bool _popup = false;
  bool _delete = false;
  bool _swap = false;
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
                      disabledColor: Colors.white,
                      splashColor: Colors.white,
                      highlightColor: Colors.white,
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
                              child: Icon(
                                Icons.more_horiz,
                                color: Color.fromARGB(200, 255, 170, 0),
                                size: 25,
                              ),
                              height: 30.0,
                            ),
                          )),
                      onPressed: () {
                        setState(() {
                          _popup = !_popup;
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
                      'Buy Now price',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(200, 255, 170, 0),
                    ),
                    child: MaterialButton(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      highlightColor: Colors.grey,
                      child: Text(
                        '\$90',
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
              Container(
                height: 25,
                color: Color.fromARGB(220, 250, 250, 250),
              ),
              Container(
                color: Color.fromARGB(255, 250, 250, 250),
                height: 90,
                child: Container(
                  margin:
                      EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        disabledColor: Colors.white30,
                        highlightColor: Colors.white30,
                        splashColor: Colors.white30,
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Screen12()));
                        },
                        child: Column(
                          children: <Widget>[
                            // Image.asset('images/edit.png'),
                            Icon(Icons.edit),
                            Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text('Edit',
                                    style: TextStyle(fontSize: 12)))
                          ],
                        ),
                      ),
                      FlatButton(
                        disabledColor: Colors.white30,
                        highlightColor: Colors.white30,
                        splashColor: Colors.white30,
                        onPressed: () {
                          setState(() {
                            _swap = true;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            // Image.asset('images/swap.png'),
                            Icon(Icons.swap_calls),
                            Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text(
                                  'Swapped',
                                  style: TextStyle(fontSize: 12),
                                ))
                          ],
                        ),
                      ),
                      FlatButton(
                        disabledColor: Colors.white30,
                        highlightColor: Colors.white30,
                        splashColor: Colors.white30,
                        onPressed: () {},
                        child: Column(
                          children: <Widget>[
                            // Image.asset('images/sold.png'),
                            Icon(Icons.attach_money),
                            Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text('Sold',
                                    style: TextStyle(fontSize: 12)))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          _popup || _delete || _swap
              ? GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(150, 179, 179, 179),
                  ),
                  onTap: () => setState(() {
                        _popup = false;
                        _delete = false;
                        _swap = false;
                      }),
                )
              : SizedBox(),
          _swap
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    height: 240,
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
                                      setState(() => _swap = false),
                                ),
                              ),
                              Text(
                                'Select dress',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 10,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => Screen16())),
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: 8, right: 8, top: 10),
                                child: Container(
                                  padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      'images/home5.jpg',
                                      height: 65,
                                    ),
                                    borderRadius: BorderRadius.circular(85),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/home6.jpg',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/home2.jpg',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/matches4.JPG',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/home1.jpg',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/matches2.jpg',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/matches4.JPG',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(top: 2.5, left: 2.5),
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/home3.jpg',
                                    height: 65,
                                  ),
                                  borderRadius: BorderRadius.circular(85),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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
                                // child: Icon(
                                //   Icons.cancel,
                                //   size: 30,
                                // ),
                              ),
                              FlatButton(
                                color: Colors.white,
                                disabledColor: Colors.white,
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                onPressed: () => print('Deactivate Button'),
                                child: Text(
                                  'Deactivate',
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
                          onPressed: () => setState(() {
                                _popup = false;
                                _delete = true;
                              }),
                          color: Colors.white,
                          disabledColor: Colors.white,
                          highlightColor: Colors.white,
                          splashColor: Colors.white,
                          child: Text(
                            'Delete',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(),
          _delete
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Are you sure you want to',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          padding:
                              EdgeInsets.only(left: 60, right: 60, top: 20),
                        ),
                        Container(
                          child: Text(
                            'delete this item.',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          padding: EdgeInsets.only(left: 60, right: 60),
                        ),
                        Divider(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border:
                                        Border.all(color: Colors.yellow[600]),
                                    color: Colors.white),
                                child: FlatButton(
                                  disabledColor: Colors.white,
                                  splashColor: Colors.white,
                                  highlightColor: Colors.white,
                                  child: Text('Cancel'),
                                  onPressed: () => setState(() {
                                        _popup = false;
                                        _delete = false;
                                      }),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.yellow[600]),
                                child: FlatButton(
                                  disabledColor: Colors.yellow[600],
                                  splashColor: Colors.yellow[600],
                                  highlightColor: Colors.yellow[600],
                                  child: Text('Delete'),
                                  onPressed: () => print('Delete'),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
