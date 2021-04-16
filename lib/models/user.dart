import 'dart:convert';

class User {
  final String firstName;
  final String lastName;
  final String email;
  User({
    this.firstName,
    this.lastName,
    this.email,
  });

  User copyWith({
    String firstName,
    String lastName,
    String email,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(firstName: $firstName, lastName: $lastName, email: $email)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.email == email;
  }

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ email.hashCode;
}
