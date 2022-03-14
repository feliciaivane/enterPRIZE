

import 'package:flutter/material.dart';
import 'package:enterprize/screens/events/eventpage.dart';
import 'package:enterprize/components/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:enterprize/screens/events/event.dart';
import '../../main.dart';


class Events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventsState();
  }
}

Widget buildEventCard(Event event) {
  return Container(
    color: Colors.grey.shade100,
    margin: EdgeInsets.all(10),
    child: Card(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Image.network(
                event.pic_url[0],
                height: 150,
                width: 300,
              ),
              Text(event.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
            ],
          ),
        ),
        onTap: () {
          navigatorKey.currentState?.push(
              MaterialPageRoute(builder: (_) => Eventpage(), settings: RouteSettings(arguments: event)));
        },
      ),
    ),
  );
}



class _EventsState extends State<Events> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late var data;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getEventData();
  }


  void getEventData() {
    setState(() {
      data = getEvents();
    });

  }

  void getCurrentUser() async {
    try{
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }

  }

  String search = '';
  @override
  Widget build(BuildContext context) {
    getEventData();
    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: Text("Events"),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    child: Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: TextField(
                            onChanged: (value) {
                              search = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Search for.....',
                            )),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (search != '') {
                          events = events
                              .where((element) =>
                                  element.tags.contains(search.toLowerCase()))
                              .toList();
                        }
                      });
                    },
                    icon: Icon(Icons.search, size: 30),
                  )
                ],
              ),
              ...events.map((e) => buildEventCard(e))
            ],
          ),
        ),
      );
  }
}


