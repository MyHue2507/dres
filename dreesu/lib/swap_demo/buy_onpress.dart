import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/modle/product.dart';

class BuySwap{
  Future onBuy(String idBuy,String idSell,Product product) async {
    await Firestore.instance.collection('listProduct').document(product.idProduct).delete();
    await Firestore.instance.collection('users/$idSell/listProduct').document(product.idProduct).delete();
    await Firestore.instance.collection('users/$idBuy/listProductLiked').document(product.idProduct).delete();
  }
  Future onSwap(String id1,String id2,Product product1,Product product2) async {
    await Firestore.instance.collection('users/$id1/listProductLiked').document(product2.idProduct).delete();
    await Firestore.instance.collection('users/$id2/listProductLiked').document(product1.idProduct).delete();
    await Firestore.instance.collection('listProduct').document(product1.idProduct).delete();
    await Firestore.instance.collection('listProduct').document(product2.idProduct).delete();
    await Firestore.instance.collection('users/$id1/listProduct').document(product1.idProduct).delete();
    await Firestore.instance.collection('users/$id2/listProduct').document(product2.idProduct).delete();
}
}