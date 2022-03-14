

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
        "SGreen: Terrarium Making",
        "https://www.thespruce.com/thmb/YDuotPpcMtxRUmwzo-jvNHGGPdo=/4118x2749/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-make-terrariums-848007-13-58ad30a4238043e489d8deaba771e7c2.jpg",
        ['plants', 'terrarium', 'nature'],
    'Do you love watching mini ecosystems? Do you want to have a garden without actually gardening? If yes, this event is for you! Come and join us! All proceeds will be donated to charity!'),
    Event(
        "HeartFood: Food making",
        'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/7/20/0/HE_Salad-Olive-Oil_s4x3.jpg.rend.hgtvcom.616.462.suffix/1490370794762.jpeg',
        ['food', 'cooking'],
    'Looking for volunteers to help us prepare a special meal for the elderly living in the vicinity, come join us!'),
    Event(
        "ilovenature: Plant with Us!",
        "https://lot.dhl.com/wp-content/uploads/2019/11/Article-Key-Image-453431968.jpg",
        ['plants', 'terrarium', 'nature'],
        'SGreen is a social enterprise that aspires to keep our garden city as green as possible. Since its formation in 2019, together with volunteers, we have planted over 10000 trees all around Singapore! Come join us in our next tree-planting session!'),
    Event(
        "The Place: Food distribution",
        'https://www.safefood.net/getmedia/59f48389-fc57-4b34-9444-c8d109f889a5/cooking-vegetables.jpg?w=2000&h=1333&ext=.jpg&width=1360&resizemode=force',
        ['food', 'cooking'],
        'We need 30 kind volunteers to help us with food distribution in Sengkang HDB Blk 48.')
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
