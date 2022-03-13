import 'package:flutter/material.dart';
import 'style.dart';
import 'screens/login/login.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(new App());
}

class App extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        home: Login(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(headline6: AppBarTextStyle),
              color: Colors.blueGrey,
            ),
            textTheme: TextTheme(
              headline6: TitleTextStyle,
              bodyText2: BlackBodyTextStyle,
            )
        ));
  }
}