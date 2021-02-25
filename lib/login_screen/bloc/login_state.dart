part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class LoginSuccess extends LoginState {
  final Account loginResponse;
  LoginSuccess(this.loginResponse);
}

class LoginFailure extends LoginState {
  final String e;

  LoginFailure(this.e);
}
