import 'package:spark_digital/imports.dart';

class FetchUserUseCase extends BaseUsecase<Unit, UserEntity> {
  final AuthRepository _authRepository;

  FetchUserUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserEntity>> call({required Unit params}) {
    return _authRepository.fetchUserData();
  }
}
