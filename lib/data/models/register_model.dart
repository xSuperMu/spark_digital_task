import 'package:spark_digital/imports.dart';

class RegisterModel extends RegisterEntity {
  final String uid;

  const RegisterModel({
    this.uid = '',
    super.password,
    super.name,
    super.email,
    super.yearOfBirth,
    super.gender,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        uid: json['uid'],
        password: json['password'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        yearOfBirth: json['yearOfBirth'] ?? 0,
        gender: json['gender'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'password': password,
        'name': name,
        'email': email,
        'yearOfBirth': yearOfBirth,
        'gender': gender,
      };
}
