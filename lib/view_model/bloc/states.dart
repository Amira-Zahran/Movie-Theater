import 'package:dio/dio.dart';
import 'package:odc_interview/model/home/movies_find_model.dart';

import '../../model/auth/login_model.dart';
import '../../model/home/movies_upcoming_model.dart';

class CubitState {}

class InitialCubitState extends CubitState{}



class LoginLoadingState extends CubitState{}
class LoginSuccessState extends CubitState{
  final LoginModel loginModel ;

  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends CubitState{
  final Response? error;
  LoginErrorState(this.error);
}

class NavLoading extends CubitState{}
class NavigationSuccessState extends CubitState{}



class MoviesFindLoadingState extends CubitState {}
class MoviesFindSuccessState extends CubitState {
  /*final MoviesFindModel moviesFindModel ;

  MoviesFindSuccessState(this.moviesFindModel);*/
}
class MovieFindErrorState extends CubitState {
  final Response? error;
  MovieFindErrorState(this.error);
}


class MoviesUpComingLoadingState extends CubitState {}
class MoviesUpComingSuccessState extends CubitState {}
class MoviesUpComingErrorState extends CubitState {
  final Response? error;
  MoviesUpComingErrorState(this.error);
}







class GetSectionsSuccess extends CubitState{}
class GetLecturesSuccess extends CubitState{}
class GetFinalsSuccess extends CubitState{}
class GetMidtermsSuccess extends CubitState{}
class GetNewsSuccess extends CubitState{}

class GetFAQsSuccess extends CubitState{}
class GetTermsSuccess extends CubitState{}


class GetNoteData extends CubitState{}

class InternetConnectedSuccess extends CubitState{}
class InternetNotConnected extends CubitState{}