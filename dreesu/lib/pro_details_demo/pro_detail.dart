import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/chat_demo/chat_screen.dart';
import 'package:dreesu/modle/product.dart';
import 'package:dreesu/presentation/my_flutter_app_icons.dart';
import 'package:dreesu/swap_demo/buy_onpress.dart';
import 'package:dreesu/swap_demo/like_onpress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  FirebaseUser firebaseUser;
  // = Product();
  ProductDetails({Key key, this.product, this.firebaseUser}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ProductDetailsState();
  }
}

class ProductDetailsState extends State<ProductDetails> {
  Like like = Like();
  BuySwap buySwap = BuySwap();
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
                  child: Image.network(
                    widget.product.imageUrl,
                    fit: BoxFit.fitWidth,
                  )),
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
                        Text(widget.product.category,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 10,
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
                child: Text(widget.product.description),
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
                        '\$${widget.product.price}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0),
                      ),
                      onPressed: () async {
                        await buySwap.onBuy(widget.firebaseUser.uid,
                            widget.product.seller, widget.product);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Chat(
                                  peerId: widget.product.seller,
                                )));
                      },
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
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () => Navigator.pop(context),
            ),
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
                height: 65,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        disabledColor: Colors.white30,
                        highlightColor: Colors.white30,
                        splashColor: Colors.white30,
                        onPressed: () async {
                          await like
                              .onLikeProduct(
                                  widget.firebaseUser.uid, widget.product)
                              .then((_) async {
                            final QuerySnapshot result = await Firestore
                                .instance
                                .collection(
                                    'users/${widget.product.seller}/listProductLiked')
                                .where('seller',
                                    isEqualTo: widget.firebaseUser.uid)
                                .getDocuments();
                            final List<DocumentSnapshot> documents =
                                result.documents;
                            print('${documents.length}');
                            if (documents.length != 0) {
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Chat(
                                        peerId: widget.product.seller,
                                      )));
                            }
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              MyFlutterApp.heart,
                              color: Colors.red,
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text(
                                  'Like',
                                  style: TextStyle(fontSize: 12),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
