import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/components.dart';
import 'package:odc_interview/view/components/core/style.dart';

import 'RefCode.dart';
import 'VisaCard.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expanded(
                child: InkWell(
                  onTap: ((){
                    navigateAndFinish(context, VisaCardScreen());
                  }),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: primary)),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(image: AssetImage('assets/Images/card.png')),
                        SizedBox(height: 10,),
                        Text('Payment With Card', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expanded(
                child: InkWell(
                  onTap: ((){
                    navigateAndFinish(context, RefCodeScreen());
                  }),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: primary)),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                            width: 120,
                            height: 120,
                            child: Image(image: AssetImage('assets/Images/alipay.png'))),
                        SizedBox(height: 10,),
                        Text('Payment With Ref Code', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
