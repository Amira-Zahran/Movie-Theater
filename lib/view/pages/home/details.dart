import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../model/home/movies_find_model.dart';
import '../../components/core/style.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.moviesFindModel, required this.index}) : super(key: key);

  final List<MoviesFindModel> moviesFindModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*.3,
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(moviesFindModel[index].imageUrl.toString()), fit: BoxFit.cover)),
                  ),
                  Positioned(
                    bottom: 10,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('PG-${moviesFindModel[index].duration.toString()}'),
                              Container(width: 5, height: 5, decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(5)),),
                              const Text('2h 28m'),
                              Container(width: 5, height: 5, decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(5)),),
                              Text(moviesFindModel[index].genres.toString()),
                            ],
                          ),
                          Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: moviesFindModel[index].rating!,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: primary,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(moviesFindModel[index].rating.toString()),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(height: 500,),
              const Text('Synopsis'),
              SizedBox(width: MediaQuery.of(context).size.width*.4, child: Text(moviesFindModel[index].overview.toString(), maxLines: 7, style: const TextStyle(color: Colors.white))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Cast & Crew', style: TextStyle(color: Colors.white)),
                  InkWell(
                    onTap: (){

                    },
                    child: Row(
                      children: const [
                        Text('See All'),
                        Icon(Icons.fast_forward_outlined, color: primary,)
                      ],
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: Image.network(''),),
                        const Text('Tom Holland', style: TextStyle(color: Colors.white))
                      ],
                    );
                  }),
              const Text('Select Date', style: TextStyle(color: Colors.white),),
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: Image.network(''),),
                        const Text('Tom Holland', style: TextStyle(color: Colors.white))
                      ],
                    );
                  }),
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
    );
  }
}
