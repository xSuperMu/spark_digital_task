import 'package:spark_digital/imports.dart';

class CheckBoxCubit extends Cubit<bool> {
  CheckBoxCubit() : super(true);

  void toggleCheckBox() {
    emit(!state);
  }
}
