import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/chat_demo/chat_screen.dart';
import 'package:dreesu/modle/product.dart';
import 'package:dreesu/presentation/my_flutter_app_icons.dart';
import 'package:dreesu/pro_details_demo/pro_detail.dart';
import 'package:dreesu/screen1/product_inherited.dart';
import 'package:dreesu/screen6.dart';
import 'package:dreesu/swap_demo/buy_onpress.dart';
import 'package:dreesu/swap_demo/like_onpress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  Product product;
  FirebaseUser firebaseUser ;
  ProductItem({Key key, this.product,this.firebaseUser}) : super(key: key);

  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with TickerProviderStateMixin {
      BuySwap buySwap = BuySwap();
  bool isLike = true;
  Color color = Colors.transparent;
  AnimationController controller;
  CurvedAnimation curvedAnimation;
  Animation<Offset> _moveAnim;
  Animation<Offset> _translationAnim;
  // Product product1 = Product();
   Product product1 ;

  void initState() {
    super.initState();
    print(widget.firebaseUser);
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    _moveAnim = Tween(begin: Offset(0.0, 0.05), end: Offset(0.0, 0.0))
        .animate(curvedAnimation);
    _translationAnim = Tween(begin: Offset(0.0, 0.0), end: Offset(-1000.0, 0.0))
        .animate(controller)
          ..addListener(() {
            setState(() {});
          });
  }

  void _horizontalDragEnd(DragEndDetails details) {
    controller.forward().whenComplete(() {
      setState(() {
        controller.reset();
        product1.imageUrl = 'images/home1.jpg';
        product1.category = 'Zara';
        product1.price = '90';
        product1.description =
            'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
        widget.product = product1;
      });
    });
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 1300);
    return Timer(_duration, () {
      setState(() {
        color = Colors.transparent;
        _alignment = Alignment.center;
      });
    });
  }

  startTimeColor(int time, double opacity) async {
    var _duration = new Duration(milliseconds: time);
    return Timer(_duration, () {
      setState(() {
        color = color.withOpacity(opacity);
      });
    });
  }

  Offset _getStackedCardOffset() {
    print('aaaaaaaaaaaaaaaaaaaaaaa${_moveAnim.value}');
    return _moveAnim.value;

    // return Offset(0.0, 0.0);
  }

  Offset _getFlickTransformOffset() {
    return _translationAnim.value;
    // return Offset(0.0, 0.0);
  }
  Like like = Like();

  @override
  var _alignment = Alignment.center;
  @override
  Widget build(BuildContext context) {
    // final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return Center(
      child: Container(
        margin: EdgeInsets.all(5),
        child: GestureDetector(

          onDoubleTap: () async {
           
            setState(() {
              _alignment = Alignment.topCenter;
              color = Colors.red.withOpacity(1);

              startTime();
              startTimeColor(500, 0.8);
              startTimeColor(550, 0.75);
              startTimeColor(600, 0.7);
              startTimeColor(650, 0.65);
              startTimeColor(700, 0.6);
              startTimeColor(750, 0.55);
              startTimeColor(800, 0.5);
              startTimeColor(850, 0.45);
              startTimeColor(900, 0.4);
              startTimeColor(950, 0.35);
              startTimeColor(1000, 0.3);
              startTimeColor(1050, 0.25);
              startTimeColor(1100, 0.2);
              startTimeColor(1150, 0.15);
              startTimeColor(1200, 0.1);
              startTimeColor(1250, 0.05);
              startTimeColor(1300, 0.0);
            });
             await like.onLikeProduct(widget.firebaseUser.uid, widget.product).then((_) async {
              final QuerySnapshot result = await Firestore.instance
                        .collection('users/${widget.product.seller}/listProductLiked')
                        .where('seller', isEqualTo: widget.firebaseUser)
                        .getDocuments();
                    final List<DocumentSnapshot> documents = result.documents;
                    print('${documents.length}');
              if(documents.length != 0){
                 await buySwap.onSwap(
                                    widget.firebaseUser.uid,
                                    widget.product.seller,
                                    Product(
                                        documents[0]['category'],
                                        documents[0]['description'],
                                        documents[0]['image'],
                                        documents[0]['price'],
                                        documents[0]['seller'],
                                        documents[0]['productId']),
                                    widget.product);
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Chat(peerId: widget.product.seller,)));
              }
            });
          },
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ProductDetails(product: widget.product,))),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(85)),
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                      child: Image.network(widget.product.imageUrl,height: 160,width: 160,fit: BoxFit.fitWidth,),
                        
                        borderRadius: BorderRadius.circular(85),
                      ),
                    ),
                    Container(
                        child: AnimatedContainer(
                      alignment: _alignment,
                      duration: Duration(milliseconds: 1300),
                      child: Icon(
                        MyFlutterApp.heart,
                        color: color,
                      ),
                    ))
                  ],
                ),
              ),
          //   ),
          // )
          // child: Draggable(
          //   feedback: Container(
          //     child: Center(
          //       child: ClipRRect(
          //         child: Image.asset(
          //           widget.product.imageUrl,
          //           height: 160,
          //         ),
          //         borderRadius: BorderRadius.circular(85),
          //       ),
          //     ),
          //   ),
          //   childWhenDragging: Container(),
          //   onDraggableCanceled: (velocity, offset) {
          //     setState(() {
          //       product1.imageUrl = 'images/home1.jpg';
          //       product1.category = 'Zara';
          //       product1.price = '90';
          //       product1.description =
          //           'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
          //       // state.deleteItem(widget.product);
          //       // state.addItem(product1);
          //       setState(() {
          //                       widget.product=product1;
          //                     });
          //       return ProductItem(
          //         product: product1,
          //       );
          //     });
          //   },
          //   child: Container(
          //     child: Stack(
          //       children: <Widget>[
          //         Center(
          //           child: Container(
          //             height: 170,
          //             width: 170,
          //             decoration: BoxDecoration(
          //                 color: Colors.grey[300],
          //                 borderRadius: BorderRadius.circular(85)),
          //           ),
          //         ),
          //         Center(
          //           child: ClipRRect(
          //             child: Image.network(widget.product.imageUrl,height: 160,width: 160,fit: BoxFit.fitWidth,),
          //             borderRadius: BorderRadius.circular(85),
          //           ),
          //         ),
          //         Container(
          //             child: AnimatedContainer(
          //           alignment: _alignment,
          //           duration: Duration(milliseconds: 1300),
          //           child: Icon(
          //             MyFlutterApp.heart,
          //             color: color,
          //           ),
          //         ))
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
