import 'package:flutter/material.dart';
import 'package:enterprize/components/navbar.dart';

class Events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventsState();
  }
}

class _EventsState extends State<Events> {
  //final _auth = FirebaseAuth.instance;
  //late User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      drawer: Navbar(),
    );
  }
}