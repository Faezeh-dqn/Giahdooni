import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Order {
  Order({
    @required this.plantPrice,
    @required this.vaseprice,
    @required this.color,
    @required this.vaseShape,
    @required this.name,
    @required this.itemNum,
    @required this.totalprice,
    @required this.plantImage,
  });

  final int plantPrice;
  final int vaseprice;
  final String color;
  final String vaseShape;
  final String name;
  final int itemNum;
  final int totalprice;
  final String plantImage;

  Order copyWith({
    int plantPrice,
    int vaseprice,
    String color,
    String vaseShape,
    String name,
    int itemNum,
    int totalprice,
    String plantImage,
  }) {
    return Order(
      plantPrice: plantPrice ?? this.plantPrice,
      vaseprice: vaseprice ?? this.vaseprice,
      color: color ?? this.color,
      vaseShape: vaseShape ?? this.vaseShape,
      name: name ?? this.name,
      itemNum: itemNum ?? this.itemNum,
      totalprice: totalprice ?? this.totalprice,
      plantImage: plantImage ?? this.plantImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'plantPrice': plantPrice,
      'vaseprice': vaseprice,
      'color': color,
      'vaseShape': vaseShape,
      'name': name,
      'itemNum': itemNum,
      'totalprice': totalprice,
      'plantImage': plantImage,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      plantPrice: map['plantPrice'],
      vaseprice: map['vaseprice'],
      color: map['color'],
      vaseShape: map['vaseShape'],
      name: map['name'],
      itemNum: map['itemNum'],
      totalprice: map['totalprice'],
      plantImage: map['plantImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(plantPrice: $plantPrice, vaseprice: $vaseprice, color: $color, vaseShape: $vaseShape, name: $name, itemNum: $itemNum, totalprice: $totalprice, plantImage: $plantImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.plantPrice == plantPrice &&
        other.vaseprice == vaseprice &&
        other.color == color &&
        other.vaseShape == vaseShape &&
        other.name == name &&
        other.itemNum == itemNum &&
        other.totalprice == totalprice &&
        other.plantImage == plantImage;
  }

  @override
  int get hashCode {
    return plantPrice.hashCode ^
        vaseprice.hashCode ^
        color.hashCode ^
        vaseShape.hashCode ^
        name.hashCode ^
        itemNum.hashCode ^
        totalprice.hashCode ^
        plantImage.hashCode;
  }
}
