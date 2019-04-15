import 'package:dreesu/screen12.dart';
import 'package:dreesu/screen15.dart';
import 'package:dreesu/screen5.dart';
import 'package:flutter/material.dart';

class Screen14 extends StatefulWidget {
  @override
  _Screen14State createState() => _Screen14State();
}

class _Screen14State extends State<Screen14> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Screen5())),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, right: 15),
            child: FlatButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen12()));
              },
                          child: Text(
                'Done',
                style: TextStyle(color: Colors.yellow[700], fontSize: 16),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 110,
                      color: Colors.grey[200],
                    ),
                    Positioned(
                        top: 20,
                        left: 20,
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.amber,
                          size: 60,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                child: ImageSelect(),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Screen15())),
              ),
              ImageSelect(),
              ImageSelect(),
              ImageSelect(),
              ImageSelect(),
              ImageSelect(),
              ImageSelect(),
              ImageSelect(),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 30, bottom: 20),
            child: Text(
              'Add up to 9 photo',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 30, bottom: 20),
            child: Text('Tap a photo to edit or delete.',
                style: TextStyle(fontSize: 12)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 30, bottom: 20),
            child: Text(
                'Hold and drag to reorder photos. The firsr photo is your main photo.',
                style: TextStyle(fontSize: 12)),
          )
        ],
      ),
    );
  }
}

class ImageSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      child: Stack(
        children: <Widget>[
          Container(
            height: 110,
            width: 110,
            color: Colors.grey[200],
          ),
          Positioned(
              top: 2,
              left: 30,
              child: Text(
                'Image 1',
                style: TextStyle(fontSize: 12),
              )),
          Positioned(
            top: 28,
            left: 20,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'images/screen12_6.png',
              ),
            ),
            height: 60,
            width: 60,
          ),
          Positioned(
            top: 37,
            left: 40,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'images/screen12_5.png',
                height: 30,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
