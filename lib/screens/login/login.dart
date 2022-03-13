import 'package:flutter/material.dart';
import 'package:enterprize/style.dart';
import 'package:enterprize/screens/events/events.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Container(
                    width: 300,
                    height: 240,
                    child: Image.asset('assets/images/logo.jpg')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 40.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Events()));
                },
                child: Text(
                  'Login',
                  style: LoginButtonTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(73.0, 20.0, 0.0, 0.0),
              child: Row(
                children: <Widget> [
                  Text(
                    "Don't have an account? ",
                    style: BlackBodyTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Register()));
                    },
                    child: Text(
                      "Sign up",
                      style: BlueBodyTextStyle,
                    ),
                  )],
              ),
            ),
          ],
        ),
      ),
    );
  }
}