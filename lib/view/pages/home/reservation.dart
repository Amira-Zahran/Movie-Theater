import 'dart:math';

import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:odc_interview/model/home/movies_find_model.dart';
import 'package:odc_interview/view/components/core/style.dart';
import 'package:odc_interview/view/components/home/home_component.dart';
import 'package:odc_interview/view/pages/home/check_right.dart';

import '../../components/core/components.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key, required this.moviesFindModel, required this.index}) : super(key: key);

  final List<MoviesFindModel> moviesFindModel;
  final int index;
  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  final TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);

  var min = Random().nextInt(10);
 // Value is >= 0 and < 10.
  int max = Random().nextInt(100) + 50;
 // Value is >= 50 and < 150.
  bool selected = false;

 // List<Random> time = [Random(max - min)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: /*AppBar(
        title: Text('Anything'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),*/
      appBar('Reservation'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(thickness: 1, endIndent: MediaQuery.of(context).size.width*.5, color: primary,),
            const SizedBox(height: 15,),
            customText(widget.moviesFindModel[widget.index].name, 20),
            const SizedBox(height: 20,),
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: CurvedCarousel(
                    //viewPortSize: 50,
                    //reverseAutomaticMovement: false,
                    scaleMiddleItem: false,
                    automaticMoveDelay: 0,
                    //animationDuration: 5,
                    //disableInfiniteScrolling: false,
                    tiltItemWithcurve: false,
                    //horizontalPadding: 50,
                    curveScale: -6,
                    itemBuilder: (context, i){
                      return Column(
                        children: [
                          customText(_time.format(context).toString(), 12),
                          const SizedBox(height: 5,),
                          const CircleAvatar(
                            radius: 3,
                            backgroundColor: primary,
                          ),
                        ],
                      );
                      },
                    itemCount: 10,
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 10,
                  left: 10,
                  child: Image.asset('assets/img/curvedline.png'),
                ),
                Center(
                  child: Positioned(
                      child: Container(
                        padding: const EdgeInsets.only(top: 80, left: 15),
                        width: MediaQuery.of(context).size.width*.9,
                        height: MediaQuery.of(context).size.height*.5,
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            //crossAxisSpacing: 5,
                            //mainAxisSpacing: 5,
                            // mainAxisExtent: 150
                          ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index){
                            return InkWell(
                                onTap: (){
                                  setState((){
                                    selected = !selected;
                                  });
                                },
                                child: selected ? const Icon(Icons.event_seat, color: selectedSeat,) : const Icon(Icons.event_seat_outlined, color: primary,));
                          },
                          itemCount: 36,),
                      ),
                  ),
                ),
              ],
            ),
            /*Container(
              height: 5.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                        MediaQuery.of(context).size.width, 10.0)),
              ),
            ),
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
              ),
              painter: HeaderCurvedContainer(),
            ),*/


            /*SizedBox(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: SliderPainter(
                  sliderColor: primary,
                  //dragPosition:
                ),
                child: const Text('dddk'),
              ),
            )*/


         /*   btnAlign(context, () {
              navigateTo(context, Reservation());
            }, 'Reservation'),*/
            const SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  const Icon(Icons.event_seat, color: selectedSeat,),
                  customText('Reserved', 14)
                ],),
                Row(children: [
                  const Icon(Icons.event_seat_outlined, color: primary,),
                  customText('Avaliable', 14)
                ],),
                Row(children: [
                  const Icon(Icons.event_seat, color: primary,),
                  customText('Selected', 14)
                ],),
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.event_seat, color: primary,),
                    customText(widget.moviesFindModel[widget.index].id, 17)
                  ],
                ),
                circle(primary),
              ],
            ),

            Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    height: 60,
                    color: primary,
                    onPressed: () {
                      navigateTo(context, const CheckRightPayment());
                    },
                    child: Center(child: customText('Checkout', 16)),
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
