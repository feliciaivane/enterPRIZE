import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:enterprize/style.dart';
import 'package:enterprize/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsPerson extends StatefulWidget {
  @override
  createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPerson> {
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
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.blueGrey,
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
                  child: Image.asset('assets/images/dp.jpeg'), //change to actual user's dp
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(153.0, 10.0, 0.0, 0.0),
                child: Text('Change Photo'),
              ),
              infoBoxWithLabel('Name', '${userData['firstName']}'),
              //change to actual user's name
              infoBoxWithLabel('Username', '${userData['username']}'),
              //change to actual user's username
              infoBoxWithLabel('Email', '${userData['email']}'),
              //change to actual user's email
              infoBoxWithLabel('Password', 'XXXXX (hidden)'),
              //change to actual user's email
              Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 35.0, 30.0, 0.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
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
