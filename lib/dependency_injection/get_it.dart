import 'package:spark_digital/imports.dart';

final getItInstance = GetIt.instance;

void setupDependencyInjection() {
  // External
  _setUpExternalDependencies();

  // Core
  _setUpCoreDependencies();

  // Data Sources
  _setUpDataSourcesDependencies();

  // Repositories
  _setUpRepositoriesDependencies();

  // UseCases
  _setUpUsecasesDependencies();

  // Blocs
  _setUpBlocsDependencies();
}

void _setUpExternalDependencies() {
  getItInstance.registerLazySingleton(() => FirebaseFirestore.instance);
  getItInstance.registerLazySingleton(() => FirebaseAuth.instance);
}

void _setUpCoreDependencies() {}

void _setUpDataSourcesDependencies() {
  getItInstance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(getItInstance(), getItInstance()),
  );
}

void _setUpRepositoriesDependencies() {
  getItInstance.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getItInstance()),
  );
}

void _setUpUsecasesDependencies() {
  getItInstance.registerLazySingleton(() => LoginUseCase(getItInstance()));
  getItInstance.registerLazySingleton(() => RegisterUseCase(getItInstance()));
  getItInstance
      .registerLazySingleton(() => ForgotPasswordUseCase(getItInstance()));
  getItInstance.registerLazySingleton(() => LogoutUsecase(getItInstance()));
  getItInstance.registerLazySingleton(() => FetchUserUseCase(getItInstance()));
  getItInstance
      .registerLazySingleton(() => AuthStateChangesUseCase(getItInstance()));
}

void _setUpBlocsDependencies() {
  getItInstance.registerFactory(() => PasswordCubit());
  getItInstance.registerFactory(() => DateCubit());
  getItInstance.registerFactory(() => GenderCubit());
  getItInstance.registerFactory(() => CheckBoxCubit());
  getItInstance.registerFactory(() => LoadingCubit());
  getItInstance.registerFactory(() => LoginCubit(getItInstance()));
  getItInstance.registerFactory(() => RegisterCubit(getItInstance()));
  getItInstance.registerFactory(() => ForgetPasswordCubit(getItInstance()));
  getItInstance.registerFactory(() => AuthStateCubit(getItInstance()));
  getItInstance.registerFactory(() => LogoutCubit(getItInstance()));
  getItInstance.registerFactory(() => FetchUserCubit(getItInstance()));
}
