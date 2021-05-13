import 'package:flutter/cupertino.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/models/vase.dart';

class Order {
  Order({
    @required this.plant,
    @required this.vase,
  });
  final Plant plant;
  final Vase vase;

  int get price => vase.price + plant.price;
}
