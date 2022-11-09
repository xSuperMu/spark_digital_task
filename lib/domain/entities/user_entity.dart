import 'package:spark_digital/imports.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final int yearOfBirth;
  final int gender;

  const UserEntity({
    this.uid = '',
    this.name = '',
    this.email = '',
    this.gender = 0,
    this.yearOfBirth = 0,
  });

  @override
  List<Object> get props => [uid, name, email, gender, yearOfBirth];

  // create to map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'yearOfBirth': yearOfBirth,
      'gender': gender,
    };
  }
}
