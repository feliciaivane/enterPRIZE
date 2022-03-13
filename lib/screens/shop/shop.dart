

import 'package:flutter/material.dart';
import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';
import 'package:enterprize/components/navbar.dart';

import '../../main.dart';

void main() {
  runApp(Shop());
}

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      routes: {
        //'/second': (context) => SecondScreen(),
        '/second': (context) => MyApp(),
      },
      title: 'MyApp',
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shop',
        home: Scaffold(
          drawer: Navbar(),
          appBar: AppBar(
            title: const Text('Shop'),
            backgroundColor: Colors.teal,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              item1,
            ]),
          ),
        ));
  }
}

Widget item1 = InkWell(
  child: create,
  onTap: () {
    navigatorKey.currentState?.pushNamed('/second');
  }, // Handle your callback
);

Widget create = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Image.asset(
        'assets/images/shirt.jpeg',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                '<Item Name>',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              '<Insert description here>',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      const Text('<price>'),
    ],
  ),
);

Widget item = Title;

Widget Title = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                '<Item Name>',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              '<Price>',
              style: TextStyle(
                height: 2,
                fontSize: 18,
              ),
            ),
            Text(
              'Insert item description here ...........................................................',
              //textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(height: 1),
            ),
          ],
        ),
      ),
    ],
  ),
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AddToCartButtonStateId stateId = AddToCartButtonStateId.idle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text("<Item Name>"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            'assets/images/shirt.jpeg',
            width: 500,
            height: 350,
            fit: BoxFit.cover,
          ),
          item,
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: AddToCartButton(
                    trolley: Image.asset(
                      'assets/ic_cart.png',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                    text: Text(
                      'Add to cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    check: SizedBox(
                      width: 48,
                      height: 48,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(24),
                    backgroundColor: Colors.deepOrangeAccent,
                    onPressed: (id) {
                      if (id == AddToCartButtonStateId.idle) {
                        //handle logic when pressed on idle state button.
                        setState(() {
                          stateId = AddToCartButtonStateId.loading;
                          Future.delayed(Duration(seconds: 3), () {
                            setState(() {
                              stateId = AddToCartButtonStateId.done;
                            });
                          });
                        });
                      } else if (id == AddToCartButtonStateId.done) {
                        //handle logic when pressed on done state button.
                        setState(() {
                          stateId = AddToCartButtonStateId.idle;
                        });
                      }
                    },
                    stateId: stateId,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

