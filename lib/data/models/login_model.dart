import 'package:spark_digital/imports.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    super.email,
    super.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json['email'] ?? '',
        password: json['password'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
