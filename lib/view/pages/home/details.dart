import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../model/home/movies_find_model.dart';
import '../../components/core/style.dart';


class Details extends StatefulWidget {
  const Details({Key? key, required this.moviesFindModel, required this.index}) : super(key: key);

  final List<MoviesFindModel> moviesFindModel;
  final int index;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  DateTime _selectedValue = DateTime.now();
  DatePickerController _controller = DatePickerController();

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
                    Positioned(
                        bottom: 10,
                        left: 70,
                        child: Center(child: Text(widget.moviesFindModel[widget.index].name.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),)))
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('PG-${widget.moviesFindModel[widget.index].duration.toString()}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(width: 5,),
                    Container(width: 5, height: 5, decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(5)),),
                    const SizedBox(width: 5,),
                    const Text('2h 28m', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(width: 5,),
                    Container(width: 5, height: 5, decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(5)),),
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
                          print(rating);
                        },
                      ),
                      Text(widget.moviesFindModel[widget.index].rating.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Synopsis', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                Center(child: SizedBox(
                    height: MediaQuery.of(context).size.width*.2,
                    width: MediaQuery.of(context).size.width*.8, child: Text(widget.moviesFindModel[widget.index].overview.toString(), maxLines: 7, style: const TextStyle(color: Colors.white)))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Cast & Crew', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        children: const [
                          Text('See All', style: TextStyle(color: Colors.white, fontSize: 15)),
                          Icon(Icons.fast_forward_outlined, color: primary,)
                        ],
                      ),
                    ),
                  ],
                ),
/*
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*.3,
                              height: MediaQuery.of(context).size.height*.08,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                              child: Image.asset('assets/img/mask.png'),),
                            //SizedBox(height: 10,),
                            const Text('Tom Holland', style: TextStyle(color: Colors.white, fontSize: 8))
                          ],
                        );
                      }),
                ),
*/
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Select Date', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ),

                Container(
                  child: DatePicker(
                    DateTime.now(),
                    width: 60,
                    height: 80,
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: primary,
                    selectedTextColor: Colors.white,
                    inactiveDates: [
                      DateTime.now().add(const Duration(days: 3)),
                      DateTime.now().add(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 7))
                    ],
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedValue = date;
                      });
                    },
                  ),
                ),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
                Container(
                    padding: const EdgeInsets.only(top: 11, bottom: 11),
                    decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
                    child: FlutterDatePickerTimeline(
                      startDate: DateTime(2020, 07, 01),
                      endDate: DateTime(2020, 12, 30),
                      initialSelectedDate: DateTime(2020, 07, 24), onSelectedDateChange: (DateTime? date) {
                      print('kk');
                    },
                    )),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: MaterialButton(
                      onPressed: () => {},
                      child: const Text('Reservation'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
