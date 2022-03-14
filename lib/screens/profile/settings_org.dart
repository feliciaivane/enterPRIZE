import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:enterprize/style.dart';
import 'package:enterprize/screens/login/login.dart';
import 'package:enterprize/screens/profile/profile_org.dart';

class SettingsOrg extends StatefulWidget {
  @override
  createState() => _SettingsState();
}

class _SettingsState extends State<SettingsOrg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(161.0, 30.0, 0.0, 0.0),
                child: Container(
                  width: 100,
                  height: 80,
                  child: Image.asset(
                      'assets/images/kermit.png'), //change to actual user's dp
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(153.0, 10.0, 0.0, 0.0),
                child: Text('Change Photo'),
              ),
              infoBoxWithLabel('Name', 'Bob'),
              //change to actual user's name
              infoBoxWithLabel('Username', 'bobthebuilder'),
              //change to actual user's username
              infoBoxWithLabel('Email', 'haha@gmail.com'),
              //change to actual user's email
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
                child: Text('Password'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                child: Container(
                  height: 55,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                      onPressed: () {
                     // Navigator.push(context,
                     //     MaterialPageRoute(builder: (_) => ChangePassword()));
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(' xxxxxxxxx (Hidden)',
                          style: BlackBodyTextItalicStyle),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 35.0, 30.0, 0.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: LoginButtonTextStyle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 60.0, 30.0, 0.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    child: Text(
                      'Log Out',
                      style: LoginButtonTextStyle,
                    ),
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

Widget infoBoxWithLabel(String label, String info) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
          child: Text(label),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: info,
              labelStyle: BlackBodyTextStyle,
            ),
          ),
        ),
      ],
    ),
  );
}
