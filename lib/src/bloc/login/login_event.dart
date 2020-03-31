import 'package:meta/meta.dart';

abstract class LoginEvent {
  LoginEvent();
}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({@required this.email});
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({@required this.password});
}

class SignInUser extends LoginEvent {
  final String email;
  final String password;

  SignInUser({
    this.email,
    @required this.password,
  });
}

class SignOutUser extends LoginEvent {}

class AppStarted extends LoginEvent {}

class AppRestarted extends LoginEvent {}

class AppClose extends LoginEvent {}

class CheckScreenStatus extends LoginEvent {}

class HitRefreshApi extends LoginEvent {}
