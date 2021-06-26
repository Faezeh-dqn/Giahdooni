import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PaymentGViewModel extends BaseViewModel {
  String _cvv2;
  String _cartNum;
  String _password;
  String _year;
  String _month;
  Color _color = Colors.grey.shade500;

  setCvv2(String cvv2) {
    _cvv2 = cvv2;
    notifyListeners();
  }

  String get cvv2 => _cvv2;

  setColor(Color color) {
    _color = color;
    notifyListeners();
  }

  Color get color => _color;

  setCartNum(String cartNum) {
    _cartNum = cartNum;
    notifyListeners();
  }

  String get cartNum => _cartNum;

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String get password => _password;

  setYear(String year) {
    _year = year;
    notifyListeners();
  }

  String get year => _year;

  setMonth(String month) {
    _month = month;
    notifyListeners();
  }

  String get month => _month;
}
