import 'package:spark_digital/imports.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.uid,
    super.name,
    super.email,
    super.yearOfBirth,
    super.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        yearOfBirth: json['yearOfBirth'] ?? 0,
        gender: json['gender'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'yearOfBirth': yearOfBirth,
        'gender': gender,
      };
}
