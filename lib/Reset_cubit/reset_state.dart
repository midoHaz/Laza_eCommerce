part of 'reset_cubit.dart';

@immutable
abstract class ResetState {}

class ResetInitial extends ResetState {}

final class ResetLoading extends ResetState {}

// ignore: must_be_immutable
final class ResetEmpty extends ResetState {
String emptyMessage;

ResetEmpty({required this.emptyMessage});
}

// ignore: must_be_immutable
final class ResetSuccess extends ResetState {
String successMessage;

ResetSuccess({required this.successMessage});
}

// ignore: must_be_immutable
final class ResetFailure extends ResetState {
String errorMessage;

ResetFailure({required this.errorMessage});
}