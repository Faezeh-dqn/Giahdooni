import 'package:flutter/material.dart';
import 'package:giahdooni/models/orders.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:giahdooni/models/plant.dart';

class OrdersPageViewModel extends BaseViewModel {
  @override
  FirestoreService firestoreService;
  List<Order> orders = [];
  OrdersPageViewModel({@required this.firestoreService});

  getOrderdPlantFromDB() async {
    setBusy(true);
    orders = await firestoreService.getOrderdPlantFromDB();
    setBusy(false);
    notifyListeners();
  }

  deleteFromCart(Order order) async {
    await firestoreService.deleteOrderedPlantFromDB(order);
  }
}
