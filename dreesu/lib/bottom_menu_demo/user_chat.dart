import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/bottom_menu_demo/user_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class UserChatScreen extends StatefulWidget {
  FirebaseUser firebaseUser ;
  UserChatScreen({Key key,this.firebaseUser});
  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}
class _UserChatScreenState extends State<UserChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("List User",style: TextStyle(fontSize: 17),),
      ) ,
      body: StreamBuilder(
              stream: Firestore.instance
                  .collection('users')
                  .document(widget.firebaseUser.uid)
                  .collection('listUserChat')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (context, index) => UserItem(
                      document: snapshot.data.documents[index]),
                    itemCount: snapshot.data.documents.length,
                    reverse: false,
                  );
                }
              },
            ),
    );
  }
}