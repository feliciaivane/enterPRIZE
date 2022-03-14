import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  late String title = '';
  late var pic_url = [];
  late var tags = [];
  late String description = '';
  late String dateOfEvent = '';
  late String time = '';
  late String location = '';

  Event(this.title, this.pic_url, this.tags, this.description, this.dateOfEvent,
      this.time, this.location);
}

final _firestore = FirebaseFirestore.instance;
void addEvent(Event e) {
  _firestore.collection('Event').doc(e.title).set({
    'title': e.title,
    'pic_url': e.pic_url,
    'tags': e.tags,
    'description': e.description,
    'dateOfEvent': e.dateOfEvent,
    'time': e.time,
    'location': e.location
  });
  print('added');
}

dynamic getEvents(){
  return _firestore.collection('Event').snapshots();
}

var events = [
  Event(
      "SGreen: Terrarium Making",
      [
        "https://www.thespruce.com/thmb/YDuotPpcMtxRUmwzo-jvNHGGPdo=/4118x2749/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-make-terrariums-848007-13-58ad30a4238043e489d8deaba771e7c2.jpg",
        'https://media.architecturaldigest.com/photos/5a78d2d7bc02cd10999952c5/master/w_1600%2Cc_limit/Terrarium%25201.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMA5IAvPGQEwDOxP9F3uUqiv87olJyfwB-Db5zL6P788MjosVfoi6vPA9iBixBZ3Roumw&usqp=CAU'
      ],
      ['plants', 'terrarium', 'nature'],
      'Do you love watching mini ecosystems? Do you want to have a garden without actually gardening? If yes, this event is for you! Come and join us! All proceeds will be donated to charity!',
      "04/05/2022",
      "1800",
      "Botanic Gardens"),
  Event(
      "HeartFood: Food making",
      [
        'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/7/20/0/HE_Salad-Olive-Oil_s4x3.jpg.rend.hgtvcom.616.462.suffix/1490370794762.jpeg'
      ],
      ['food', 'cooking'],
      'Looking for volunteers to help us prepare a special meal for the elderly living in the vicinity, come join us!',
      "02/04/2022",
      "1900",
      "Hells Kitchen"),
  Event(
      "ilovenature: Plant with Us!",
      [
        "https://lot.dhl.com/wp-content/uploads/2019/11/Article-Key-Image-453431968.jpg"
      ],
      ['plants', 'terrarium', 'nature'],
      'SGreen is a social enterprise that aspires to keep our garden city as green as possible. Since its formation in 2019, together with volunteers, we have planted over 10000 trees all around Singapore! Come join us in our next tree-planting session!',
      "07/06/2022",
      "1700",
      "East Coast Park Carpark D"),
  Event(
      "The Place: Food distribution",
      [
        'https://www.safefood.net/getmedia/59f48389-fc57-4b34-9444-c8d109f889a5/cooking-vegetables.jpg?w=2000&h=1333&ext=.jpg&width=1360&resizemode=force'
      ],
      ['food', 'cooking'],
      'We need 30 kind volunteers to help us with food distribution in Sengkang HDB Blk 48.',
      "07/09/2022",
      "1300",
      "13 Chai Chee Road")
];
