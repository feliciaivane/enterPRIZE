import 'package:flutter/material.dart';
import 'package:enterprize/screens/events/events.dart';
import 'package:enterprize/screens/shop/shop.dart';
import 'package:enterprize/screens/profile/profile.dart';
import 'package:enterprize/screens/login/login.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Kermit Enterprise'),
            accountEmail: Text('Enterprise'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Events'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Events()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Shop()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Profile()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
            },
          ),
        ],
      ),
    );
  }
}