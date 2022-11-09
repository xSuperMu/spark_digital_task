import 'package:spark_digital/imports.dart';

class PasswordCubit extends Cubit<bool> {
  PasswordCubit() : super(true);

  void togglePassword() {
    emit(!state);
  }
}
