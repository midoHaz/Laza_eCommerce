import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  double star =2;
  void changeStar(double value){
    star=value;
    emit(ChangeStarState());
  }

}
