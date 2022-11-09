part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
}

class ForgetPasswordInitial extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordLoading extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final Failure failure;

  const ForgetPasswordFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

