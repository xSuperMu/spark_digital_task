import 'package:spark_digital/imports.dart';

class DateCubit extends Cubit<DateTime> {
  DateCubit() : super(DateTime.now());

  void setDate(DateTime date) {
    emit(date);
  }
}
