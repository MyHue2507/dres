import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/bottom_menu_demo/bottom_menu_screen.dart';
import 'package:dreesu/matches_screen.dart';
import 'package:dreesu/modle/product.dart';
import 'package:dreesu/screen1/product_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final Widget child;

  DashboardScreen({Key key, this.child}) : super(key: key);

  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ScrollController _controller;
  FirebaseUser firebaseUser;
  int lengProduct = 0;
  List<Product> listProductUsed = List<Product>();
  Future<FirebaseUser> getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    firebaseUser = await _auth.currentUser();
    return firebaseUser;
  }

  final itemSize = 1000.0;

  _moveUp() {
    _controller.animateTo(_controller.offset - itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveDown() {
    _controller.animateTo(_controller.offset + itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String id = '';

  List<Product> listProduct = List<Product>();

  // Product product;
  //  = Product();

  // Future _getList() async {
  //   await _getProductFromFirestore().then((onValue) {
  //     setState(() {});
  //   });
  // }

  // _getProductFromFirestore() async {
  //   try {
  //     CollectionReference ref = Firestore.instance.collection('listProduct');
  //     QuerySnapshot eventsQuery = await ref.getDocuments();

  //     HashMap<String, Product> eventsHashMap = new HashMap<String, Product>();

  //     eventsQuery.documents.forEach((document) {
  //       eventsHashMap.putIfAbsent(document['productId'], () {
  //         if (document['seller'] != firebaseUser.uid)
  //           listProduct.add(Product(
  //               document['category'],
  //               document['description'],
  //               document['image'],
  //               document['price'],
  //               document['seller'],
  //               document['productId']));
  //       });
  //     });
  //   } catch (e) {
  //     print('22222222222222222222222222222$e');
  //   }
  // }

  @override
  void initState() {
    getCurrentUser().then((onValue) {
      setState(() {
        id = onValue.uid;
        firebaseUser =onValue;
      });
    });
    // .then((onValue) {
    //   _getList().then((_) {
    //     listProduct.forEach((product) {
    //       print(product.seller + 'aaa');
    //       if (product.seller.compareTo(firebaseUser.uid) != 0)
    //         listProductUsed.add(product);
    //     });
    //   });
    //   print(firebaseUser.uid);
    // });
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('listProduct')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return snapshot.data.documents.length == 0
                        ? Container()
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            padding: EdgeInsets.all(10.0),
                            itemBuilder: (context, index) {
                              if (snapshot.data.documents[index]['seller'] != firebaseUser.uid) {
                                return ProductItem(
                                  firebaseUser: firebaseUser,
                                    product: Product(
                                        snapshot.data.documents[index]
                                            ['category'],
                                        snapshot.data.documents[index]
                                            ['description'],
                                        snapshot.data.documents[index]['image'],
                                        snapshot.data.documents[index]['price'],
                                        snapshot.data.documents[index]
                                            ['seller'],
                                        snapshot.data.documents[index]
                                            ['productId']));
                              }
                            },
                            itemCount: snapshot.data.documents.length,
                          );
                  }
                },
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Stack(
                alignment: Alignment(0, -1),
                children: <Widget>[
                  ClipPath(
                    clipper: ClipperClassTop(),
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      alignment: Alignment(0, -1),
                      color: Colors.black,
                      height: 38,
                      width: 240,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment(0, -1),
                    child: Text(
                      'DreS',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    padding: EdgeInsets.only(top: 10),
                  ),
                ],
              ),
            ),
            Container(
              child: Positioned(
                left: 20,
                right: 20,
                bottom: 0,
                child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => BottomScreen())),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.black,
                        child: ClipPath(
                          clipper: ClipperClassBottom(),
                          child: Container(
                            color: Colors.white,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: MediaQuery.of(context).size.width / 2 - 35,
                        child: Image.asset(
                          'images/up_arrow.png',
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(top: 15, right: 20),
            //   alignment: Alignment(1, -1),
            //   child: GestureDetector(
            //     child: Image.asset('images/refresh.png'),
            //     onTap: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (_) => MatchesScreen()));
            //     },
            //   ),
            //   height: 40,
            // ),
          ],
        )));
  }
}

class ClipperClassTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ClipperClassBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 0);
    path.quadraticBezierTo(
        size.width - size.width / 4, 0.0, size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
