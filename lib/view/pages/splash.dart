import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/components.dart';
import 'package:odc_interview/view/components/core/style.dart';
import 'package:odc_interview/view/pages/home/nav_bottom_bar.dart';
import 'package:odc_interview/view_model/database/local/shared_prefrences/preference_utils.dart';
import 'auth/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: AnimatedSplashScreen(
            backgroundColor: secondary,
            nextScreen:/* PreferenceUtils.getString(SharedKeys.apiToken).isEmpty ? Login() :*/ const NavBottomBar(),
            duration: 2200,
            splash: SizedBox(
                //width: MediaQuery.of(context).size.width*.8, height: MediaQuery.of(context).size.height*.9,
                child: logo(context)),
          ),
        ));
  }
}