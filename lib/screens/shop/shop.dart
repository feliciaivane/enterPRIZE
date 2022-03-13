import 'package:flutter/material.dart';
import 'package:enterprize/components/navbar.dart';

class Shop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopState();
  }
}

class _ShopState extends State<Shop> {
  //final _auth = FirebaseAuth.instance;
  //late User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      drawer: Navbar(),
    );
  }
}