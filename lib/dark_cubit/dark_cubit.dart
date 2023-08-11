import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dark_state.dart';

class DarkCubit extends Cubit<DarkState> {
  DarkCubit() : super(DarkInitial());

  bool isDarkMode = false;

  void toggleTheme() {

      isDarkMode = !isDarkMode;
    emit(ChangeModeState());
  }
}
