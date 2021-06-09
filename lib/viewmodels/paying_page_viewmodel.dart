import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:giahdooni/models/payingInfo.dart';
import 'package:stacked/stacked.dart';

class PayingPageViewModel extends BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isSelected = false;
  String _address = '';
  String _phoneNum = '';
  String _lastName = '';
  String _name = '';
  String _postCode = '';
  String _city = '';
  String _province = '';

  String validateFromField(String value, [String nameOfField]) {
    if (value.isEmpty) {
      return '$nameOfField can not be empty';
    } else {
      return null;
    }
  }

  bool isFormFieldValid(String field) {
    if (validateFromField(field) == null) {
      return true;
    } else {
      return false;
    }
  }

  submitForm() {
    formKey.currentState.validate();
    if (isFormFieldValid(_address) && isFormFieldValid(_phoneNum)) {}
    notifyListeners();
  }

  setCity(String city) {
    _city = city;
    notifyListeners();
  }

  String get city => _city;

  setProvince(String province) {
    _province = province;
    notifyListeners();
  }

  String get province => _province;

  setIsSelected(bool isSelected) {
    _isSelected = isSelected;
    notifyListeners();
  }

  bool get isSelected => _isSelected;

  setPostCode(String postCode) {
    _postCode = postCode;
    notifyListeners();
  }

  String get postCode => _postCode;

  setName(String name) {
    _name = name;
    notifyListeners();
  }

  String get name => _name;

  setlastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  String get lastName => _lastName;

  setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  String get address => _address;

  setPhoneNum(String phoneNum) {
    _phoneNum = phoneNum;
    notifyListeners();
  }

  String get phoneNum => _phoneNum;

  checkTextFields() {
    PayingInfo payingInfo = PayingInfo(
      address: address,
      postCode: postCode,
      phoneNumber: phoneNum,
      city: city,
      province: province,
      name: name,
      lastName: lastName,
    );
  }
}
