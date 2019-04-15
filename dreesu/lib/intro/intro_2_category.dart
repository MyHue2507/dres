import 'package:dreesu/intro/intro_3_size.dart';
import 'package:dreesu/main.dart';
import 'package:dreesu/screen1/screen1.dart';
import 'package:flutter/material.dart';

class Intro2Category extends StatefulWidget {
  final Widget child;

  Intro2Category({Key key, this.child}) : super(key: key);

  _Intro2CategoryState createState() => _Intro2CategoryState();
}

class _Intro2CategoryState extends State<Intro2Category> {
  bool init = true;
  List<bool> selected = [false, false, false, false];
  List<Category> listCategories = List<Category>();
  Category category1 = Category();
  Category category2 = Category();
  Category category3 = Category();
  Category category4 = Category();
  @override
  void initState() {
    category1.image = 'category1';
    category1.name = 'Wedding';
    listCategories.add(category1);
    category2.image = 'category3';
    category2.name = 'Cooktail';
    listCategories.add(category2);
    category3.image = 'category4';
    category3.name = 'Work';
    listCategories.add(category3);
    category4.image = 'category2';
    category4.name = 'Daily';
    listCategories.add(category4);
    super.initState();
  }

  buildItem(String image, String text, int index) {
    return Container(
      child: Opacity(
        opacity: init ? 1 : selected[index] ? 1 : 0.5,
        child: Column(
          children: <Widget>[
            Container(
                height: 73, width: 48, child: Image.asset('images/$image')),
            Container(
              height: 18,
              margin: EdgeInsets.only(top: 7),
              child: Text(
                text,
                style: TextStyle(
                    color:
                        selected[index] == false ? Colors.white : Colors.amber,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment(0, -0.65),
              child: Text(
                'I Want a Dress',
                style: TextStyle(color: Colors.white, fontSize: 28),
              )),
          Container(
            margin: EdgeInsets.only(top: 220),
            alignment: Alignment.center,
            child: Container(
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: <Widget>[
              //     buildItem('category1.png', 'Wedding'),
              //     buildItem('category3.png', 'Cooktail'),
              //     buildItem('category4.png', 'Work'),
              //     buildItem('category2.png', 'Daily'),
              //   ],
              // ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          init = false;
                          selected[index] = true;
                          for (int i = 0; i < 4; i++) {
                            if (i != index)
                              setState(() {
                                selected[i] = false;
                              });
                          }
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Intro3Size(
                                  imageCategory: listCategories[index].image,
                                  nameCategory: listCategories[index].name,
                                )));
                      },
                      child: buildItem(
                          selected[index]
                              ? '${listCategories[index].image}_amber.png'
                              : '${listCategories[index].image}.png',
                          listCategories[index].name,
                          index),
                    );
                  })),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 60),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 45,
              width: 295,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(30)),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => Screen1()));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Category {
  String image;
  String name;
  Category({this.image, this.name});
}
