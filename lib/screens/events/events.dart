

import 'package:flutter/material.dart';
import 'package:enterprize/screens/events/eventpage.dart';
import 'package:enterprize/components/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../main.dart';


class Events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventsState();
  }
}

Widget buildEventCard(Event event) {
  return Card(
    child: InkWell(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Image.network(
              event.url,
              height: 75,
              width: 150,
            ),
            Text(event.title)
          ],
        ),
      ),
      onTap: () {
        navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (_) => Eventpage(), settings: RouteSettings(arguments: event)));
      },
    ),
  );
}

class Event {
  late String title;
  late String url;
  late var tags = [];
  late String description;

  Event(this.title, this.url, this.tags, this.description);

}

class _EventsState extends State<Events> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try{
      final user = await _auth.currentUser!;
      if (user!= null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }

  }
  var events = [
    Event(
        "Terrarium Making",
        "https://www.thespruce.com/thmb/YDuotPpcMtxRUmwzo-jvNHGGPdo=/4118x2749/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-make-terrariums-848007-13-58ad30a4238043e489d8deaba771e7c2.jpg",
        ['plants', 'terrarium', 'nature'],
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce interdum magna purus, vel lobortis lacus accumsan ac. Proin tempor leo vitae ante luctus congue. Praesent blandit, orci id scelerisque dapibus, felis metus consequat neque, et aliquet massa arcu non erat. Phasellus risus ex, faucibus at feugiat a, interdum id odio. Cras ac augue quis turpis feugiat placerat quis eget metus. Vestibulum finibus urna quis elit porttitor mollis. Duis non posuere ante, sit amet laoreet felis. Sed sit amet vulputate felis. Cras condimentum, velit sed ullamcorper pulvinar, sem est sagittis lorem, non sodales urna risus non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec ut dictum lorem. Aliquam volutpat, tortor et placerat egestas, odio ex vehicula lorem, vitae luctus eros nisi nec neque. Nunc et blandit odio, posuere scelerisque nulla. Aliquam in lorem leo. Suspendisse fermentum dictum nibh, vitae elementum purus pharetra nec. Sed quis scelerisque nisl.'),
    Event(
        "Food making",
        'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/7/20/0/HE_Salad-Olive-Oil_s4x3.jpg.rend.hgtvcom.616.462.suffix/1490370794762.jpeg',
        ['food', 'cooking'],
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce interdum magna purus, vel lobortis lacus accumsan ac. Proin tempor leo vitae ante luctus congue. Praesent blandit, orci id scelerisque dapibus, felis metus consequat neque, et aliquet massa arcu non erat. Phasellus risus ex, faucibus at feugiat a, interdum id odio. Cras ac augue quis turpis feugiat placerat quis eget metus. Vestibulum finibus urna quis elit porttitor mollis. Duis non posuere ante, sit amet laoreet felis. Sed sit amet vulputate felis. Cras condimentum, velit sed ullamcorper pulvinar, sem est sagittis lorem, non sodales urna risus non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec ut dictum lorem. Aliquam volutpat, tortor et placerat egestas, odio ex vehicula lorem, vitae luctus eros nisi nec neque. Nunc et blandit odio, posuere scelerisque nulla. Aliquam in lorem leo. Suspendisse fermentum dictum nibh, vitae elementum purus pharetra nec. Sed quis scelerisque nisl.'),
    Event(
        "Terrarium Making",
        "https://www.thespruce.com/thmb/YDuotPpcMtxRUmwzo-jvNHGGPdo=/4118x2749/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-make-terrariums-848007-13-58ad30a4238043e489d8deaba771e7c2.jpg",
        ['plants', 'terrarium', 'nature'],
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce interdum magna purus, vel lobortis lacus accumsan ac. Proin tempor leo vitae ante luctus congue. Praesent blandit, orci id scelerisque dapibus, felis metus consequat neque, et aliquet massa arcu non erat. Phasellus risus ex, faucibus at feugiat a, interdum id odio. Cras ac augue quis turpis feugiat placerat quis eget metus. Vestibulum finibus urna quis elit porttitor mollis. Duis non posuere ante, sit amet laoreet felis. Sed sit amet vulputate felis. Cras condimentum, velit sed ullamcorper pulvinar, sem est sagittis lorem, non sodales urna risus non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec ut dictum lorem. Aliquam volutpat, tortor et placerat egestas, odio ex vehicula lorem, vitae luctus eros nisi nec neque. Nunc et blandit odio, posuere scelerisque nulla. Aliquam in lorem leo. Suspendisse fermentum dictum nibh, vitae elementum purus pharetra nec. Sed quis scelerisque nisl.'),
    Event(
        "Food making",
        'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/7/20/0/HE_Salad-Olive-Oil_s4x3.jpg.rend.hgtvcom.616.462.suffix/1490370794762.jpeg',
        ['food', 'cooking'],
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce interdum magna purus, vel lobortis lacus accumsan ac. Proin tempor leo vitae ante luctus congue. Praesent blandit, orci id scelerisque dapibus, felis metus consequat neque, et aliquet massa arcu non erat. Phasellus risus ex, faucibus at feugiat a, interdum id odio. Cras ac augue quis turpis feugiat placerat quis eget metus. Vestibulum finibus urna quis elit porttitor mollis. Duis non posuere ante, sit amet laoreet felis. Sed sit amet vulputate felis. Cras condimentum, velit sed ullamcorper pulvinar, sem est sagittis lorem, non sodales urna risus non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec ut dictum lorem. Aliquam volutpat, tortor et placerat egestas, odio ex vehicula lorem, vitae luctus eros nisi nec neque. Nunc et blandit odio, posuere scelerisque nulla. Aliquam in lorem leo. Suspendisse fermentum dictum nibh, vitae elementum purus pharetra nec. Sed quis scelerisque nisl.')
  ];

  String search = '';

  @override
  Widget build(BuildContext context) {
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
