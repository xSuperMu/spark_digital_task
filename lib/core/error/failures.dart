import 'package:spark_digital/imports.dart';

class Failure extends Equatable {
  final FailureType errorType;
  final String message;

  const Failure(
    this.errorType,
    this.message,
  );

  @override
  List<Object?> get props => [errorType, message];

  @override
  bool? get stringify => true;
}

enum FailureType {
  unknown(Strings.unknownError),
  inputNotValid(Strings.inputNotValid),
  firebaseAuth(Strings.failedToAuth);

  final String message;

  const FailureType(this.message);
}
