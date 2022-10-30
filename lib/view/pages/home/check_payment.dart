import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/components.dart';

import '../../../model/home/movies_find_model.dart';
import '../../components/core/style.dart';
import 'check_right.dart';

class CheckPayment extends StatefulWidget {
  const CheckPayment({Key? key, required this.movie, required this.ind}) : super(key: key);

  final List<MoviesFindModel> movie;
  final int ind;
  
  @override
  State<CheckPayment> createState() => _CheckPaymentState();
}

class _CheckPaymentState extends State<CheckPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: appBar('Checkout'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(thickness: 1, endIndent: MediaQuery.of(context).size.width*.2, color: primary,),
            const SizedBox(height: 15,),
            customText(widget.movie[widget.ind].name, 20),
            const SizedBox(height: 10,),
            customText('Tomorrow | 20 Feb | 9:00pm', 14),
            const SizedBox(height: 15,),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*.9,
                height: MediaQuery.of(context).size.width*.9,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: darkGrey),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customText('NP Order', 15),
                        customText('983778298', 15)
                      ],
                    ),
                    Divider(thickness: 1,indent: MediaQuery.of(context).size.width*.1, endIndent: MediaQuery.of(context).size.width*.1, color: secondary,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText('Info', 15),
                        customText(widget.movie[widget.ind].name, 15)
                      ],
                    ),
                    Divider(thickness: 1,indent: MediaQuery.of(context).size.width*.1, endIndent: MediaQuery.of(context).size.width*.1, color: secondary,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customText('Session', 15),
                        customText('9:00, 20 Feb', 15)
                      ],
                    ),
                    Divider(thickness: 1,indent: MediaQuery.of(context).size.width*.1, endIndent: MediaQuery.of(context).size.width*.1, color: secondary,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customText('Seats', 15),
                        customText('G1', 15)
                      ],
                    ),
                    Divider(thickness: 1,indent: MediaQuery.of(context).size.width*.1, endIndent: MediaQuery.of(context).size.width*.1, color: secondary,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customText('Total', 15),
                        customText('${widget.movie[widget.ind].id.toString()} EGP', 15)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: customText('Payment Info', 18),
            ),
            Container(
              width: MediaQuery.of(context).size.width*.9,
              height: MediaQuery.of(context).size.width*.5,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/img/paymentcard.png'), fit: BoxFit.cover)),
            ),
            const SizedBox(height: 40,),
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
                    child: Center(child: customText('Pay Now', 16)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
