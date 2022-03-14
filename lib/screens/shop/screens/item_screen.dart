import 'package:flutter/material.dart';

class MyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("White Model Tee"),
        backgroundColor: Colors.blueGrey,
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
        ]),
      ),
    );
  }
}

Widget item = Container(
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
                'White Model Tee',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              '\$10',
              style: TextStyle(
                height: 2,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'This shirt is amazing. Please buy it to support our cause!',
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