import 'package:flutter/material.dart';

class Screen16 extends StatefulWidget {
  @override
  _Screen16State createState() => _Screen16State();
}

class _Screen16State extends State<Screen16> {
  Widget issue(String text) => Padding(
    padding: EdgeInsets.all(5),
    child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Text(
            text,
            style: TextStyle(color: Colors.amber),
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(20)),
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Dreesu swap'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.center,
                            image: AssetImage('images/matches4.JPG')),
                        borderRadius: BorderRadius.circular(120)),
                  ),
                  Text(
                    'Your',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Lucky Day Maxi Dress',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.center,
                            image: AssetImage('images/home5.jpg')),
                        borderRadius: BorderRadius.circular(120)),
                  ),
                  Text(
                    'Louisa\'s',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Silver night dress',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Rate your swap',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 50,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 50,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 50,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 50,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 50,
                )
              ],
            ),
          ),
          Center(
            child: Text(
              'Had some issues?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                issue('Trouble finding'),
                issue('Behaviour'),
                issue('Cleanliness'),
                issue('Broken dress'),
                issue('Wrong size'),
                issue('Other'),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 120,
            margin: EdgeInsets.only(top: 20,left: 35,right: 35),
            padding: EdgeInsets.only(left: 40,right: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,

            ),
            child: Center(child: Text('SUBMIT',style: TextStyle(color: Colors.white, fontSize: 18),)),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
