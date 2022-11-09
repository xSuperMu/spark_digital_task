import 'package:spark_digital/imports.dart';

class LoginEntity {
  final String email;
  final String password;

  LoginEntity({
    this.email = '',
    this.password = '',
  });

  LoginModel toModel() => LoginModel(
        email: email,
        password: password,
      );
}
