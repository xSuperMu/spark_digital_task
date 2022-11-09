import 'package:spark_digital/imports.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);

  void showLoading() {
    emit(true);
  }

  void hideLoading() {
    emit(false);
  }
}
