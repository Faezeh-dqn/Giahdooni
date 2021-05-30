import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Diseases {
  String disease;
  String cause;
  String symptoms;
  String management;
  String imagepath;
  Diseases({
    @required this.disease,
    @required this.cause,
    @required this.symptoms,
    @required this.management,
    @required this.imagepath,
  });

  Diseases copyWith({
    String disease,
    String cause,
    String symptoms,
    String management,
    String imagePath,
  }) {
    return Diseases(
      disease: disease ?? this.disease,
      cause: cause ?? this.cause,
      symptoms: symptoms ?? this.symptoms,
      management: management ?? this.management,
      imagepath: imagepath ?? this.imagepath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'disease': disease,
      'cause': cause,
      'symptoms': symptoms,
      'management': management,
      'imagepath': imagepath
    };
  }

  factory Diseases.fromMap(Map<String, dynamic> map) {
    return Diseases(
      disease: map['disease'],
      cause: map['cause'],
      symptoms: map['symptoms'],
      management: map['management'],
      imagepath: map['imagePath'],
    );
  }

  @override
  String toString() {
    return 'Diseases(disease: $disease, cause: $cause, symptoms: $symptoms, management: $management , imagepath: $imagepath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Diseases &&
        other.disease == disease &&
        other.cause == cause &&
        other.symptoms == symptoms &&
        other.imagepath == imagepath &&
        other.management == management;
  }

  @override
  int get hashCode {
    return disease.hashCode ^
        cause.hashCode ^
        symptoms.hashCode ^
        imagepath.hashCode ^
        management.hashCode;
  }
}
