import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_interview/model/home/movies_find_model.dart';
import 'package:odc_interview/view/components/core/style.dart';
import 'package:odc_interview/view_model/bloc/home/home_cubit.dart';
import 'package:odc_interview/view_model/bloc/states.dart';
import 'package:onboarding_screen/onboarding_screen.dart';



class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;

  final int _currentPage = 1;


  fetch(){
    HomeCubit.get(context).getMoviesFind();
    HomeCubit.get(context).getMoviesUpComing();
  }


  @override
  void initState() {
    super.initState();
    fetch();
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          HomeCubit myHome = HomeCubit.get(context);

          final List<Widget> imageSliders = myHome.moviesUpComing.map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: PageView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: <Widget>[
                        Image.network(myHome.moviesUpComing[index].imageUrl.toString(), fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(myHome.moviesUpComing[index].name.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )),
          ))
              .toList();

          return  Scaffold(
            backgroundColor: secondary,
              appBar: AppBar(
                leading: IconButton(onPressed: (){ drawerKey.currentState!.openDrawer(); }, icon: Image.asset('assets/img/drawer.png', width: 50, height: 50,)),
                title: Image.asset('assets/img/logo.png', width: 70, height: 70,),
                centerTitle: true,
                backgroundColor: secondary,
                elevation: 0.0,),
              body: SingleChildScrollView(
                child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: PageView.builder(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        itemCount: myHome.moviesFind.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.only(top: 30),
                            //width: double.infinity,
                            height: MediaQuery.of(context).size.height,
                            //alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(myHome.moviesFind[index].imageUrl.toString()),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.8), BlendMode.darken),),),
                            child: Column(
                              children: [
                                const Center(child: Text('Now Playing', style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Salsa',
                                    color: Colors.white),)),
                                const SizedBox(height: 5,),
                                const Center(child: Text('Book your ticket now', style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Salsa',
                                    color: primary),)),
                                SizedBox(height: MediaQuery.of(context).size.height*.09,),
                                Container(
                                      height: MediaQuery.of(context).size.height*.4,
                                      width: MediaQuery.of(context).size.width*.4,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                                      child: AspectRatio(
                                       aspectRatio: 1/3,
                                       child: carouselView(index, myHome.moviesFind))
                                  ),
                                //Image.network(myHome.moviesFindModel!.imageUrl.toString()),
                                /*SizedBox(
                                       height: 500,
                                       width: 500,
                                       child: ListView.separated(
                                         physics: const BouncingScrollPhysics(),
                                         scrollDirection: Axis.horizontal,
                                         itemBuilder: (context, index) => Column(
                                           children: [
                                             const Text('dkkkkkkkkkkkkkkkkkkkkkkkkk'),
                                             Image.network(myHome.moviesFind[index].imageUrl.toString()),
                                             Text(myHome.moviesFind[index].name.toString()),
                                           ],
                                         ),
                                         separatorBuilder: (context, index) => const SizedBox(
                                           width: 20,
                                         ),
                                         itemCount: myHome.moviesFind.length,
                                       ),
                                   ),*/
                                const Text('data'),
                              ],
                            ),
                          );
                          },
                  )
                  ),
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: PageView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return CarouselSlider(
                              options: CarouselOptions(

                                aspectRatio: 2.0,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                initialPage: 2,
                                autoPlay: false,
                              ),
                              items: imageSliders,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                        /* CarouselSlider(
                      items: imageSliders,
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        initialPage: 2,
                      ),
                    ),*/
              );
        },
    );
  }

  Widget carouselView(int index, List<MoviesFindModel>? moviesFind) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.05).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(index, moviesFind),
        );
      },
    );
  }

  Widget carouselCard(int index , List<MoviesFindModel>? moviesFind) {
    return Column(
          children: [
            Image.network(moviesFind![index].imageUrl.toString(),),
           /* SizedBox(
              width: 200,
              height: 200,
              child: OnBoardingScreen(
                mySlides: moviesFind,
                controller: _pageController,
                slideIndex: 0,
                statusBarColor: Colors.red,
                startGradientColor: Colors.red,
                endGradientColor: Colors.blue,

              ),
            )*/
          ],
    );
  }
}
