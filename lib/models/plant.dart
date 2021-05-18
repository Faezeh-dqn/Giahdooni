import 'dart:convert';

import 'package:flutter/foundation.dart';

class Plant {
  final String imagePath;
  final String name;
  final int price;
  final int itemCount;
  String about;
  Plant({
    this.imagePath,
    this.name,
    this.price,
    this.itemCount,
    this.about,
  });

  Plant copyWith({
    String imagePath,
    String name,
    int price,
    int itemCount,
  }) {
    return Plant(
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      price: price ?? this.price,
      itemCount: itemCount ?? this.itemCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'name': name,
      'price': price,
      'itemCount': itemCount,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
      imagePath: map['imagePath'],
      name: map['name'],
      price: map['price'],
      itemCount: map['itemCount'],
    );
  }

  @override
  String toString() {
    return 'Plant(imagePath: $imagePath, name: $name, price: $price, itemCount: $itemCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Plant &&
        other.imagePath == imagePath &&
        other.name == name &&
        other.price == price &&
        other.itemCount == itemCount;
  }

  @override
  int get hashCode {
    return imagePath.hashCode ^
        name.hashCode ^
        price.hashCode ^
        itemCount.hashCode;
  }
}
