import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_interview/view/pages/home/home.dart';


import '../../../view_model/bloc/auth/Login_cubit.dart';
import '../../../view_model/bloc/states.dart';
import '../../components/auth_components/auth_components.dart';
import '../../components/core/components.dart';
import '../../components/core/style.dart';


class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return LoginCubit(); },
      child: BlocConsumer<LoginCubit, CubitState>(
        listener: (BuildContext context, state) {
          if(state is LoginSuccessState /*|| state is GoogleAuthSucessState || state is FacebookAuthSucessState*/){
            navigateTo(context, const Home());
            /*showTopSnackBar(
              context,
              const CustomSnackBar.success(
                message: "Logged in Successfully",
              ),
            );*/
          } /*else{
            Fluttertoast.showToast(msg: 'Please try again');
          }*/
        },
        builder: (BuildContext context, Object? state) {
          LoginCubit myLogin = LoginCubit.get(context);
          return SafeArea(
              child: Scaffold(
                backgroundColor: secondary,
                body: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*.05),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 35,),
                          Center(child: logo(context)),
                          const SizedBox(height: 35,),
                          const Center(child: Text('Login', style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: 'Salsa'),)),
                          const SizedBox(height: 35,),
                          defaultField(type: TextInputType.emailAddress, text: 'E-Mail', controller: myLogin.emailController, radius: 10),
                          const SizedBox(height: 35,),
                          defaultField(controller: myLogin.passwordController, type: TextInputType.visiblePassword, text: 'Password', radius: 10),
                          textBtn(text: 'Forget password?', onPressed: (){}, fontSize: 12, height: 1),
                          const SizedBox(height: 50,),
                          Center(
                            child: btn((){
                              myLogin.login();
                              if(_formKey.currentState!.validate()){
                                return;
                              }
                            }, Size(MediaQuery.of(context).size.width*.75, 55), 'Login')
                          ),
                          const SizedBox(height: 35,),
                          dontHaveAccount(),
                          const SizedBox(height: 50,),
                          or(),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: (){

                                  },
                                  child: googleFacebook('assets/img/twitter.png')),
                              InkWell(
                                  onTap: (){

                                  },
                                  child: googleFacebook('assets/img/facebook.png')),
                              InkWell(
                                  onTap: (){

                                  },
                                  child: googleFacebook('assets/img/google.png')),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Center(child: textBtn(text: 'Enter as a guest', onPressed: (){}, fontSize: 15, height: 2)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          );
        },
      ),
    );
  }
}
