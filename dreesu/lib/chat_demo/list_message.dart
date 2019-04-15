import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/chat_demo/build_item.dart';
import 'package:dreesu/chat_demo/send_mess.dart';

import 'package:flutter/material.dart';

class ListMessage extends StatefulWidget {
  String peerId;
  String groupChatId;
  var listMessage;
  String id;
  ListMessage({
    Key key,
    @required this.groupChatId,
    @required this.listMessage,
    this.peerId,
    this.id,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ListMessageState();
  }
}

class _ListMessageState extends State<ListMessage> {
  final ScrollController listScrollController = new ScrollController();
  SendMessage sendMess = SendMessage();
  Widget buildListMessage() {
    return Flexible(
      child: widget.groupChatId == ''
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder(
              stream: Firestore.instance
                  .collection('messages')
                  .document(widget.groupChatId)
                  .collection(widget.groupChatId)
                  .orderBy('timestamp', descending: true)
                  .limit(20)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return snapshot.data.documents.length == 0
                      ? hintChat()
                      : ListView.builder(
                          padding: EdgeInsets.all(10.0),
                          itemBuilder: (context, index) => BuildMessItem(
                              groupChatId: widget.groupChatId,
                              peerId: widget.peerId,
                              id: widget.id,
                              index: index,
                              document: snapshot.data.documents[index]),
                          itemCount: snapshot.data.documents.length,
                          reverse: true,
                          controller: listScrollController,
                        );
                }
              },
            ),
    );
  }

  hintChatItem(String hint) {
    return GestureDetector(
      onTap: () => sendMess.onSendMessage(
          hint, 0, widget.id, widget.peerId, widget.groupChatId),
      child: Container(
        padding: EdgeInsets.fromLTRB(10,6,10,6),
        margin: EdgeInsets.only(bottom: 15),
        child: Text(
          hint,
          style: TextStyle(color: Colors.amber[200], fontSize: 16),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.amber[200]),
            borderRadius: BorderRadius.circular(18)),
      ),
    );
  }

  Widget hintChat() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        hintChatItem('Suggest a time'),
        hintChatItem('Hi. Are you free tomorrow?'),
        hintChatItem('Hi. When are you free to meet?'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildListMessage();
  }
}
