import 'dart:math';

import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/style.dart';
import 'package:odc_interview/view/components/home/home_component.dart';
import 'package:odc_interview/view/pages/home/check_right.dart';

import '../../components/core/components.dart';

class Reservation extends StatelessWidget {
  Reservation({Key? key}) : super(key: key);


  final TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);
  var min = Random().nextInt(10); // Value is >= 0 and < 10.
  int max = Random().nextInt(100) + 50; // Value is >= 50 and < 150.

 // List<Random> time = [Random(max - min)];

  //Random().next

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
            const SizedBox(height: 40,),
            customText('Spider-man No Way Home', 20),
            const SizedBox(height: 50,),
            /*SizedBox(
              height: 200,
              child: CurvedCarousel(
                curveScale: -7,
                itemBuilder: (_, i) {
                  return CircleAvatar(
                        radius: 3,
                        backgroundColor:
                        Colors.primaries[i % Colors.primaries.length],
                  );
                },
                itemCount: 10,
              ),
            ),
*/
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
                      CircleAvatar(
                        radius: 3,
                        backgroundColor:
                        Colors.primaries[i % Colors.primaries.length],
                      ),
                    ],
                  );
                  },
                itemCount: 10,
              ),
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

            Image.asset('assets/img/curvedline.png'),

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

            Align(
              alignment: FractionalOffset.bottomCenter,
              child: MaterialButton(
                onPressed: () {
                  navigateTo(context, const CheckRightPayment());
                },
                child: const Text('Reservation'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
