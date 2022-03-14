import 'package:flutter/material.dart';
import 'dart:core';
import 'package:enterprize/style.dart';
import 'package:enterprize/screens/profile/settings_person.dart';

class ProfilePerson extends StatefulWidget {
  @override
  createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        automaticallyImplyLeading: false,
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
                        child: Text('Bob',
                            style:
                            TitleTextStyle), //change to actual user's name
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Text('bobthebuilder',
                            style:
                            BlackBodyTextStyle), //change to actual user's username
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                        child: Text('User',
                            style:
                            BlackBodyTextStyle), //change to actual user's username
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150.0, 30.0, 0.0, 0.0),
                    child: Container(
                      width: 100,
                      height: 80,
                      child: Image.asset('assets/images/bob.png'), //change to actual user's dp
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 70.0, 0.0, 0.0),
                child: Text('Upcoming Events', style: TitleTextStyle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
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
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Event 3'),
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
                child: Text('Past Events', style: TitleTextStyle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
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
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Event 3'),
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
                    child: Text('Social', style: TitleTextStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(235.0, 70.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(Icons.star),
                      iconSize: 30,
                      tooltip: "Add favourite",
                      onPressed: () {
                        //Navigator.push(context,
                        //    MaterialPageRoute(builder: (_) => AddFriends()));
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 0.0),
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
                        child: Text('Favourite Enterprises',
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
                                  'No organisations yet :('), //MAKE IT SHOW ACTUAL ADDED FRIENDS!!
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 0.0),
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
                        child: Text('Pictures',
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
                                  'No pictures uploaded yet :('), //MAKE IT SHOW ACTUAL FOLLOWERS!!
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
