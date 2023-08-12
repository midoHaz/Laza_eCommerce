part of 'sighup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState{
  String successMessage;

  SignupSuccess({required this.successMessage});
}

final class SignupLoading extends SignupState {}

// ignore: must_be_immutable
final class SignupFailure extends SignupState {
String errorMessage;

SignupFailure({required this.errorMessage});
}