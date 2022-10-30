import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:odc_interview/view/components/core/style.dart';
import 'package:odc_interview/view/components/home/home_component.dart';
import 'package:odc_interview/view/pages/home/nav_bottom_bar.dart';
import 'package:odc_interview/view/pages/home/ticket_details.dart';

import '../../components/core/components.dart';

class CheckRightPayment extends StatelessWidget {
  const CheckRightPayment({Key? key}) : super(key: key);

  // final AnimationController controller = AnimationController(vsync: 0.0);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: secondary,
      appBar: appBar('Checkout'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(thickness: 1, color: primary,),
            const SizedBox(height: 50,),
            const Text('Congrats', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Salsa', fontSize: 40, color: Colors.white),),
            const SizedBox(height: 20,),
            const Text('Reservation Completed', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Salsa', fontSize: 18, color: Colors.white),),
            Lottie.asset('assets/lottie/check_payment.json',),
            btn((){
              navigateTo(context, const TicketDetails());
            }, Size(MediaQuery.of(context).size.width*.75, 55), 'View Ticket'
            ),
            const SizedBox(height: 20,),
            btnBack((){
              navigateTo(context, const NavBottomBar());
            }, Size(MediaQuery.of(context).size.width*.75, 55), 'Back to home'
            )
          ],
        ),
      ),
    );
  }
}
