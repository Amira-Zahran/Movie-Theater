import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/style.dart';

import '../../components/home/home.dart';

class TicketDetails extends StatelessWidget {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        backgroundColor: secondary,
        elevation: 0.0,
        title: const Text('View Ticket'),
        leading: const BackButton(color: Colors.white,),
        centerTitle: true,),
      body: Center(child: Container(
       // padding: const EdgeInsets.only(left: 20),
        width: MediaQuery.of(context).size.width*.9,
        height: MediaQuery.of(context).size.height*.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(image: AssetImage('assets/img/subtract.png',), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*.7,
              height: MediaQuery.of(context).size.height*.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 18, top: 18),
                        child: customText('Movie: Spiderlfffff', 13)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text('lllf', style: TextStyle(color: Colors.grey),),
                            Text('lllf', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        Column(
                          children: const [
                            Text('lllf', style: TextStyle(color: Colors.grey),),
                            Text('lllf', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text('lllf', style: TextStyle(color: Colors.grey),),
                            Text('lllf', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        Column(
                          children: const [
                            Text('lllf', style: TextStyle(color: Colors.grey),),
                            Text('lllf', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text('lllf', style: TextStyle(color: Colors.grey),),
                            Text('lllf', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        Column(
                          children: const [
                            Text('lllf', style: TextStyle(color: Colors.grey),),
                            Text('lllf', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ),
            Center(child: Image.asset('assets/img/qrcode.png', width: 75,))

          ],
        ),
      ),
      ),
    );
  }
}
