import 'package:spark_digital/imports.dart';

class GenderCubit extends Cubit<ListItemEntity?> {
  GenderCubit() : super(null);

  void setGender(ListItemEntity gender) {
    emit(gender);
  }
}
