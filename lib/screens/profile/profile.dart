import 'package:flutter/material.dart';
import 'package:enterprize/components/navbar.dart';
import 'package:enterprize/style.dart';
import 'package:enterprize/screens/profile/settings_person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  var userData;

  void getUserData() async {
    final user = _auth.currentUser;
    await _firestore.collection("User").doc(user?.uid).collection("Profile").doc(user?.uid).get().then((value) {
      setState(() {
        userData = value.data();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState3
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: "Go to Settings",
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SettingsPerson()));
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
                        child: Text('${userData['firstName']}',
                          style: TitleTextStyle,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Text('${userData['username']}',
                            style: BlackBodyTextStyle),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                        child: Text('${userData['email']}',
                            style: BlackBodyTextStyle),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60.0, 30.0, 0.0, 0.0),
                    child: Container(
                      width: 100,
                      height: 80,
                      child: Image.asset('assets/images/dp.jpeg')//change to actual user's dp
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 70.0, 0.0, 0.0),
                child: Text('Upcoming Events To Attend', style: TitleTextStyle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 20.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_circle_left_rounded ),
                      iconSize: 20,
                      tooltip: "More Events",
                      onPressed: () {
                        //Navigator.push(context,
                        //    MaterialPageRoute(builder: (_) => AddFriends()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Event 1'),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Event 2'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_circle_right_rounded ),
                      iconSize: 20,
                      tooltip: "More Events",
                      onPressed: () {
                        //Navigator.push(context,
                        //    MaterialPageRoute(builder: (_) => AddFriends()));
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 70.0, 0.0, 0.0),
                child: Text('Past Events Attended', style: TitleTextStyle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 20.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_circle_left_rounded ),
                      iconSize: 20,
                      tooltip: "More Events",
                      onPressed: () {
                        //Navigator.push(context,
                        //    MaterialPageRoute(builder: (_) => AddFriends()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Event 1'),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Event 2'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_circle_right_rounded ),
                      iconSize: 20,
                      tooltip: "More Events",
                      onPressed: () {
                        //Navigator.push(context,
                        //    MaterialPageRoute(builder: (_) => AddFriends()));
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 70.0, 0.0, 0.0),
                    child: Text('For Organizations Only', style: TitleTextStyle),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
                child: Container(
                  height: 220,
                  width: 363,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 10.0),
                        child: Text('My Events',
                            style: AchievementsTitleTextStyle),
                      ),
                      Container(
                        height: 70,
                        width: 300,
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 10.0, 0.0, 10.0),
                              child: Text(
                                  'No events hosted yet :('), //MAKE IT SHOW ACTUAL ADDED FRIENDS!!
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 0.0),
                child: Container(
                  height: 220,
                  width: 363,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 10.0),
                        child: Text('My Item Listings',
                            style: AchievementsTitleTextStyle),
                      ),
                      Container(
                        height: 70,
                        width: 300,
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 10.0, 0.0, 10.0),
                              child: Text(
                                  'No items posted yet :('), //MAKE IT SHOW ACTUAL FOLLOWERS!!
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget label(String stats) {
  return Container(
    height: 60,
    width: 100,
    decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5)),
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            width: 20,
            height: 50,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Center(
                child: Text(stats,
                  textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}