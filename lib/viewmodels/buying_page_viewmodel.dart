import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giahdooni/models/vase.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:giahdooni/models/orders.dart';

class BuyingPageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  BuyingPageViewModel({@required this.firestoreService});
  Future addOrderedPlantToDB(Order order) async {
    await firestoreService.addOrderedPlantToDB(order);
  }

  List<String> vaseColor = [
    'White',
    'Black',
    'Brown',
    'Yellow',
    'Orange',
    'Bule',
    'Green',
    'Red',
    'Grey'
  ];
  Vase vase1 = Vase(price: 30000, shape: 'Cylindrical');
  Vase vase2 = Vase(price: 25000, shape: 'Spheral');
  Vase vase3 = Vase(price: 40000, shape: 'Cubical');
  Vase vase4 = Vase(price: 35000, shape: 'Conical');

  String _selectedColor = 'Choose color:';
  String _selectedShape = 'Choose shape:';
  int _itemCount = 0;
  int _vasePriceForShow;
  int _totalPrice;

  setselectedColor(String selectedColor) {
    _selectedColor = selectedColor;
    notifyListeners();
  }

  String get selectedColor => _selectedColor;

  setTotalPrice(int totalPrice) {
    _totalPrice = totalPrice;
    notifyListeners();
  }

  int get totalPrice => _totalPrice;

  setVasePrice(int vasePriceForShow) {
    _vasePriceForShow = vasePriceForShow;
    notifyListeners();
  }

  int get vasePriceForShow => _vasePriceForShow;

  setItemCount(int itemCount) {
    _itemCount = itemCount;
    notifyListeners();
  }

  int get itemCount => _itemCount;

  setselectedShape(String selectedShape) {
    _selectedShape = selectedShape;
    notifyListeners();
  }

  String get selectedShape => _selectedShape;
}
