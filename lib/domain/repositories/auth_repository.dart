import 'package:spark_digital/imports.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login(LoginEntity loginEntity);

  Future<Either<Failure, UserModel>> register(RegisterEntity registerEntity);

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, Unit>> forgotPassword(String email);

  Future<Either<Failure, UserEntity>> fetchUserData();

  Either<Failure, Stream<User?>> authStateChanges();
}
