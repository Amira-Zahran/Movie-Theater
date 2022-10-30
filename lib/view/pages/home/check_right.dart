import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:odc_interview/view/components/home/home_component.dart';

import '../../components/core/components.dart';

class CheckRightPayment extends StatelessWidget {
  const CheckRightPayment({Key? key}) : super(key: key);

  // final AnimationController controller = AnimationController(vsync: 0.0);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar('Checkout'),
      body: Center(
        child: Column(
          children: [
            const Text('Congrats', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Salsa', fontSize: 18, color: Colors.white),),
            const Text('Reservation Completed', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Salsa', fontSize: 18, color: Colors.white),),
            Lottie.asset(
              'assets/LottieLogo1.json',
              //controller: controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                /*controller
                  ..duration = composition.duration
                  ..forward();*/
              },
            ),
            btn((){}, Size(MediaQuery.of(context).size.width*.75, 55), 'View Ticket')
          ],
        ),
      ),
    );
  }
}
