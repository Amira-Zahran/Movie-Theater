import 'dart:math';

import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/style.dart';

import '../../../model/models.dart';
import '../nav_bar.dart';
import 'details.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: secondary,
        //drawer: drawer(),
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Image.asset('assets/img/drawer.png')),
          title: Image.asset('assets/img/logo.png', width: 70, height: 70,),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0.0,),
        body: Column(
          children: [
            const SizedBox(height: 35,),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/img/logo.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.darken),),),
              child: Column(
                children: [
                  Center(child: Text('Now Playing', style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),)),
                  SizedBox(height: 5,),
                  Center(child: Text('Book your ticket now', style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: primary),)),
                  AspectRatio(
                    aspectRatio: 0.85,
                    child: PageView.builder(
                        itemCount: dataList.length,
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return carouselView(index);
                        }),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
          print("value $value index $index");
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(data: data)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(
                            data.imageName,
                          ),
                          fit: BoxFit.fill),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black26)
                      ]),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            data.title,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "\$${data.price}",
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}