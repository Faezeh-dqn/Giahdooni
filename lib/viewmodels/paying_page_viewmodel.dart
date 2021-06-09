import 'dart:ui';
import 'package:giahdooni/models/payingInfo.dart';
import 'package:stacked/stacked.dart';

class PayingPageViewModel extends BaseViewModel {
  bool _isSelected = false;
  String _address = '';
  String _phoneNum = '';
  String _lastName = '';
  String _name = '';
  String _postCode = '';
  String _city = '';
  String _province = '';
  Color _color = Color(0xff8ED362);
  bool _nameController = false;
  bool _lastNameController = false;
  bool provinceController = false;
  bool cityController = false;
  bool postCodeController = false;
  bool phoneNumController = false;
  bool addressController = false;

  checkNullFields() {
    if (name == '') {
      _nameController = true;
    } else {
      print('name is not null');
    }
    if (lastName == '') {
      _lastNameController = true;
    }
    if (city == '') {
      cityController = true;
    }
    if (province == '') {
      provinceController = true;
    }
    if (address == '') {
      addressController = true;
    }
    if (postCode == '') {
      postCodeController = true;
    }
    if (phoneNum == '') {
      phoneNumController = true;
    }
    notifyListeners();
  }

  setColor(Color color) {
    _color = color;
    notifyListeners();
  }

  Color get color => _color;

  setNameController(bool nameController) {
    _nameController = nameController;
    notifyListeners();
  }

  bool get nameController => _nameController;

  setLastNameController(bool lastNameController) {
    _lastNameController = lastNameController;
    notifyListeners();
  }

  bool get lastNameController => _lastNameController;

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
        lastName: lastName);
  }
}
