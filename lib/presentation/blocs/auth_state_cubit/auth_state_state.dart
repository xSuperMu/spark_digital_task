part of 'auth_state_cubit.dart';

abstract class AuthStateState extends Equatable {
  const AuthStateState();
}

class AuthStateInitial extends AuthStateState {
  @override
  List<Object> get props => [];
}

class AuthStateLoading extends AuthStateState {
  @override
  List<Object> get props => [];
}

class AuthStateAuthenticated extends AuthStateState {
  @override
  List<Object> get props => [];
}

class AuthStateUnAuthenticated extends AuthStateState {
  @override
  List<Object> get props => [];
}

class AuthStateFailure extends AuthStateState {
  final Failure failure;

  const AuthStateFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
