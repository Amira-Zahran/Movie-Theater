import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_interview/model/home/movies_find_model.dart';
import 'package:odc_interview/model/home/movies_upcoming_model.dart';
import '../../database/local/shared_prefrences/string/access.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../states.dart';

class HomeCubit extends Cubit<CubitState>{
  HomeCubit() : super(InitialCubitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool isLoading = true;

  MoviesFindModel? moviesFindModel;

  Future getMoviesFind()async{
    //if (await internetConnection!.isConnected) {
    emit(MoviesFindLoadingState());
    await DioHelper.getData(url: moviesFindEndPoint, token: accessToken).then((value) {
      if (value.statusCode == 200) {
        moviesFindModel = MoviesFindModel.fromJson(value.data);
        isLoading = false;
        emit(MoviesFindSuccessState(moviesFindModel!));
        print('Movies Find');
      }
      emit(MoviesFindSuccessState(moviesFindModel!));
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(MovieFindErrorState(error.response?.data['message'][0]));
      }
    });
  }


  MoviesUpComingModel? moviesUpComingModel;

  Future getMoviesUpComing()async{
    //if (await internetConnection!.isConnected) {
    emit(MoviesUpComingLoadingState());
    await DioHelper.getData(url: moviesUpComingEndPoint, token: accessToken).then((value) {
      if (value.statusCode == 200) {
        moviesUpComingModel = MoviesUpComingModel.fromJson(value.data);
        isLoading = false;
        emit(MoviesUpComingSuccessState(moviesUpComingModel!));
        print('Movies UpComing');
      }
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        print(error.toString());
        emit(MoviesUpComingErrorState(error.response?.data['message'][0]));
      }
    });
  }
}