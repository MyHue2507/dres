import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreesu/chat_demo/send_mess.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildMessItem extends StatefulWidget {
  @override
  String id;
  String peerId;
  String groupChatId;
  DocumentSnapshot document;
  var listMessage;
  int index;
  BuildMessItem(
      {Key key,
      this.id,
      this.document,
      this.index,
      this.listMessage,
      this.peerId,
      this.groupChatId})
      : super(key: key);
  State<StatefulWidget> createState() {
    return _BuildMessItemState();
  }
}

class _BuildMessItemState extends State<BuildMessItem> {
  String userName, peerUserName;
  
  Future<String> _getPeerUserName() async {
    await Firestore.instance
        .collection('users')
        .document(widget.id)
        .get()
        .then((snapshot) {
      var channelName = snapshot['username'];
      assert(channelName is String);
      setState(() {
        userName = channelName;
      });
    });
    print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwww$peerUserName');
    return peerUserName;
  }

  Future<String> _getUserName() async {
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
    print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwww$userName');
    return userName;
  }

  @override
  void initState() {
    // _getPeerUserName();
    // _getUserName();
    super.initState();
  }

  @override
  Widget buildItem() {
    if (widget.document['idFrom'] == widget.id) {
      // Right (my message)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // Container(
          //   child: Text(userName ?? ''),
          // ),
          Row(
            children: <Widget>[
              widget.document['type'] == 0
                  // Text
                  ? Container(
                      child: Text(
                        widget.document['content'],
                        // style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      // width: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Colors.amber[200]),
                      margin: EdgeInsets.only(
                          bottom: 5,
                          // isLastMessageRight(widget.index) ? 20.0 : 10.0,
                          right: 0.0),
                    )
                  :
                  // Image
                  Container(
                      child: Material(
                        child: CachedNetworkImage(
                          placeholder: (BuildContext context, String url) =>
                              Container(
                                child: CircularProgressIndicator(),
                                width: 200.0,
                                height: 200.0,
                                padding: EdgeInsets.all(70.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    color: Colors.blue),
                              ),
                          errorWidget:
                              (BuildContext context, String url, Object obj) =>
                                  Material(
                                    child: Image.asset(
                                      'images/img_not_available.jpeg',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                  ),
                          imageUrl: widget.document['content'],
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        clipBehavior: Clip.hardEdge,
                      ),
                      margin: EdgeInsets.only(
                          bottom:
                              isLastMessageRight(widget.index) ? 20.0 : 10.0,
                          right: 10.0),
                    )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      );
    } else {
      // Left (peer message)
      return Container(
        child: Column(
          children: <Widget>[
            // Container(
            //   child: Text(peerUserName ?? ''),
            // ),
            Row(
              children: <Widget>[
                widget.document['type'] == 0
                    ? Container(
                        child: Text(
                          widget.document['content'],
                        ),
                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        // width: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(18.0)),
                      )
                    : Container(
                        child: Material(
                          child: CachedNetworkImage(
                            placeholder: (BuildContext context, String url) =>
                                Container(
                                  child: CircularProgressIndicator(),
                                  width: 200.0,
                                  height: 200.0,
                                  padding: EdgeInsets.all(70.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                            errorWidget: (BuildContext context, String url,
                                    Object obj) =>
                                Material(
                                  child: Image.asset(
                                    'images/img_not_available.jpeg',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                ),
                            imageUrl: widget.document['content'],
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          clipBehavior: Clip.hardEdge,
                        ),
                        margin: EdgeInsets.only(left: 10.0),
                      )
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      );
    }
  }

  

  bool isLastMessageLeft(int index) {
    if ((index > 0 &&
            widget.listMessage != null &&
            widget.listMessage[index - 1]['idFrom'] == widget.id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 &&
            widget.listMessage != null &&
            widget.listMessage[index - 1]['idFrom'] != widget.id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    return buildItem();
  }
}
