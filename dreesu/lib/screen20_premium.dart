import 'package:dreesu/screen17.dart';
import 'package:dreesu/screen21_payment.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PremiumScreenState();
  }
}

class PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/screen20.png"),
            fit: BoxFit.fitHeight,
          )),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.4),
        ),
        Positioned(
          top: 8,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Screen17()));
                    }),
                Text('Dressu Premium',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400)),
                        SizedBox(width: 40,)
              ],
            ),
          ),
        ),
        Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Container(
                margin: EdgeInsets.only(left: 100.0, bottom: 2.0),
                child: Text("Try Premium free for 30 days.",
                    style: TextStyle(color: Colors.white, fontSize: 13.0)),
              ),
              Container(
                margin: EdgeInsets.only(left: 115.0, bottom: 20.0),
                child: Text("Only \$4.99/month after.*",
                    style: TextStyle(color: Colors.white, fontSize: 13.0)),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 55),
                  height: 60,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amber),
                  child: FlatButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => PayMentScreen())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Start Free Trial',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.chevron_right,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 130.0, bottom: 20.0),
                child: Text("Why Premium?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w300)),
              ),
              Container(
                margin: EdgeInsets.only(left: 80.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Icon(
                    Icons.done,
                    color: Colors.amber,
                    size: 30.0,
                  ),
                  Text("  No ads",
                      style: TextStyle(color: Colors.white, fontSize: 15.0)),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 80.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.done,
                      color: Colors.amber,
                      size: 30.0,
                    ),
                    Text("  Multiple size dresses",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 80.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.done,
                      color: Colors.amber,
                      size: 30.0,
                    ),
                    Text("  Multiple size dresses",
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 80.0, bottom: 120.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.done,
                      color: Colors.amber,
                      size: 30.0,
                    ),
                    Text("  Multiple size dresses",
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("*Term and conditions apply.",
                        style: TextStyle(color: Colors.white, fontSize: 10.0)),
                    Text("Only for users who haven't already try Premium.",
                        style: TextStyle(color: Colors.white, fontSize: 10.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));

    // return MaterialApp(
    //   home: Container(
    //     decoration: BoxDecoration(
    //         image: DecorationImage(
    //       image: AssetImage("images/screen20.jpg"),
    //       fit: BoxFit.fitHeight,
    //       colorFilter: new ColorFilter.mode(
    //           Colors.green.withOpacity(0.8), BlendMode.hue),
    //     )),
    //     child: Scaffold(
    //       backgroundColor: Colors.transparent,
    //       appBar: AppBar(
    //         elevation: 0,
    //         backgroundColor: Colors.transparent,
    //         title: Text(
    //           'Dreesu Premium',
    //           style: TextStyle(
    //               color: Colors.white,
    //               fontSize: 16.0,
    //               fontWeight: FontWeight.bold),
    //         ),
    //         centerTitle: true,
    //         leading: IconButton(
    //             icon: Icon(
    //               Icons.chevron_left,
    //               color: Colors.white,
    //             ),
    //             onPressed: () {
    //               Navigator.of(context)
    //                   .push(MaterialPageRoute(builder: (_) => Screen17()));
    //             }),
    //       ),
    //       body: Center(
    //         child: ListView(
    //           children: <Widget>[
    //             Container(
    //               margin: EdgeInsets.only(left: 100.0, bottom: 2.0),
    //               child: Text("Try Premium free for 30 days.",
    //                   style: TextStyle(color: Colors.white, fontSize: 13.0)),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(left: 115.0, bottom: 20.0),
    //               child: Text("Only \$4.99/month after.*",
    //                   style: TextStyle(color: Colors.white, fontSize: 13.0)),
    //             ),
    //             Center(
    //               child: Container(
    //                 margin: EdgeInsets.only(top: 10, bottom: 55),
    //                 height: 60,
    //                 width: 280,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(30),
    //                     color: Colors.amber),
    //                 child: FlatButton(
    //                   onPressed: () => Navigator.of(context).push(
    //                       MaterialPageRoute(builder: (_) => PayMentScreen())),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: <Widget>[
    //                       SizedBox(
    //                         width: 20,
    //                       ),
    //                       Text(
    //                         'Start Free Trial',
    //                         style: TextStyle(fontWeight: FontWeight.w700),
    //                       ),
    //                       Icon(
    //                         Icons.chevron_right,
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(left: 130.0, bottom: 20.0),
    //               child: Text("Why Premium?",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 13.0,
    //                       fontWeight: FontWeight.w300)),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(left: 80.0, bottom: 10.0),
    //               child: Row(children: <Widget>[
    //                 Icon(
    //                   Icons.done,
    //                   color: Colors.amber,
    //                   size: 30.0,
    //                 ),
    //                 Text("  No ads",
    //                     style: TextStyle(color: Colors.white, fontSize: 15.0)),
    //               ]),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(left: 80.0, bottom: 10.0),
    //               child: Row(
    //                 children: <Widget>[
    //                   Icon(
    //                     Icons.done,
    //                     color: Colors.amber,
    //                     size: 30.0,
    //                   ),
    //                   Text("  Multiple size dresses",
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 15.0,
    //                       )),
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(left: 80.0, bottom: 10.0),
    //               child: Row(
    //                 children: <Widget>[
    //                   Icon(
    //                     Icons.done,
    //                     color: Colors.amber,
    //                     size: 30.0,
    //                   ),
    //                   Text("  Multiple size dresses",
    //                       style:
    //                           TextStyle(color: Colors.white, fontSize: 15.0)),
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(left: 80.0, bottom: 120.0),
    //               child: Row(
    //                 children: <Widget>[
    //                   Icon(
    //                     Icons.done,
    //                     color: Colors.amber,
    //                     size: 30.0,
    //                   ),
    //                   Text("  Multiple size dresses",
    //                       style:
    //                           TextStyle(color: Colors.white, fontSize: 15.0)),
    //                 ],
    //               ),
    //             ),
    //             Center(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: <Widget>[
    //                   Text("*Term and conditions apply.",
    //                       style:
    //                           TextStyle(color: Colors.white, fontSize: 10.0)),
    //                   Text("Only for users who haven't already try Premium.",
    //                       style:
    //                           TextStyle(color: Colors.white, fontSize: 10.0)),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
