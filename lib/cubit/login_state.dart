part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

final class SignInSuccess extends LoginState{
  String successMessage;

  SignInSuccess({required this.successMessage});
}

final class SignInLoading extends LoginState {}

// ignore: must_be_immutable
final class SignInFailure extends LoginState {
String errorMessage;

SignInFailure({required this.errorMessage});
}



