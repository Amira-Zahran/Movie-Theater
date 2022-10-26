import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:odc_interview/model/home/movies_find_model.dart';
import 'package:odc_interview/view/components/core/style.dart';
import 'package:odc_interview/view_model/bloc/home/home_cubit.dart';
import 'package:odc_interview/view_model/bloc/states.dart';

import '../../components/core/components.dart';
import 'details.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;

  //int _currentPage = 1;


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


  //final CarouselController _controller = CarouselController();

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          HomeCubit myHome = HomeCubit.get(context);

          /*final List<Widget> imageSliders = myHome.moviesUpComing.map((item) => Container(
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
              .toList();*/

          return  Scaffold(
            backgroundColor: secondary,
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
                            padding: const EdgeInsets.only(top: 30, left: 20),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                InkWell(
                                  onTap: (){
                                    navigateTo(context, Details(moviesFindModel: myHome.moviesFind, index: index,));
                                  },
                                  child: Center(
                                  child: Container(
                                          height: MediaQuery.of(context).size.height*.3,
                                          width: MediaQuery.of(context).size.width*.4,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                                          child: AspectRatio(
                                           aspectRatio: 1,
                                           child: carouselView(index, myHome.moviesFind))
                                      ),
                                  ),
                                ),
                                //Image.network(myHome.moviesFindModel!.imageUrl.toString()),
                                const Text('Coming Soon', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
                                SizedBox(height: MediaQuery.of(context).size.height*.03,),
                                SizedBox(
                                       height: MediaQuery.of(context).size.height*.4,
                                       width: MediaQuery.of(context).size.width,
                                       child: ListView.separated(
                                         physics: const BouncingScrollPhysics(),
                                         scrollDirection: Axis.horizontal,
                                         itemBuilder: (context, index) => Image.network(myHome.moviesUpComing[index].imageUrl.toString()),
                                         separatorBuilder: (context, index) => const SizedBox(
                                           width: 20,
                                         ),
                                         itemCount: myHome.moviesUpComing.length,
                                       ),
                                   ),
                              ],
                            ),
                          );
                          },
                  )
                  ),
                      /*sliderBuilder(context),
                      SizedBox(
                        height: 500,
                        width: MediaQuery.of(context).size.width*.9,
                        child: PageView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return AspectRatio(
                                aspectRatio: 1.0,
                              child: carouselUpComing(index, myHome.moviesUpComing),
                            );
                          },
                        ),
                      ),*/
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


              /*ListView.builder(itemBuilder: (ctx, index) {
                if (index == 2) {
                  return  Builder(
                    builder: (context) {
                      double height = MediaQuery.of(context).size.height;
                      return Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: height,
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                              // autoPlay: false,
                            ),
                            items: imageSliders.map((item) => Center(
                                child: Image.network(
                                  myHome.moviesFind[index].imageUrl.toString(),
                                  fit: BoxFit.cover,
                                  height: height,
                                )))
                                .toList(),
                          ),
                          Column(children: [
                            Expanded(
                              child: CarouselSlider(
                                items: imageSliders,
                                carouselController: _controller,
                                options: CarouselOptions(
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    aspectRatio: 2.0,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentPage = index;
                                      });
                                    }),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imageSliders.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () => _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 12.0,
                                    height: 12.0,
                                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                            .withOpacity(_currentPage == entry.key ? 0.9 : 0.4)),
                                  ),
                                );
                              }).toList(),
                            ),
                          ]),
                        ],
                      );
                    },
                  );
                } else {
                  return Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          pageViewKey: PageStorageKey<String>('carousel_slider'),
                        ),
                        items: imageSliders,
                      ));
                }
              }*/
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


  /*
  Widget carouselUpComing(int index, List<MoviesUpComingModel>? moviesUpComing) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCardUpComing(index, moviesUpComing),
        );
      },
    );
  }

  Widget carouselCardUpComing(int index , List<MoviesUpComingModel>? moviesUpComing) {
    return Column(
      children: [
        Image.network(moviesUpComing![index].imageUrl.toString(),),
        *//* SizedBox(
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
            )*//*
      ],
    );
  }

  Widget sliderBuilder(context){
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<MoviesUpComingModel>> sliderModel){
      if(sliderModel.hasData){
        return imageCarousel(sliderModel.data);
      }
      return const Center(child: CircularProgressIndicator(color: primary,),);
    },
    );
  }

  Widget imageCarousel(List<MoviesUpComingModel>? moviesUpComing){
    return CarouselSlider(items: moviesUpComing!.map((model) {
      return Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(model.imageUrl.toString()),
          fit: BoxFit.cover
          )
        ),
      );
    }).toList(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: false,
          aspectRatio: 16/9,
          autoPlayCurve: Curves.decelerate,
          enableInfiniteScroll: true,
          viewportFraction: .9
        )
    );
  }
*/

}
