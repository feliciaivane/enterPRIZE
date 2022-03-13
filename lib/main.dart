import 'package:flutter/material.dart';
import 'style.dart';
import 'screens/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(new App());
}

class App extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(
        home: Login(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(headline6: AppBarTextStyle),
            ),
            textTheme: TextTheme(
              headline6: TitleTextStyle,
              bodyText2: BlackBodyTextStyle,
            )
        ));
  }
}