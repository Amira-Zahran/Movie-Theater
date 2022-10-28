import 'package:flutter/material.dart';
import 'package:odc_interview/view/components/core/components.dart';
import 'package:odc_interview/view/components/home/home.dart';
import '../../components/core/style.dart';
import 'ticket_details.dart';


class Tickets extends StatelessWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, bottom: 15),
                child: customText("Today's", 18)
            ),
            Center(child: Container(
              padding: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width*.9,
              height: MediaQuery.of(context).size.height*.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(image: AssetImage('assets/img/ticketshape.png',), fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/img/mask.png'),
                  SizedBox(
                      width: 180,
                      height: 145,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 18, bottom: 10),
                              child: customText('ToS', 13)
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.access_time, color: Colors.white,),
                              SizedBox(width: 1,),
                              Text('lllf', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.event_seat_outlined, color: Colors.white,),
                              //SizedBox(width: 1,),
                              Text('4 seats', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Center(
                            child: ElevatedButton(onPressed: (){
                              navigateTo(context, const TicketDetails());
                            },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primary,
                                  fixedSize: Size(MediaQuery.of(context).size.width*.4, 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: const Text('View Ticket', style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),),
            Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, bottom: 15),
                child: customText("Today's", 18)
            ),
            Center(child: Container(
              padding: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width*.9,
              height: MediaQuery.of(context).size.height*.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(image: AssetImage('assets/img/ticketshape.png',), fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/img/mask.png'),
                  SizedBox(
                      width: 180,
                      height: 145,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 18, bottom: 10),
                              child: customText('ToS', 13)
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.access_time, color: Colors.white,),
                              SizedBox(width: 1,),
                              Text('lllf', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.event_seat_outlined, color: Colors.white,),
                              //SizedBox(width: 1,),
                              Text('4 seats', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Center(
                            child: ElevatedButton(onPressed: (){
                              navigateTo(context, const TicketDetails());
                            },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primary,
                                  fixedSize: Size(MediaQuery.of(context).size.width*.4, 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: const Text('View Ticket', style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),),
            const SizedBox(height: 20,),
            Center(child: Container(
              padding: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width*.9,
              height: MediaQuery.of(context).size.height*.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(image: AssetImage('assets/img/ticketshape.png',), fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/img/mask.png'),
                  SizedBox(
                      width: 180,
                      height: 145,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 18, bottom: 10),
                              child: customText('ToS', 13)
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.access_time, color: Colors.white,),
                              SizedBox(width: 1,),
                              Text('lllf', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.event_seat_outlined, color: Colors.white,),
                              //SizedBox(width: 1,),
                              Text('4 seats', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Center(
                            child: ElevatedButton(onPressed: (){
                              navigateTo(context, const TicketDetails());
                            },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primary,
                                  fixedSize: Size(MediaQuery.of(context).size.width*.4, 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: const Text('View Ticket', style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),),
          ],
        ),
      )
    );
  }
}
