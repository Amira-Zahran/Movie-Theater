// single instance
//static HomeCubit get(context) =>

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/auth/login_model.dart';
import '../../database/local/shared_prefrences/preference_utils.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../states.dart';

class LoginCubit extends Cubit<CubitState>{
  LoginCubit(): super(InitialCubitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  LoginModel? loginModel;

  Future<void> login () async{
    var json = {
      'email': emailController.text.toString(),
      'password': passwordController.text.toString()
    };
    await DioHelper.postData(url: loginEndPoint, data: json).then((value) {
      if(value.statusCode == 200) {
        loginModel = LoginModel.fromJson(value.data);

        //accessToken = loginModel!.data!.accessToken.toString();
        accessToken = value.data['accessToken'];
        PreferenceUtils.setString(SharedKeys.apiToken, accessToken);
        userName = value.data['user']['name'];
        PreferenceUtils.setString(SharedKeys.userName, userName);
        print(accessToken);
        print('------------token');
        emit(LoginSuccessState(loginModel!));
      }
    }).catchError((error){
      print(error);
      if(error is DioError){
        print(error.response!.data['message'],);
        emit(LoginErrorState(error.response!.data['message'][0]));
      }
    });
  }

}