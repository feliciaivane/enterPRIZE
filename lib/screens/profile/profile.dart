import 'package:flutter/material.dart';
import 'package:enterprize/components/navbar.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  //final _auth = FirebaseAuth.instance;
  //late User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: Navbar(),
    );
  }
}