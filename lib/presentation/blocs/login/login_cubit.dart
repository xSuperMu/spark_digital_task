import 'package:spark_digital/imports.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  void login({required String email, required String password}) async {
    emit(LoginLoading());

    final result = await loginUseCase(
        params: LoginEntity(email: email, password: password));

    result.fold((failure) {
      emit(LoginFailure(failure: failure));
    }, (unit) {
      emit(LoginSuccess());
    });
  }
}
