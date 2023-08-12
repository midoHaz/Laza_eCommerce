import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'reset_state.dart';

class ResetCubit extends Cubit<ResetState> {
  ResetCubit() : super(ResetInitial());
  Future<void> resetPassword({
    required TextEditingController emailController,
  }) async {
    emit(ResetLoading());
    final String email = emailController.text.trim();

    if (email.isEmpty) {
      emit(ResetEmpty(emptyMessage: "Please enter your email address."));
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // ignore: use_build_context_synchronously
      emit(ResetSuccess(
          successMessage: "Password reset link sent to your email."));
    } catch (e) {
      emit(ResetFailure(
          errorMessage: "Failed to send reset link. Please try again."));
    }
  }
}
