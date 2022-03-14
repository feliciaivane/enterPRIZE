import 'package:flutter/material.dart';
import 'dart:core';
import 'package:enterprize/style.dart';
import 'package:enterprize/screens/profile/settings_org.dart';

class ProfileOrg extends StatefulWidget {
  @override
  createState() => _ProfileState();
}

class _ProfileState extends State<ProfileOrg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enterprise Profile"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: "Go to Settings",
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SettingsOrg()));
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
                        child: Text('Kermit Enterprise',
                            style:
                            TitleTextStyle), //change to actual user's name
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Text('kermit.org',
                            style:
                            BlackBodyTextStyle), //change to actual user's username
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                        child: Text('Enterprise',
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
                      child: Image.asset('assets/images/kermit.png'), //change to actual user's dp
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 70.0, 0.0, 0.0),
                child: Text('Settings', style: TitleTextStyle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Manage Events'),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Add New Events'),
                  ),
                ],
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Manage Stores'),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                    child: label(
                        'Edit Information'),
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
                      icon: Icon(Icons.person_add),
                      iconSize: 30,
                      tooltip: "Add connection",
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
                        child: Text('Connected',
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
                                  'No organisations connected yet :('), //MAKE IT SHOW ACTUAL ADDED FRIENDS!!
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

Widget statsLabel(String image, int value, String stats) {
  return Container(
    height: 60,
    width: 170,
    decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5)),
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 50,
            height: 40,
            child: Image.asset(
                'assets/images/just_orca.jpg'), //change to actual user's dp
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 5.0, 0.0),
              child: Text(value.toString(), style: BlackBodyTextBoldStyle),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 0.0, 5.0, 5.0),
              child: Text(stats),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget label(String stats) {
  return Container(
    height: 60,
    width: 170,
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
