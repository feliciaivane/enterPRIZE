
import 'package:flutter/material.dart';
import 'package:enterprize/components/navbar.dart';
import 'event.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:enterprize/screens/events/event.dart';

class Eventpage extends StatelessWidget {
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
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: CarouselSlider.builder(
                    itemCount: item.pic_url.length,
                    itemBuilder: (context, index, realIndex) {
                      print(index);
                      return Container(
                        // height: 200,
                        child: Image.network(item.pic_url[index]),
                      );
                    },
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                    ),
                  ),
                ),
                Center(child: Container(margin: EdgeInsets.all(10), child: Text(item.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0), child: Row(
                        children: [
                          const Text("Date:  ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(item.dateOfEvent),
                        ],
                      ),
                    ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0), child: Row(
                  children: [
                    const Text("Time:  ", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(item.time),
                  ],
                )),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0), child: Row(
                  children: [
                    const Text("Location:  ", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(item.location),
                  ],
                )),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0), child: Text(item.description)),
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
