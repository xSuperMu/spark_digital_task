import 'package:spark_digital/imports.dart';

class AppConstants {
  AppConstants._();

  static final genders = [
    const ListItemEntity(id: 0, name: Strings.male),
    const ListItemEntity(id: 1, name: Strings.female),
    const ListItemEntity(id: 2, name: Strings.genderOther),
    const ListItemEntity(id: 3, name: Strings.genderPreferNotSay),
  ];

  static final years = [
    for (int i = 1960; i < 2022; i++) ListItemEntity(id: i, name: i.toString()),
  ];

  //------------------------------------------------------
  // Regex
  static const emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

//------------------------------------------------------

  static const maxPasswordLength = 8;

//------------------------------------------------------

  static const firebaseAuthUserNotFoundCode = 'user-not-found';
  static const firebaseAuthWrongPassword = 'wrong-password';
  static const firebaseAuthWeakPassword = 'weak-password';
  static const firebaseAuthEmailAlreadyUsed = 'email-already-in-use';
}
