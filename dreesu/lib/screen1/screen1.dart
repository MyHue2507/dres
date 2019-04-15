import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/matches_screen.dart';
import 'package:dreesu/modle/product.dart';
import 'package:dreesu/screen1/product_item.dart';
import 'package:dreesu/screen17.dart';
import 'package:dreesu/screen7and8.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  final Widget child;

  Screen1({Key key, this.child}) : super(key: key);

  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  ScrollController _controller;
  FirebaseUser firebaseUser;
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

  List<Product> listProduct = List<Product>();
  // Product product1 = Product();
  // Product product2 = Product();
  // Product product3 = Product();
  // Product product4 = Product();
  // Product product5 = Product();
  // Product product6 = Product();
  // Product product = Product();
  Product product1 ;
  Product product2 ;
  Product product3 ;
  Product product4 ;
  Product product5 ;
  Product product6 ;
  Product product ;
  List<Product> lisst = List<Product>();
  //  Product product1 ;
  // Product product2;
  // Product product3;
  // Product product4 ;
  // Product product5 ;
  // Product product6 ;
  void _getList() async {
    await _getProductFromFirestore().then((onValue) {
      setState(() {
        lisst = onValue;
      });
    });
  }

  Future<List<Product>> _getProductFromFirestore() async {
    try {
      CollectionReference ref = Firestore.instance.collection('listProduct');
      QuerySnapshot eventsQuery = await ref.getDocuments();

      HashMap<String, Product> eventsHashMap = new HashMap<String, Product>();

      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(
            document['productId'],
            (){
              // return  product.create(
              //   document['category'],
              //   document['description'],
              //   document['image'],
              //   document['price'],
              //   document['seller'],
              //   document['productId']) ;
            });
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print('22222222222222222222222222222$e');
    }
  
  }

  @override
  void initState() {
    _getList();
    getCurrentUser();

    _controller = ScrollController();

    product1.imageUrl = 'images/home1.jpg';
    product1.category = 'Zara';
    product1.price = '90';
    product1.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct.add(product1);
    product2.imageUrl = 'images/home2.jpg';
    product2.category = 'Chanel';
    product2.price = '90';
    product2.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct.add(product2);
    product3.imageUrl = 'images/home3.jpg';
    product3.category = 'Zara';
    product3.price = '90';
    product3.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct.add(product3);
    product4.imageUrl = 'images/home4.jpg';
    product4.category = 'Chanel';
    product4.price = '90';
    product4.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct.add(product4);
    product5.imageUrl = 'images/home5.jpg';
    product5.category = 'Zara';
    product5.price = '90';
    product5.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct.add(product5);
    product6.imageUrl = 'images/home6.jpg';
    product6.category = 'Chanel';
    product6.price = '90';
    product6.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct.add(product6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 25),
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(lisst.length, (index) {
                    return ProductItem(
                      product: lisst[index],
                    );
                  })),
            ),
            GestureDetector(
              onTap: () {
                print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Screen17()));
              },
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
                      'Dreesu',
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
                      .push(MaterialPageRoute(builder: (_) => Screen8_7())),
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
            Container(
              padding: EdgeInsets.only(top: 15, right: 20),
              alignment: Alignment(1, -1),
              child: GestureDetector(
                child: Image.asset('images/refresh.png'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => MatchesScreen()));
                },
              ),
              height: 40,
            ),
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
