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
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccess(successMessage: "Successfully signed in."));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure(errorMessage: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        // showSnackBar(context, );
        emit(SignInFailure(
            errorMessage: "Wrong password provided for that user."));
      }
    } catch (e) {
      emit(SignInFailure(errorMessage: e.toString()));
    }
  }

}
