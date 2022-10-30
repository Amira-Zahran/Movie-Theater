import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/style.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../components/core/components.dart';
import '../qr_code/Qr_Code.dart';

class TicketDetails extends StatelessWidget {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: appBar('View Ticket'),
      body: Center(
        child: TicketWidget(
          width: 320,
          height: 450,
          color: darkGrey,
          isCornerRounded: true,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text(
                    'Movie: Spider-man No Way Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ticketDetailsWidget(
                      'Name', 'Amira Zahran', 'Seats', 'G5, G6, G7, G8',),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, right: 52.0),
                      child: ticketDetailsWidget( 'Date', '28 Feb 2022', 'Time', '9:00 pm'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                      child: ticketDetailsWidget('NP Order', '7283603745', 'Price', '150 EGP'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50.0, left: 90.0, right: 90.0),
                child:  QRCode(
                  qrSize: 83,
                  qrData: 'https://flutterflow.io',
                  qrForegroundColor: primary,
                ),
              ),

            ],
          ),
        ),
      )


      /*Center(child: Container(
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
                            Text('Name', style: TextStyle(color: Colors.grey),),
                            Text('Ahmed Abaza', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        Column(
                          children: const [
                            Text('Seats', style: TextStyle(color: Colors.grey),),
                            Text('G5, G6, G7, G8', style: TextStyle(color: Colors.white),),
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
                            Text('Date', style: TextStyle(color: Colors.grey),),
                            Text('20 Feb 2022', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        Column(
                          children: const [
                            Text('Time', style: TextStyle(color: Colors.grey),),
                            Text('9:00 pm', style: TextStyle(color: Colors.white),),
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
                            Text('NP Order', style: TextStyle(color: Colors.grey),),
                            Text('7283603745', style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        Column(
                          children: const [
                            Text('Price', style: TextStyle(color: Colors.grey),),
                            Text('150 EGP', style: TextStyle(color: Colors.white),),
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
      ),*/
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      )
    ],
  );
}