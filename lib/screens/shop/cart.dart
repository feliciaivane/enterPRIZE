import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:provider/provider.dart';
import 'shop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get appTheme => null;

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => Shop()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<Shop(), CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'flutter_cart',
        theme: appTheme,
        home: Shop(),
        initialRoute: '/catalog',
        routes: {
          // '/': (context) => MyLogin(),
          '/catalog': (context) => Shop(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
