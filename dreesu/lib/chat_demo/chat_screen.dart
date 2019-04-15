import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/chat_demo/chat_item.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  String peerId;
  Chat({Key key, @required this.peerId})
      : super(key : key);
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String peerUserName="";
  @override
    void initState() {
      // TODO: implement initState
      _getPeerUserName();
      super.initState();
    }

  Future<String> _getPeerUserName() async {
    await Firestore.instance
        .collection('users')
        .document(widget.peerId)
        .get()
        .then((snapshot) {
      var channelName = snapshot['username'];
      assert(channelName is String);
      setState(() {
        peerUserName = channelName;
      });
    });
    // print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwww$userName');
    // return userName;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: BackButton(color: Colors.white,),
        backgroundColor: Colors.black,
        title: new Text(
          peerUserName,style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: new ChatScreen(
        peerId: widget.peerId,
      ),
    );
  }
}