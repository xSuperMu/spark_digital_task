import 'package:spark_digital/imports.dart';

part 'auth_state_state.dart';

class AuthStateCubit extends Cubit<AuthStateState> {
  final AuthStateChangesUseCase authStateChangesUseCase;

  AuthStateCubit(this.authStateChangesUseCase) : super(AuthStateInitial());

  void authStateChanges() {
    emit(AuthStateLoading());

    final result = authStateChangesUseCase();

    result.fold((failure) {
      emit(AuthStateFailure(failure: failure));
    }, (authStateStream) {
      authStateStream.listen((user) {
        if (user != null) {
          emit(AuthStateAuthenticated());
        } else {
          emit(AuthStateUnAuthenticated());
        }
      });
    });
  }
}
