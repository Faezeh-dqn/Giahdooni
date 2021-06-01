import 'package:flutter/cupertino.dart';

class Order {
  final int plantPrice;
  final int vaseprice;
  final String color;
  final String vaseShape;
  final String name;
  final String plantImage;
  int itemCount;
  int totalprice;

  Order({
    @required this.plantPrice,
    @required this.vaseprice,
    @required this.color,
    @required this.vaseShape,
    @required this.name,
    @required this.itemCount,
    @required this.totalprice,
    @required this.plantImage,
  });

  Order copyWith({
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

  @override
  String toString() {
    return 'Order(plantPrice: $plantPrice, vaseprice: $vaseprice, color: $color, vaseShape: $vaseShape, name: $name, plantImage: $plantImage, itemCount: $itemCount, totalprice: $totalprice)';
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
        other.plantImage == plantImage &&
        other.itemCount == itemCount &&
        other.totalprice == totalprice;
  }

  @override
  int get hashCode {
    return plantPrice.hashCode ^
        vaseprice.hashCode ^
        color.hashCode ^
        vaseShape.hashCode ^
        name.hashCode ^
        plantImage.hashCode ^
        itemCount.hashCode ^
        totalprice.hashCode;
  }
}
