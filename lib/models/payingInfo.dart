import 'dart:convert';

import 'package:flutter/cupertino.dart';

class PayingInfo {
  String address;
  String postCode;
  String phoneNumber;
  String city;
  String province;
  String name;
  String lastName;
  PayingInfo({
    @required this.address,
    @required this.postCode,
    @required this.phoneNumber,
    @required this.city,
    @required this.province,
    @required this.name,
    @required this.lastName,
  });

  PayingInfo copyWith({
    String address,
    String postCode,
    String phoneNumber,
    String city,
    String province,
    String name,
    String lastName,
  }) {
    return PayingInfo(
      address: address ?? this.address,
      postCode: postCode ?? this.postCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      province: province ?? this.province,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'postCode': postCode,
      'phoneNumber': phoneNumber,
      'city': city,
      'province': province,
      'name': name,
      'lastName': lastName,
    };
  }

  factory PayingInfo.fromMap(Map<String, dynamic> map) {
    return PayingInfo(
      address: map['address'],
      postCode: map['postCode'],
      phoneNumber: map['phoneNumber'],
      city: map['city'],
      province: map['province'],
      name: map['name'],
      lastName: map['lastName'],
    );
  }

  @override
  String toString() {
    return 'PayingInfo(address: $address, postCode: $postCode, phoneNumber: $phoneNumber, city: $city, province: $province, name: $name, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PayingInfo &&
        other.address == address &&
        other.postCode == postCode &&
        other.phoneNumber == phoneNumber &&
        other.city == city &&
        other.province == province &&
        other.name == name &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        postCode.hashCode ^
        phoneNumber.hashCode ^
        city.hashCode ^
        province.hashCode ^
        name.hashCode ^
        lastName.hashCode;
  }
}
