import 'package:spark_digital/imports.dart';

class RegisterUseCase extends BaseUsecase<RegisterEntity, UserModel> {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserModel>> call({required RegisterEntity params}) {
    return _authRepository.register(params);
  }
}
