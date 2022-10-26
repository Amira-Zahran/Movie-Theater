import 'package:flutter/material.dart';
import 'view/pages/splash.dart';
import 'view_model/database/local/SQLITE_DB/database.dart';
import 'view_model/database/local/shared_prefrences/preference_utils.dart';
import 'view_model/database/network/dio_helper.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await PreferenceUtils.init();
  SQLHelper.initDb();


  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp();


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
    );
  }
}


