import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_interview/model/home/movies_find_model.dart';
import 'package:odc_interview/model/home/movies_upcoming_model.dart';
import 'package:odc_interview/view/pages/home/home.dart';
import 'package:odc_interview/view/pages/home/search.dart';
import 'package:odc_interview/view/pages/home/tickets.dart';
import 'package:odc_interview/view_model/database/local/shared_prefrences/preference_utils.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../states.dart';

class HomeCubit extends Cubit<CubitState>{
  HomeCubit() : super(InitialCubitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;


  int currentIndex = 0;

  void changeScreenIndex(int index)
  {
    currentIndex = index;
    emit(NavigationSuccessState());
  }

  final screens = [
    Home(),
    const Tickets(),
    SearchScreen()
  ];


  List<MoviesFindModel> moviesFind = [];
  Future getMoviesFind()async{
    //if (await internetConnection!.isConnected) {
    emit(MoviesFindLoadingState());
    await DioHelper.getData(url: moviesFindEndPoint, token: PreferenceUtils.getString(SharedKeys.apiToken)).then((value) {
      if (value.statusCode == 200) {
        print(accessToken);
        accessToken = PreferenceUtils.getString(SharedKeys.apiToken);
        print('$accessToken _______________________');
        //moviesFindModel = MoviesFindModel.fromJson(value.data);
        for(var mov in value.data) {
          moviesFind.add(MoviesFindModel.fromJson(mov));
        }
        isLoading = false;
        emit(MoviesFindSuccessState());
        print('Movies Find');
      }
      emit(MoviesFindSuccessState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        print('error');
        emit(MovieFindErrorState(error.response?.data['message'][0]));
      }
    });
  }


/*  List<MoviesUpComingModel> moviesUpComingModel = [];
  Future getMoviesUpCome()async{
    //if (await internetConnection!.isConnected) {
    emit(MoviesUpComingLoadingState());
    await DioHelper.getData(url: moviesUpComingEndPoint, token: accessToken).then((value) {
      if (value.statusCode == 200) {
        print(accessToken);
        accessToken = PreferenceUtils.getString(SharedKeys.apiToken);
        print('$accessToken _______________________');

        for(var mov in value.data){
          moviesUpComingModel.add(MoviesUpComingModel.fromJson(mov));
        }
        isLoading = false;
        emit(MoviesUpComingSuccessState());
        print('Movies UpComing');
      }
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(MoviesUpComingErrorState(error.response?.data['message'][0]));
      }
    });
  }*/





  List<MoviesUpComingModel> moviesUpComing = [];
  Future getMoviesUpComing()async{
    //if (await internetConnection!.isConnected) {
    emit(MoviesUpComingLoadingState());
    await DioHelper.getData(url: moviesUpComingEndPoint, token: PreferenceUtils.getString(SharedKeys.apiToken)).then((value) {
      if (value.statusCode == 200) {
        print(accessToken);
        accessToken = PreferenceUtils.getString(SharedKeys.apiToken);
        print('$accessToken _______________________');
        //moviesFindModel = MoviesFindModel.fromJson(value.data);
        for(var mov in value.data) {
          moviesUpComing.add(MoviesUpComingModel.fromJson(mov));
        }
        isLoading = false;
        emit(MoviesUpComingSuccessState());
        print('Movies Up Coming');
      }
      emit(MoviesUpComingSuccessState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        print('error');
        emit(MoviesUpComingErrorState(error.response?.data['message'][0]));
      }
    });
  }

}