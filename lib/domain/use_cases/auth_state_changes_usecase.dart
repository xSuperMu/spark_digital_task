import 'package:spark_digital/imports.dart';

class AuthStateChangesUseCase {
  final AuthRepository _authRepository;

  AuthStateChangesUseCase(this._authRepository);

  Either<Failure, Stream<User?>> call() {
    return _authRepository.authStateChanges();
  }
}
