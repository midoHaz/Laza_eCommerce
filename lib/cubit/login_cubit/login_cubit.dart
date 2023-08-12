import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> signInUser(
      {required String email, required String password}) async {
    emit(SignInLoading());
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.sendEmailVerification();
      emit(SignInSuccess(
          successMessage:
          "Your account successfully created.\nPlease verify your email then Sign in."));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignInFailure(errorMessage: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        // showSnackBar(context, );
        emit(SignInFailure(
            errorMessage: "The account already exists for that email."));
      }
    } catch (e) {
      emit(SignInFailure(errorMessage: e.toString()));
    }
  }

}
