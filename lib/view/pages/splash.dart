import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/style.dart';
import '../../view_model/database/local/shared_prefrences/string/access.dart';
import 'auth/login.dart';
import 'home/home.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: AnimatedSplashScreen(
            backgroundColor: secondary,
            nextScreen: accessToken.isEmpty ?  Login() : Home(),
            duration: 2200,
            splash: SizedBox(
                //width: MediaQuery.of(context).size.width*.8, height: MediaQuery.of(context).size.height*.9,
                child: Image.asset('assets/img/logo.png',)),
          ),
        ));
  }
}