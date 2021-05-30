class Plant {
  final String imagePath;
  final String name;
  final int plantPrice;
  final int itemCount;
  String about;
  String id;
  Plant({
    this.imagePath,
    this.name,
    this.plantPrice,
    this.itemCount,
    this.about,
    this.id,
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
      itemCount: itemCount ?? this.itemCount,
      about: about ?? this.about,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'name': name,
      'plantPrice': plantPrice,
      'itemCount': itemCount,
      'about': about,
      'id': id,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
        imagePath: map['imagePath'],
        name: map['name'],
        plantPrice: map['plantPrice'],
        itemCount: map['itemCount'],
        about: map['about'],
        id: map['id']);
  }

  @override
  String toString() {
    return 'Plant(imagePath: $imagePath, name: $name, plantPrice: $plantPrice, itemCount: $itemCount , about:$about , id:$id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Plant &&
        other.imagePath == imagePath &&
        other.name == name &&
        other.plantPrice == plantPrice &&
        other.itemCount == itemCount &&
        other.about == about &&
        other.id == id;
  }

  @override
  int get hashCode {
    return imagePath.hashCode ^
        name.hashCode ^
        plantPrice.hashCode ^
        itemCount.hashCode ^
        about.hashCode ^
        id.hashCode;
  }
}
