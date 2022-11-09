import 'package:spark_digital/imports.dart';

extension StringExtension on String? {
  bool get isNullOrEmpty {
    return this?.isEmpty ?? true;
  }

  bool get isValidEmail => RegExp(
        AppConstants.emailRegex,
      ).hasMatch(this ?? '');
}
