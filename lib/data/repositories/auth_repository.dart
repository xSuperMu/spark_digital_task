import 'package:spark_digital/imports.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> fetchUserData() async {
    try {
      final user = await remoteDataSource.fetchUserData();
      return Right(user);
    } on UserNotFoundException catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.message));
    } catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword(String email) async {
    try {
      await remoteDataSource.forgotPassword(email);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> login(LoginEntity loginEntity) async {
    try {
      await remoteDataSource.login(loginEntity.toModel());

      return const Right(unit);
    } on UserNotFoundException catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.message));
    } on WrongPasswordException catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.message));
    } catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      RegisterEntity registerEntity) async {
    try {
      final userModel =
          await remoteDataSource.register(registerEntity.toModel());
      return Right(userModel);
    } on WeakPasswordException catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.message));
    } on EmailAlreadyRegisteredException catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.message));
    } catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.toString()));
    }
  }

  @override
  Either<Failure, Stream<User?>> authStateChanges() {
    try {
      return Right(remoteDataSource.authStateChanges());
    } catch (e) {
      return Left(Failure(FailureType.firebaseAuth, e.toString()));
    }
  }
}
