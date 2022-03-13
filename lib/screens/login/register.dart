import 'package:flutter/material.dart';
import 'package:enterprize/style.dart';
// import 'login.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register Page"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 52.0, 15.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email'),
                  onChanged: (value)
                  {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 50.0),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password'),
                    onChanged: (value) {
                      password = value;
                    }
                ),
              ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  /*try {
                    final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if (newUser != null) {
                      Navigator.pop(context); }
                  } catch (e) {
                    print(e);
                  }*/
                },
                child: Text(
                  "Register",
                  style: LoginButtonTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(67.0, 20.0, 0.0, 0.0),
              child: Row(
                children: <Widget> [
                  Text(
                    "Already have an account? ",
                    style: BlackBodyTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(73.0, 20.0, 59.0, 0.0),
                child: Row(
                  children: <Widget> [
                    Text(
                      "Already have an account? ",
                      style: BlackBodyTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign in",
                        style: BlueBodyTextStyle,
                      ),
                    )],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}