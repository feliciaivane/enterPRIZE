import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = [
    'White Model Tee',
  ];
  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);
  Item getByPosition(int position) {

    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Image image;
  final int price = 10  ;

  Item(this.id, this.name)
      : image = Image.asset(
    'assets/images/shirt.jpeg',
    width: 100,
    height: 100,
    fit: BoxFit.cover,
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}