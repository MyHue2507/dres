import 'dart:async';
import 'dart:io';

import 'package:dreesu/chat_demo/send_mess.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuildInput extends StatefulWidget {
  String groupChatId;
  String listMessage;

  bool isLoading;

  String id;
  String peerId;
  bool isShowSticker;
  BuildInput(
      {Key key,
      @required this.groupChatId,
      @required this.listMessage,
      @required this.isShowSticker,
      @required this.isLoading,
      @required this.id,
      @required this.peerId})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BuildInputState();
  }
}

class _BuildInputState extends State<BuildInput> {
  String imageUrl;
  File imageFile;
  SendMessage sendMess = SendMessage();
  TextEditingController textEditingController;
  Future<File> getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = image;
        widget.isLoading = true;
      });
    }
    return imageFile;
  }

  Future<String> uploadFile(File imageFilePut) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = await FirebaseStorage.instance.ref().child(fileName);
    await reference.putFile(imageFilePut).onComplete.then((onValue) async{
      await onValue.ref.getDownloadURL().then((value) {
        setState(() {
          imageUrl = value.toString();
          print('11111111111111111111111111$imageUrl');
          print('222222222222${value.toString()}');
          widget.isLoading = false;
        });
      });
    });
    return imageUrl;
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.image),
                onPressed: () async {
                  getImage().then((value) {
                    uploadFile(value).then((onValue) {
                      imageUrl = onValue;
                       sendMess.onSendMessage(imageUrl, 1, widget.id,
                        widget.peerId, widget.groupChatId);
                    });
                  });
                  // var _duration = new Duration(seconds: 10);
                  // Timer(_duration, () {
                    print(imageUrl);
                   
                  // });
                },
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () {
                    sendMess.onSendMessage(textEditingController.text, 0,
                        widget.id, widget.peerId, widget.groupChatId);
                    textEditingController.clear();
                  }),
            ),
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(top: new BorderSide(width: 0.5))),
    );
  }

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildInput();
  }
}
