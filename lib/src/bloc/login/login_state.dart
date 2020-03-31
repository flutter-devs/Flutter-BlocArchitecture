class LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;

  const LoginState({
    this.isEmailValid = true,
    this.isPasswordValid = true,
  });

  factory LoginState.initial() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
    );
  }

  LoginState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }

  @override
  String toString() {
    return '''LoginState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
    }''';
  }
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  var error;

  LoginFailure({this.error});
}

class UserLoggedIn extends LoginState {}

class UserLoggedOut extends LoginState {}

class UserUnavailable extends LoginState {}
