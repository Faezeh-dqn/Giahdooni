import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class successfulPaymentViewModel extends BaseViewModel {
  bool _changeWidget = true;

  setPhoneNum(bool changeWidget) {
    _changeWidget = changeWidget;
    notifyListeners();
  }

  bool get changeWidget => _changeWidget;
}
