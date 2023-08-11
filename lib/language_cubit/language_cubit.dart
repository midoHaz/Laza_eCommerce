import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  var local = Locale(Platform.localeName.substring(0, 2));

  void changeLanguage() {
    if (local == Locale("ar")) {
      local = Locale("en");
    }else {
      local = Locale("ar");
    }
    emit(LanguageChangedState());
  }

}
