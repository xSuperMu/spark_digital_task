import 'package:spark_digital/imports.dart';

class LoginUseCase extends BaseUsecase<LoginEntity, Unit> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call({required LoginEntity params}) {
    return _authRepository.login(params);
  }
}
