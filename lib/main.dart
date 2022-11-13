import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_interview/view_model/bloc/auth/Login_cubit.dart';
import 'view/pages/splash.dart';
import 'view_model/bloc/home/home_cubit.dart';
import 'view_model/database/local/shared_prefrences/preference_utils.dart';
import 'view_model/database/network/dio_helper.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await PreferenceUtils.init();


  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) { return LoginCubit(); },
        ),
        BlocProvider(
          create: (BuildContext context) { return HomeCubit(); },
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen()
      ),
    );
  }
}

