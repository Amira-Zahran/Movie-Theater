import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:odc_interview/view/components/core/components.dart';
import 'package:odc_interview/view_model/bloc/home/home_cubit.dart';
import '../../../model/home/movies_find_model.dart';
import '../../../model/home/movies_upcoming_model.dart';
import '../../../view_model/bloc/states.dart';
import '../../components/core/style.dart';
import 'reservation.dart';


class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key, required this.moviesFindModel, required this.moviesUpComing, required this.index}) : super(key: key);

  final List<MoviesFindModel> moviesFindModel;
  final List<MoviesUpComingModel> moviesUpComing;
  final int index;


  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  DateTime selectedValue = DateTime.now();
  final DatePickerController _controller = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: secondary,
            body: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*.3,
                          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.moviesFindModel[widget.index].imageUrl.toString()), fit: BoxFit.cover)),
                        ),
                        const BackButton(color: Colors.white,),
                        Positioned(
                          top: MediaQuery.of(context).size.height*.12,
                          left: MediaQuery.of(context).size.height*.22,
                          child: playIcon(),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.266),
                            child: Text(widget.moviesFindModel[widget.index].name.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('PG-${widget.moviesFindModel[widget.index].duration.toString()}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        const SizedBox(width: 5,),
                        circle(primary),
                        const SizedBox(width: 5,),
                        const Text('2h 28m', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        const SizedBox(width: 5,),
                        circle(primary),
                        const SizedBox(width: 5,),
                        Text(widget.moviesFindModel[widget.index].genres.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            initialRating: 4.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => SizedBox(
                              width: MediaQuery.of(context).size.width/8,
                              child: const Icon(
                                Icons.star,
                                color: primary,
                              ),
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                          Text(widget.moviesFindModel[widget.index].rating.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: customText('Synopsis', 15)
                    ),
                    Center(child: SizedBox(
                        height: MediaQuery.of(context).size.width*.2,
                        width: MediaQuery.of(context).size.width*.8, child: Text(widget.moviesFindModel[widget.index].overview.toString(), maxLines: 7, style: const TextStyle(color: Colors.white)))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: customText('Cast & Crew', 15)
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Row(
                            children: [
                              customText('See All', 15),
                              const Icon(Icons.fast_forward_outlined, color: primary,)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  width: MediaQuery.of(context).size.width*.3,
                                  height: MediaQuery.of(context).size.height*.09,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset('assets/img/mask.png'),),
                                //SizedBox(height: 10,),
                                const Text('Tom Holland', style: TextStyle(color: Colors.white, fontSize: 8))
                              ],
                            );
                          }),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 20),
                        child: customText('Select Date', 15)
                    ),

                    DatePicker(
                      DateTime.now(),
                      width: 70,
                      height: 80,
                      controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: primary,
                      selectedTextColor: Colors.white,
                      monthTextStyle: const TextStyle(color: Colors.white),
                      dateTextStyle: const TextStyle(color: Colors.white),
                      dayTextStyle: const TextStyle(color: Colors.white),
                      daysCount: 9,
                      deactivatedColor: darkGrey,
                      inactiveDates: [
                        DateTime.now().add(const Duration(days: 0,)),
                      ],
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          selectedValue = date;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            width: MediaQuery.of(context).size.width,
                            child: MaterialButton(
                              height: 60,
                              color: primary,
                              onPressed: () {
                                navigateTo(context, Reservation(movieFind: widget.moviesFindModel, indx: widget.index));
                              },
                              child: Center(child: customText('Reservation', 16)),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),

    );
  }
}