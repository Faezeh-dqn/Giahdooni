import 'package:flutter/material.dart';
import 'package:giahdooni/models/orders.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class OrdersPageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  List<Order> orders = [];

  OrdersPageViewModel({@required this.firestoreService});

  getOrderdPlantFromDB() async {
    setBusy(true);
    orders = await firestoreService.getOrderdPlantFromDB();
    setBusy(false);
    notifyListeners();
  }

  Future addOrderedPlantToDB(Order order) async {
    await firestoreService.addOrderedPlantToDB(order);
  }

  Future deleteFromCart(Order order) async {
    await firestoreService.deleteOrderedPlantFromDB(order);

    orders.remove(order);
    notifyListeners();
  }

  Future updateOrder(Order updatedOrder) async {
    await firestoreService.updateOrder(updatedOrder);
  }

  int _counting = 0;
  int _totalPrice;

  setCounting(int counting) {
    _counting = counting;
    notifyListeners();
  }

  int get counting => _counting;

  setTotalPrice(int totalPrice) {
    _totalPrice = totalPrice;
    notifyListeners();
  }

  int get totalPrice => _totalPrice;
}
