import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Order {
  String id;
  int plantPrice;
  int vaseprice;
  final String color;
  final String vaseShape;
  final String name;
  final String plantImage;
  int itemCount;
  int totalprice;
  Order({
    @required this.id,
    @required this.plantPrice,
    @required this.vaseprice,
    @required this.color,
    @required this.vaseShape,
    @required this.name,
    @required this.plantImage,
    @required this.itemCount,
    @required this.totalprice,
  });

  Order copyWith({
    String id,
    int plantPrice,
    int vaseprice,
    String color,
    String vaseShape,
    String name,
    String plantImage,
    int itemCount,
    int totalprice,
  }) {
    return Order(
      id: id ?? this.id,
      plantPrice: plantPrice ?? this.plantPrice,
      vaseprice: vaseprice ?? this.vaseprice,
      color: color ?? this.color,
      vaseShape: vaseShape ?? this.vaseShape,
      name: name ?? this.name,
      plantImage: plantImage ?? this.plantImage,
      itemCount: itemCount ?? this.itemCount,
      totalprice: totalprice ?? this.totalprice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'plantPrice': plantPrice,
      'vaseprice': vaseprice,
      'color': color,
      'vaseShape': vaseShape,
      'name': name,
      'plantImage': plantImage,
      'itemCount': itemCount,
      'totalprice': totalprice,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      plantPrice: map['plantPrice'],
      vaseprice: map['vaseprice'],
      color: map['color'],
      vaseShape: map['vaseShape'],
      name: map['name'],
      plantImage: map['plantImage'],
      itemCount: map['itemCount'],
      totalprice: map['totalprice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, plantPrice: $plantPrice, vaseprice: $vaseprice, color: $color, vaseShape: $vaseShape, name: $name, plantImage: $plantImage, itemCount: $itemCount, totalprice: $totalprice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.id == id &&
        other.plantPrice == plantPrice &&
        other.vaseprice == vaseprice &&
        other.color == color &&
        other.vaseShape == vaseShape &&
        other.name == name &&
        other.plantImage == plantImage &&
        other.itemCount == itemCount &&
        other.totalprice == totalprice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        plantPrice.hashCode ^
        vaseprice.hashCode ^
        color.hashCode ^
        vaseShape.hashCode ^
        name.hashCode ^
        plantImage.hashCode ^
        itemCount.hashCode ^
        totalprice.hashCode;
  }
}
