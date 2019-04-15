import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/modle/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyDressesScreenDemo extends StatefulWidget {
  FirebaseUser firebaseUser;
  MyDressesScreenDemo({Key key, this.firebaseUser}) : super(key: key);
  @override
  _MyDressesScreenDemoState createState() => _MyDressesScreenDemoState();
}

class _MyDressesScreenDemoState extends State<MyDressesScreenDemo> {
  FirebaseUser firebaseUser;
  var _colorText = Colors.amber;
  Future<FirebaseUser> _getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    firebaseUser = await _auth.currentUser();
    return firebaseUser;
  }

  List<Product> listMydresses = List<Product>();

  Future _getList() async {
    await _getProductFromFirestore().then((onValue) {
      setState(() {});
    });
  }

  _getProductFromFirestore() async {
    try {
      CollectionReference ref = Firestore.instance
          .collection('users/${widget.firebaseUser.uid}/listProduct');
      QuerySnapshot eventsQuery = await ref.getDocuments();

      HashMap<String, Product> eventsHashMap = new HashMap<String, Product>();

      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(document['productId'], () {
          if (document['seller'] == firebaseUser.uid)
            listMydresses.add(Product(
                document['category'],
                document['description'],
                document['image'],
                document['price'],
                document['seller'],
                document['productId']));
        });
      });
    } catch (e) {
      print('22222222222222222222222222222$e');
    }
  }

  @override
  void initState() {
    _getCurrentUser();
    _getList();
    super.initState();
  }

  Future onDelete(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.grey[300],
              title: Text(
                'Delete this dress?',
                style: TextStyle(color: _colorText),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.of(context).pop(false),
                )
              ],
            ));
  }

  static SlidableDelegate _getDelegate(int index) {
    switch (index % 4) {
      case 0:
        return new SlidableBehindDelegate();
      case 1:
        return new SlidableStrechDelegate();
      case 2:
        return new SlidableScrollDelegate();
      case 3:
        return new SlidableDrawerDelegate();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          'My Dresses',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('users/${widget.firebaseUser.uid}/listProduct')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return snapshot.data.documents.length == 0
                ? Container()
                : ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (context, index) => Slidable(
                          delegate: _getDelegate(1),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                                icon: Icons.delete,
                                color: Colors.grey[300],
                                caption: 'Delete',
                                onTap: () async {
                                  onDelete(context).then((onValue) async {
                                    if (onValue) {
                                      await Firestore.instance
                                          .collection(
                                              'users/${widget.firebaseUser.uid}/listProduct')
                                          .document(
                                              snapshot.data.documents[index]['productId'])
                                          .delete();
                                      await Firestore.instance
                                          .collection('listProduct')
                                          .document(
                                              snapshot.data.documents[index]['productId'])
                                          .delete();
                                    }
                                  });
                                }),
                          ],
                          child: ListTile(
                            leading: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data.documents[index]['image'],
                                      ),
                                      fit: BoxFit.fitWidth),
                                  borderRadius: BorderRadius.circular(60)),
                            ),
                            title: Text(snapshot.data.documents[index]['category'],
                                style:
                                    TextStyle(fontSize: 18, color: _colorText)),
                            trailing: Text(
                              snapshot.data.documents[index]['price'],
                              style: TextStyle(fontSize: 16, color: _colorText),
                            ),
                            subtitle: Text(snapshot.data.documents[index]['description'],
                                style: TextStyle(color: _colorText)),
                          ),
                        ),
                    itemCount: snapshot.data.documents.length,
                    reverse: false,
                  );
          }
        },
      ),
      // body: ListView.builder(
      //   itemCount: listMydresses.length,
      //   itemBuilder: (context, index) {
      //     return Slidable(
      //       delegate: _getDelegate(1),
      //       secondaryActions: <Widget>[
      //         IconSlideAction(
      //             icon: Icons.delete,
      //             color: Colors.grey[300],
      //             caption: 'Delete',
      //             onTap: () async {
      //               onDelete(context).then((onValue) async {
      //                 if (onValue) {
      //                   await Firestore.instance
      //                       .collection(
      //                           'users/${widget.firebaseUser.uid}/listProduct')
      //                       .document(listMydresses[index].idProduct)
      //                       .delete();
      //                   await Firestore.instance
      //                       .collection('listProduct')
      //                       .document(listMydresses[index].idProduct)
      //                       .delete();
      //                 }
      //               });
      //             }),
      //       ],
      //       child: ListTile(
      //         leading: Container(
      //           height: 60,
      //           width: 60,
      //           //  child: Image.network(listMydresses[index].imageUrl),
      //           decoration: BoxDecoration(
      //               color: Colors.grey[300],
      //               image: DecorationImage(
      //                   image: NetworkImage(
      //                     listMydresses[index].imageUrl,
      //                   ),
      //                   fit: BoxFit.fitWidth),
      //               borderRadius: BorderRadius.circular(60)),
      //         ),
      //         title: Text(listMydresses[index].category,
      //             style: TextStyle(fontSize: 18, color: _colorText)),
      //         trailing: Text(
      //           listMydresses[index].price,
      //           style: TextStyle(fontSize: 16, color: _colorText),
      //         ),
      //         subtitle: Text(listMydresses[index].description,
      //             style: TextStyle(color: _colorText)),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
