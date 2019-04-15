import 'package:flutter/material.dart';

class Screen15 extends StatefulWidget {
  @override
  _Screen15State createState() => _Screen15State();
}

class _Screen15State extends State<Screen15> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 15),
            height: 70,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text('Done',
                      style: TextStyle(fontSize: 18, color: Colors.amber)),
                )
              ],
            ),
          ),
        ),
        Center(child: Image.asset('images/matches4.JPG')),
        Positioned(
          bottom: 0,
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.crop,
                    color: Colors.white,
                    size: 30,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
