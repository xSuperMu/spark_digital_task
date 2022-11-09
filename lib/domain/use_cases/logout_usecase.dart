import 'package:spark_digital/imports.dart';

class LogoutUsecase extends BaseUsecase<Unit, Unit> {
  final AuthRepository _authRepository;

  LogoutUsecase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call({required Unit params}) {
    return _authRepository.logout();
  }
}
