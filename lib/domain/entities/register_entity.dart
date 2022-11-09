import 'package:spark_digital/imports.dart';

class RegisterEntity {
  final String name;
  final int yearOfBirth;
  final int gender;
  final String email;
  final String password;

  const RegisterEntity({
    this.name = '',
    this.yearOfBirth = 0,
    this.gender = 0,
    this.email = '',
    this.password = '',
  });

  RegisterModel toModel() => RegisterModel(
        email: email,
        password: password,
        name: name,
        yearOfBirth: yearOfBirth,
        gender: gender,
      );
}
