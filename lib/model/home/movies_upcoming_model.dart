import 'dart:convert';

List<MoviesUpComingModel> carouselFromJson(String str) => List<MoviesUpComingModel>.from(json.decode(str).map((x) => MoviesUpComingModel.fromJson(x)));

class MoviesUpComingModel {
  String? name;
  String? imageUrl;
  String? overview;
  num? rating;
  String? trailer;
  int? duration;
  bool? adult;
  String? genre;

  MoviesUpComingModel(
      {this.name,
        this.imageUrl,
        this.overview,
        this.rating,
        this.trailer,
        this.duration,
        this.adult,
        this.genre});

  MoviesUpComingModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    overview = json['overview'];
    rating = json['rating'];
    trailer = json['trailer'];
    duration = json['duration'];
    adult = json['adult'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['overview'] = overview;
    data['rating'] = rating;
    data['trailer'] = trailer;
    data['duration'] = duration;
    data['adult'] = adult;
    data['genre'] = genre;
    return data;
  }
}