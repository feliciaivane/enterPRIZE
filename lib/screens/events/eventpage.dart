
import 'package:flutter/material.dart';
import 'package:enterprize/components/navbar.dart';
import 'events.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Eventpage extends StatelessWidget {
  List imgList = [
    'https://picsum.photos/500/300?random=1',
    'https://picsum.photos/500/300?random=2',
    'https://picsum.photos/500/300?random=3',
    'https://picsum.photos/500/300?random=4',
    'https://picsum.photos/500/300?random=5',
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final item = ModalRoute.of(context)!.settings.arguments as Event;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        drawer: Navbar(),
        body: SafeArea(
          child: Center(
            child: ListView(
              children: [
                CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (context, index, realIndex) {
                    print(index);
                    return Container(
                      // height: 200,
                      child: Image.network(imgList[index]),
                    );
                  },
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                ),
                Center(child: Container(margin: EdgeInsets.all(10), child: Text(item.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))),
                Container(
                    margin: EdgeInsets.all(20), child: Text(item.description)),
                Container(
                    margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(primary: Colors.white, onSurface: Colors.teal.shade50, backgroundColor: Colors.blueGrey),
                      onPressed: () {},
                      child: Text("Sign Up"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
