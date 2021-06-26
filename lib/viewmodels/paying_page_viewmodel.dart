import 'package:flutter/cupertino.dart';
import 'package:giahdooni/models/payingInfo.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class PayingPageViewModel extends BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirestoreService firestoreService;
  PayingPageViewModel({@required this.firestoreService});
  bool shouldShowErrorMessages = false;
  bool _isSelected = false;
  String _address = '';
  String _phoneNum = '';
  String _lastName = '';
  String _name = '';
  String _postCode = '';
  String _city = '';
  String _province = '';
  bool _validmoving = false;

  validateForm() {
    if (shouldShowErrorMessages) {
      formKey.currentState.validate();
    }
  }

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

  Future submitForm() async {
    shouldShowErrorMessages = true;
    formKey.currentState.validate();
    if (isFormFieldValid(_address) &&
        isFormFieldValid(_phoneNum) &&
        isFormFieldValid(_name) &&
        isFormFieldValid(_lastName) &&
        isFormFieldValid(_province) &&
        isFormFieldValid(_city) &&
        isFormFieldValid(_postCode)) {
      _validmoving = true;
      await addPayingInfoToDB2();
      print('nice job everything is okay');
    } else {
      print('fill all the fields');
    }
    notifyListeners();
  }

  setvalidmoving(bool validmoving) {
    _validmoving = validmoving;
    notifyListeners();
  }

  bool get validmoving => _validmoving;

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

  Future addPayingInfoToDB2() async {
    PayingInfo payingInfo = PayingInfo(
      address: address,
      postCode: postCode,
      phoneNumber: phoneNum,
      city: city,
      province: province,
      name: name,
      lastName: lastName,
    );
    await firestoreService.addPayingInfoToDB(payingInfo);
  }
}
