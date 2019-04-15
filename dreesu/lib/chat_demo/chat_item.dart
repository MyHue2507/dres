import 'dart:async';
import 'dart:io';

import 'package:dreesu/chat_demo/build_input.dart';
import 'package:dreesu/chat_demo/build_loading.dart';
import 'package:dreesu/chat_demo/list_message.dart';
import 'package:dreesu/chat_demo/send_mess.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String peerId;
  SendMessage sendMess = SendMessage();
  ChatScreen({Key key, @required this.peerId}) : super(key: key);

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  FirebaseUser firebaseUser;
  Future<FirebaseUser> _getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    firebaseUser = await _auth.currentUser();
    return firebaseUser;
  }

  String id;

  var listMessage;
  String groupChatId;

  File imageFile;
  bool isLoading;
  bool isShowSticker;
  String imageUrl;



  @override
  void initState() {
    super.initState();
    groupChatId = '';
    isLoading = false;
    isShowSticker = false;
    imageUrl = '';
    _getCurrentUser().then((_) {
      readLocal();
    });
  }

  readLocal() async {
    id = firebaseUser.uid ?? '';
    if (id.hashCode <= widget.peerId.hashCode) {
      groupChatId = '$id-${widget.peerId}';
    } else {
      groupChatId = '${widget.peerId}-$id';
    }

    setState(() {});
  }

  Future<bool> onBackPress() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      Navigator.pop(context);
    }

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // List of messages
              ListMessage(
                peerId: widget.peerId,
                groupChatId: groupChatId,
                listMessage: listMessage,
                id: id,
              ),
              BuildInput(
                groupChatId: groupChatId,
                listMessage: listMessage,
                id: id,
                isLoading: isLoading,
                isShowSticker: isShowSticker,
                peerId: widget.peerId,
              ),
            ],
          ),

          // Loading
          BuildLoading(isLoading: isLoading)
        ],
      ),
      onWillPop: onBackPress,
    );
  }
}
