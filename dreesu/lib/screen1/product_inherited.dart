// import 'package:eloggmap/modle/product.dart';
// import 'package:flutter/material.dart';

// class _MyInherited extends InheritedWidget {
//   final MyInheritedWidgetState data;
//   _MyInherited({Key key, @required Widget child, @required this.data})
//       : super(key: key, child: child);
//   @override
//   bool updateShouldNotify(_MyInherited oldWidget) {
//     return true;
//   }
// }

// class MyInheritedWidget extends StatefulWidget {
//   MyInheritedWidget({
//     Key key,
//     this.child,
//   }) : super(key: key);

//   final Widget child;

//   @override
//   MyInheritedWidgetState createState() => new MyInheritedWidgetState();

//   static MyInheritedWidgetState of(BuildContext context) {
//     return (context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited)
//         .data;
//   }
// }

// class MyInheritedWidgetState extends State<MyInheritedWidget> {
//   List<Product> _items = <Product>[];

//   int get itemsCount => _items.length;
//   List<Product> getItem(){
//     return _items ;
//   }
//   void addItem(Product product) {
//     setState(() {
//       _items.add(product);
//     });
//   }

//   void deleteItem(Product product) {
//     setState(() {
//       _items.remove(product);
//     });
//   }
//    void creatItem(List<Product> list) {
//     setState(() {
//       _items = list ;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new _MyInherited(
//       data: this,
//       child: widget.child,
//     );
//   }
// }
