part of 'fetch_user_cubit.dart';

@immutable
abstract class FetchUserState {}

class FetchUserInitial extends FetchUserState {}

class FetchUserLoading extends FetchUserState {}

class FetchUserSuccess extends FetchUserState {
  final UserEntity userEntity;

  FetchUserSuccess({required this.userEntity});
}

class FetchUserFailure extends FetchUserState {
  final Failure failure;

  FetchUserFailure({required this.failure});
}
