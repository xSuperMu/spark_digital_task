import 'package:spark_digital/imports.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUsecase _logoutUsecase;

  LogoutCubit(this._logoutUsecase) : super(LogoutInitial());

  void logout() async {
    emit(LogoutLoading());

    final result = await _logoutUsecase(params: unit);

    result.fold((failure) {
      emit(LogoutFailure(failure: failure));
    }, (unit) {
      emit(LogoutSuccess());
    });
  }
}
