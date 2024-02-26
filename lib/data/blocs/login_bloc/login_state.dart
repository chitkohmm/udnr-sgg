part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final LoginResponse loginResponse;
  LoginLoadedState({required this.loginResponse});
}

class LoginErrorState extends LoginState {
  final int statusCode;
  LoginErrorState({required this.statusCode});
}
