import 'package:spark_digital/imports.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register(
    RegisterEntity registerEntity,
  ) async {
    emit(RegisterLoading());

    final result = await registerUseCase(params: registerEntity);

    result.fold((failure) {
      emit(RegisterFailure(failure: failure));
    }, (unit) {
      emit(RegisterSuccess());
    });
  }
}
