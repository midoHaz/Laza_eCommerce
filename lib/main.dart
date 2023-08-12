import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laza_commerce/Helper/hive_adapter.dart';
import 'package:laza_commerce/Helper/hive_database.dart';
import 'package:laza_commerce/Helper/hive_helper.dart';
import 'package:laza_commerce/Network/client_dio.dart';
import 'package:laza_commerce/Reset_cubit/reset_cubit.dart';
import 'package:laza_commerce/card_cubit/card_cubit.dart';
import 'package:laza_commerce/consts.dart';
import 'package:laza_commerce/cubit/login_cubit.dart';
import 'package:laza_commerce/dark_cubit/dark_cubit.dart';
import 'package:laza_commerce/firebase_options.dart';
import 'package:laza_commerce/language_cubit/language_cubit.dart';
import 'package:laza_commerce/sighup_cubit/sighup_cubit.dart';
import 'package:laza_commerce/views/Home.dart';
import 'package:laza_commerce/views/categories.dart';
import 'package:laza_commerce/views/forgetPassword.dart';

Future<void> main() async {
  DioHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ReviewAdapter());
  await Hive.openBox(reviews);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(),),
        BlocProvider(
          create: (context) => LanguageCubit(),),
        BlocProvider(
          create: (context) => LoginCubit(),),
        BlocProvider(
          create: (context) => ResetCubit(),),
        BlocProvider(
          create: (context) => DarkCubit(),),
        BlocProvider(
          create: (context) => CardCubit(),),
      ], child: BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return BlocBuilder<DarkCubit,DarkState>(
          builder: (context, state) {
            return GetMaterialApp(
              theme: context.read<DarkCubit>().isDarkMode ? darkTheme : ThemeData.light(),
              locale: context
                  .read<LanguageCubit>()
                  .local,
              // localizationsDelegates: AppLocalizations.localizationsDelegates,
              // supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: const Home(
                image: 'assets/images/Logo.png', color: primarycolor,),
            );
          },
        );
      },
    ),
    );
  }
}



