import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SendMessage{
  String userName ;
    Future onSendMessage(String content, int type,String id,String peerId,String groupChatId) async {
      // type: 0 = text, 1 = image, 2 = sticker
    if (content!= '') {
      var documentReference = Firestore.instance
          .collection('messages')
          .document(groupChatId)
          .collection(groupChatId)
          .document(DateTime.now().millisecondsSinceEpoch.toString());

      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {
            'idFrom': id,
            'idTo': peerId,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
            'content': content,
            'type': type
          },
        );
      });
      await _getUserName(id).then((onValue) async {
        final DocumentReference documentReferencePeerUser =
          Firestore.instance.document("users/$peerId/listUserChat/$id");
      Map<String, String> data = <String, String>{
        "userName": onValue,
        "id" :id
      };
      await documentReferencePeerUser.setData(data).whenComplete(() {
        print("Document Added");
      }).catchError((e) => print(e));
      
      });
      await _getUserName(peerId).then((onValue) async {
        final DocumentReference documentReferenceUser =
          Firestore.instance.document("users/$id/listUserChat/$peerId");
      Map<String, String> data = <String, String>{
        "userName": onValue,
        "id" :peerId
      };
      await documentReferenceUser.setData(data).whenComplete(() {
        print("Document Added");
      }).catchError((e) => print(e));
      
      });

     
    } else {
      // Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }
  Future<String> _getUserName(String id) async {
    await Firestore.instance
        .collection('users')
        .document(id)
        .get()
        .then((snapshot) {
      var channelName = snapshot['username'];
      assert(channelName is String);
      userName=channelName;
    });
    print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwww$userName');
    return userName;
  }
}
