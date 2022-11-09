import 'package:spark_digital/imports.dart';

class ForgotPasswordUseCase extends BaseUsecase<String, Unit> {
  final AuthRepository _authRepository;

  ForgotPasswordUseCase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call({required String params}) {
    return _authRepository.forgotPassword(params);
  }
}
