import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/modle/product.dart';

class Like{
  Future onLikeProduct(String id,Product product) async {
    final DocumentReference documentReference =
          Firestore.instance.document("users/$id/listProductLiked/${product.idProduct}");
      Map<String, String> data = <String, String>{
        "seller": product.seller,
      };
      await documentReference.setData(data).whenComplete(() {
        print("Document Added");
      }).catchError((e) => print(e));
  }
}