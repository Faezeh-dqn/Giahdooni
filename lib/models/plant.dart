import 'package:flutter/cupertino.dart';

class Plant {
  final String imagePath;
  final String name;
  final int plantPrice;
  final String about;
  final String id;

  Plant({
    @required this.imagePath,
    @required this.name,
    @required this.plantPrice,
    @required this.about,
    @required this.id,
  });

  Plant copyWith({
    String imagePath,
    String name,
    int plantPrice,
    int itemCount,
    String about,
    List id,
  }) {
    return Plant(
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      plantPrice: plantPrice ?? this.plantPrice,
      about: about ?? this.about,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'name': name,
      'plantPrice': plantPrice,
      'about': about,
      'id': id,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
        imagePath: map['imagePath'],
        name: map['name'],
        plantPrice: map['plantPrice'],
        about: map['about'],
        id: map['id']);
  }

  @override
  String toString() {
    return 'Plant(imagePath: $imagePath, name: $name, plantPrice: $plantPrice, about:$about , id:$id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Plant &&
        other.imagePath == imagePath &&
        other.name == name &&
        other.plantPrice == plantPrice &&
        other.about == about &&
        other.id == id;
  }

  @override
  int get hashCode {
    return imagePath.hashCode ^
        name.hashCode ^
        plantPrice.hashCode ^
        about.hashCode ^
        id.hashCode;
  }
}
