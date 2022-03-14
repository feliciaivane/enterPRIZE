import 'package:flutter/material.dart';
import 'package:enterprize/style.dart';
// import 'login.dart';
import 'package:enterprize/screens/events/events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String username = "";
  String phoneNumber = "";
  bool isLoading = false ;
  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register Page"),
        backgroundColor: Colors.blueGrey,
      ),
      body: LoadingOverlay(
        isLoading: isLoading,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 52.0, 15.0, 15.0),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'First Name'),
                    onChanged: (value) {
                      firstName = value;
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Last Name'),
                    onChanged: (value) {
                      lastName = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Username'),
                    onChanged: (value) {
                      username = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                    onChanged: (value) {
                      password = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 50.0),
                child: TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Phone Number'),
                    onChanged: (value) {
                      phoneNumber = value;
                    }),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () async {
                      toggleLoading();
                      try {
                        final newUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if (newUser != null) {
                          _firestore.collection('User').doc(newUser.user?.uid).collection('Profile').doc(newUser.user?.uid).set(
                              {
                                'firstName': firstName,
                                'lastName': lastName,
                                'phoneNumber': phoneNumber,
                                'username': username,
                                'email': email
                              });
                          Navigator.push(context, MaterialPageRoute(builder: (
                              _) => Events()));
                        }
                        toggleLoading();
                      } catch (e) {
                        toggleLoading();
                        print(e);
                      }
                    },
                    /*try {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if (newUser != null) {
                        Navigator.pop(context); }
                    } catch (e) {
                      print(e);
                    } */
                  child: Text(
                    "Register",
                    style: LoginButtonTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(68.0, 20.0, 0.0, 0.0),
                child: Row(
                  children: <Widget>[
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
