import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/chat_demo/chat_item.dart';
import 'package:dreesu/chat_demo/chat_screen.dart';
import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  DocumentSnapshot document;
  UserItem({this.document});
  @override
  _UserItemState createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child:ListTile(
            title: Text(widget.document['userName'],style: TextStyle(color: Colors.black),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Chat(peerId: widget.document['id'],)));
            }
          ),
        )
      ],
    );
  }
}