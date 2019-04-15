import 'dart:io';

import 'package:dreesu/add_product_demo/add_product.dart';
import 'package:dreesu/dashboard_demo/dashboard_screen.dart';
import 'package:dreesu/modle/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // Product product;
  String imageUrl = null,
      pri = null,
      id = null,
      category = null,
      description = null,
      seller = null;
  TextEditingController price;
  TextEditingController brand;
  TextEditingController descrip;
  FirebaseUser firebaseUser;
  Future isSignedIn() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    firebaseUser = await _auth.currentUser();
  }

  void isColor() {
    if (price.text.isEmpty ||
        descrip.text.isEmpty ||
        brand.text.isEmpty ||
        imageFile == null)
      setState(() {
        _color = Colors.grey;
      });
    else
      setState(() {
        _color = Colors.amber;
      });
  }

  @override
  void initState() {
    price = TextEditingController();
    descrip = TextEditingController();
    brand = TextEditingController();
    showImage = CircleAvatar(
      backgroundImage: NetworkImage('images/screen5_icon.png', scale: 0.5),
      radius: 80,
    );
    super.initState();
    isSignedIn().then((_){
      seller = firebaseUser.uid;
    });
  }

  AddProduct _addProduct = AddProduct();
  String urlAvatar;
  String nameHome;
  File imageFile = null;
  Color colorBule = Colors.blue;
  Widget showImage;
  Future<File> _imageFile;
  Color _color = Colors.grey;
  bool _isLoading = false;

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Container(
        child: Center(child: CircularProgressIndicator()));
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Future getImage() async {
    _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
    return _imageFile;
  }

  Future uploadFile(File imageFilePut) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    await reference.putFile(imageFilePut).onComplete.then((onValue) async {
      await onValue.ref.getDownloadURL().then((onVa) {
        imageUrl = onVa.toString();
      });
    });
  }

  Widget _previewImage(Future<File> _imageFile) {
    return FutureBuilder<File>(
        future: _imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return CircleAvatar(
              backgroundImage: FileImage(snapshot.data),
              radius: 80,
            );
          } else if (snapshot.error != null) {
            return const Text(
              'Error picking image.',
              textAlign: TextAlign.center,
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return const Text(
              'You have not yet picked an image.',
              textAlign: TextAlign.center,
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  @override
  void dispose() {
    price.dispose();
    brand.dispose();
    descrip.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Add Product',
          style: TextStyle(fontSize: 17),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: showImage,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: RaisedButton(
                    elevation: 0.0,
                    child: Text(
                      'Choose image',
                      style: TextStyle(color: Colors.amber),
                    ),
                    onPressed: () async {
                      await getImage().then((value) {
                        setState(() {
                          showImage = _previewImage(_imageFile);
                          imageFile = value;
                        });
                        isColor();
                      });
                    },
                  ),
                ),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
                    child: TextField(
                        controller: brand,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(hintText: 'Brand'),
                        onChanged: (String str) {
                          category = str;
                          isColor();
                        }),
                  ),
                ),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
                    child: TextField(
                      controller: price,
                      cursorColor: Colors.white,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(hintText: 'Price'),
                      onChanged: (String str) {
                        pri = str;
                        isColor();
                      },
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
                    child: TextField(
                      controller: descrip,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(hintText: 'description'),
                      onChanged: (String str) {
                        description = str;
                        isColor();
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: RaisedButton(
                child: Text('Add',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                color: _color,
                onPressed: () async {
                  if (_color == Colors.amber) {
                    setState(() {
                      _isLoading = true;
                    });
                    if (imageFile != null) {
                      await uploadFile(imageFile).then((_) async {
                        await _addProduct
                            .onAddProduct(Product(category, description,
                                imageUrl, pri, seller, id))
                            .then((_) {
                          setState(() {
                            _isLoading = false;
                          });
                          price.clear();
                          brand.clear();
                          descrip.clear();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => DashboardScreen()));
                        });
                      });
                    }
                  }
                },
              ),
            ),
            _showCircularProgress()
          ],
        ),
      ),
    );
  }
}
