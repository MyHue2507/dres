import 'package:dreesu/modle/product.dart';
import 'package:dreesu/screen1/product_item.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatefulWidget {
  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  Color _color = Colors.yellow[700];
  bool isMessage = false;
  Color _colorNotChoose = Colors.grey[800];
  List<Product> listProduct1 = List<Product>();
  List<Product> listProduct2 = List<Product>();
  List<Product> listProduct3 = List<Product>();
  List<Product> listProduct4 = List<Product>();
  List<List<Product>> list = List();
  List<Product> listProduct = List<Product>();

  // Product product1 = Product();
  // Product product2 = Product();
  // Product product3 = Product();
  // Product product4 = Product();
  // Product product5 = Product();
    Product product1 ;
  Product product2 ;
  Product product3 ;
  Product product4 ;
  Product product5 ;
  Product product6 ;
  Product product ;

  List<bool> isSelect = [true, false, false, false];
  _buildItemBottom(int i, String image) {
    return Opacity(
      opacity: isSelect[i] ? 1 : 0.5,
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Stack(
          children: <Widget>[
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  color: isSelect[i] ? _color : _colorNotChoose,
                  borderRadius: BorderRadius.circular(85)),
            ),
            Container(
              padding: EdgeInsets.only(top: 2.5, left: 2.5),
              child: ClipRRect(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelect[i] = true;
                      for (int j = 0; j <= 3; j++)
                        if ((j != i)) {
                          isSelect[j] = false;
                        }
                      listProduct = list[i];
                    });
                  },
                  child: Image.asset(
                    image,
                    height: 60,
                  ),
                ),
                borderRadius: BorderRadius.circular(85),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    product1.imageUrl = 'images/home1.jpg';
    product1.category = 'Zara';
    product1.price = '90';
    product1.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct1.add(product1);
    product2.imageUrl = 'images/home2.jpg';
    product2.category = 'Chanel';
    product2.price = '90';
    product2.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct1.add(product2);
    product3.imageUrl = 'images/home3.jpg';
    product3.category = 'Zara';
    product3.price = '90';
    product3.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct1.add(product3);
    product4.imageUrl = 'images/home4.jpg';
    product4.category = 'Chanel';
    product4.price = '90';
    product4.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct1.add(product4);
    product5.imageUrl = 'images/home5.jpg';
    product5.category = 'Zara';
    product5.price = '90';
    product5.description =
        'Short description of the dress.Never used. Damage or any other defects.Ed elum vellupt iorumque cum estia sunt ut volupta tiberat accabo.Rovit quidipi cieturest...';
    listProduct1.add(product5);
    listProduct2.add(product5);
    listProduct2.add(product4);
    listProduct2.add(product3);
    listProduct2.add(product2);
    listProduct2.add(product1);

    listProduct3.add(product4);
    listProduct3.add(product2);
    listProduct3.add(product3);
    listProduct3.add(product1);
    listProduct3.add(product4);

    listProduct4.add(product2);
    listProduct4.add(product3);
    listProduct4.add(product3);
    listProduct4.add(product4);
    listProduct4.add(product4);

    list.add(listProduct1);
    list.add(listProduct2);
    list.add(listProduct3);
    list.add(listProduct4);

    listProduct = list[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30),
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(listProduct.length, (index) {
                    return ProductItem(
                      product: listProduct[index],
                    );
                  })),
            ),
            Container(
              color: Colors.black,
              height: 50,
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment(0, -1),
              child: Text(
                'Matches',
                style: TextStyle(color: _color, fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, right: 20),
              alignment: Alignment(1, -1),
              child: GestureDetector(
                child: Image.asset('images/refresh.png'),
                onTap: () {
                  // Navigator.of(context).pop();
                  setState(() {
                    isMessage = true;
                  });
                },
              ),
              height: 40,
            ),
            Positioned(
              bottom: -350,
              left: -50,
              right: -50,
              child: Stack(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                        color: Color.fromARGB(200, 0, 0, 0),
                      ),
                      height: MediaQuery.of(context).size.width + 110,
                      width: MediaQuery.of(context).size.width + 110),
                  Positioned(
                    top: 6,
                    left: 180,
                    child: Text(
                      'My Dresses',
                      style: TextStyle(color: _color, fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 4, top: 40),
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext conntext, int index) {
                        return _buildItemBottom(
                            index, 'images/matches${index + 1}.jpg');
                      },
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
            isMessage
                ? Positioned(
                    child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isMessage = false ;
                            });
                          },
                          iconSize: 120,
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/Path 413.png',
                                height: 100,
                              ),
                              Text(
                                'Dreesu',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            
                          },
                          iconSize: 120,
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/Path 414.png',
                                height: 100,
                              ),
                              Text('Call',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17))
                            ],
                          ),
                        )
                      ],
                    )),
                    color: Color.fromARGB(200, 0, 0, 0),
                  ))
                : Container(),
          ],
        ),
      ),
    );
  }
}
