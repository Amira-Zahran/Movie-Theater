import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_interview/model/home/movies_find_model.dart';
import 'package:odc_interview/view/components/core/style.dart';
import 'package:odc_interview/view_model/bloc/home/home_cubit.dart';
import 'package:odc_interview/view_model/bloc/states.dart';
import 'package:page_indicator/page_indicator.dart';




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  PageController controller = PageController();

  //List<Widget> IMAGES = ["assets/img/logo.png", "assets/img/home.png", "assets/img/mask.png", "assets/img/mask.png"];
  final borderRadius = BorderRadius.circular(20.0);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return HomeCubit.get(context)..getMoviesFind()..getMoviesUpComing(); },
      child: BlocConsumer<HomeCubit, CubitState>(
          listener: (BuildContext context, state) {  },
          builder: (BuildContext context, Object? state) {
            HomeCubit myHome = HomeCubit.get(context);

            return  Scaffold(
              backgroundColor: secondary,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Stack(
                          children: [
                            SizedBox(
                             width: double.infinity,
                             height: MediaQuery.of(context).size.height*.6,
                             child: PageIndicatorContainer (
                                 align: IndicatorAlign.bottom,
                                 length: 4,
                                 indicatorSpace: 20.0,
                                 padding: const EdgeInsets.all(10),
                                 indicatorColor: grey,
                                 indicatorSelectorColor: primary,
                                 shape: IndicatorShape.circle(size: 12),
                                 // shape: IndicatorShape.roundRectangleShape(size: Size.square(12),cornerSize: Size.square(3)),
                                 // shape: IndicatorShape.oval(size: Size(12, 8)),

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
                                         children: const [
                                           Center(child: Text('Now Playing', style: TextStyle(
                                               fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Salsa',
                                              color: Colors.white),)),
                                          SizedBox(height: 5,),
                                          Center(child: Text('Book your ticket now', style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Salsa',
                                              color: primary),)),
                                          //SizedBox(height: MediaQuery.of(context).size.height*.09,),
                                        ],
                                      ),
                                    );
                                },
                                 )
                             )),
                            SizedBox(
                                height: 200,
                                child: CurvedCarousel(
                                  viewPortSize: 60,
                                  reverseAutomaticMovement: false,
                                  scaleMiddleItem: false,
                                  automaticMoveDelay: 2,
                                  animationDuration: 5,
                                  disableInfiniteScrolling: false,
                                  tiltItemWithcurve: false,
                                  //horizontalPadding: 50,
                                  curveScale: -7,
                                  itemBuilder: (context, i){
                                    return Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.network(myHome.moviesFind[i].imageUrl.toString(),));

                                  },
                                  itemCount: myHome.moviesFind.length,
                                ),
                              ),

/*
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
*/
/*
                            Center(
                              child: SizedBox(
                                width: 300,
                                height: 500,
                                child: SwipeDeck(
                                  startIndex: 2,
                                  emptyIndicator: const Center(
                                    child: Text("Nothing Here"),
                                  ),
                                  cardSpreadInDegrees: 600, // Change the Spread of Background Cards
                                  widgets: IMAGES.map((index) => GestureDetector(
                                    onTap: () {
                                      //print(e);
                                    },
                                    child: ClipRRect(
                                        borderRadius: borderRadius,
                                        child: Image.asset(index,
                                          fit: BoxFit.cover,
                                        )),
                                  )).toList(),
                                ),
                              ),
                            ),
*/
/*
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 600),
                              bottom: index - 2 == pageChangedIndex
                                  ? 10.0
                                  : index - 1 == pageChangedIndex
                                  ? 30
                                  : index + 1 == pageChangedIndex
                                  ? 30.0
                                  : index + 2 == pageChangedIndex
                                  ? 10.0
                                  : index == pageChangedIndex
                                  ? 50.0
                                  : 10.0,
                              child: Container(
                                color: Colors.red,
                                // height: pageChangedIndex == index
                                //     ? PAGER_HEIGHT * scale
                                //     : 45.0,
                                // width: pageChangedIndex == index
                                //     ? PAGER_HEIGHT * scale
                                //     : 45.0,
                                child: Text('hey there'),
                              ),
                            ),
*/
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Coming Soon', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.03,),
                        CarouselSlider(
                          items: myHome.moviesUpComing.map((index){
                            return Builder(
                                builder: (context){
                                  return Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                                          image: DecorationImage(image: NetworkImage(index.imageUrl.toString(), ),fit: BoxFit.fill),
                                          ),
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                      ),
                                      Positioned(
                                          left: 15,
                                          bottom: 45,
                                          child: Text(index.name.toString() , style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),)),
                                      const Positioned(
                                          left: 15,
                                          bottom: 20,
                                          child: Text('April 1 2022', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 17),)),
                                  ],
                                  );
                                }
                            );
                          }).toList(),
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            height: MediaQuery.of(context).size.height*.3,
                          ),
                        )
                      ],
                    ),
                  ),
                );
          },
      ),
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
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(moviesFind![index].imageUrl.toString(),));
  }

}
