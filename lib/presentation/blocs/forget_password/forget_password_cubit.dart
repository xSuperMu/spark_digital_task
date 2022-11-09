import 'package:spark_digital/imports.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgetPasswordCubit(this.forgotPasswordUseCase)
      : super(ForgetPasswordInitial());

  void sendResetPasswordEmail(String email) async {
    emit(ForgetPasswordLoading());

    final result = await forgotPasswordUseCase(params: email);

    result.fold((failure) {
      emit(ForgetPasswordFailure(failure: failure));
    }, (unit) {
      emit(ForgetPasswordSuccess());
    });
  }
}
