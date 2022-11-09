class ConnectionException implements Exception {
  final String message;

  const ConnectionException(this.message);
}

class UserNotFoundException implements Exception {
  final String message;

  const UserNotFoundException(this.message);
}

class WrongPasswordException implements Exception {
  final String message;

  const WrongPasswordException(this.message);
}

class UnknownException implements Exception {
  final String message;

  const UnknownException(this.message);
}

class WeakPasswordException implements Exception {
  final String message;

  const WeakPasswordException(this.message);
}

class EmailAlreadyRegisteredException implements Exception {
  final String message;

  const EmailAlreadyRegisteredException(this.message);
}
