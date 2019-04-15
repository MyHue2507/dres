import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/modle/product.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddProduct {
  Future onAddProduct(Product product) async {
    int dateCreate = DateTime.now().millisecondsSinceEpoch;
    String productId = dateCreate.toString();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await _auth.currentUser();
    DocumentReference documentReference = Firestore.instance
        .document("users/${firebaseUser.uid}/listProduct/$productId");
    Map<String, String> data = <String, String>{
      "productId": productId,
      "image"    : product.imageUrl,
      "category" : product.category,
      "description"   : product.description,
      "seller"   : product.seller,
      "price"    : product.price.toString()
     };
     DocumentReference documentReference2 = Firestore.instance
        .document("listProduct/$productId");
    Map<String, String> data2 = <String, String>{
      "productId": productId,
      "image"    : product.imageUrl,
      "category" : product.category,
      "description"   : product.description,
      "seller"   : product.seller,
      "price"    : product.price.toString()
     };
    await documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
    await documentReference2.setData(data2).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }

}
