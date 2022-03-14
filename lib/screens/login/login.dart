import 'package:flutter/material.dart';
import 'package:enterprize/style.dart';
import 'package:enterprize/screens/events/events.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loading_overlay/loading_overlay.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  bool isLoading = false ;
  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
      ),
      body: LoadingOverlay(
        isLoading: isLoading,
        child: SingleChildScrollView(
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
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 40.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password'),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async{
                    toggleLoading();
                    try {
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if (user != null) {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Events()));
                      }
                      setState(() {
                        isLoading = false;
                      });
                    } catch (e) {
                      toggleLoading();
                      print(e);
                    }

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
      ),
    );
  }
}