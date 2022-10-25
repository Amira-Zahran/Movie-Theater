class MoviesFindModel {
  int? id;
  String? name;
  String? imageUrl;
  int? rating;
  int? duration;
  String? overview;
  String? genres;
  bool? adult;
  bool? deleted;

  MoviesFindModel(
      {this.id,
        this.name,
        this.imageUrl,
        this.rating,
        this.duration,
        this.overview,
        this.genres,
        this.adult,
        this.deleted});

  MoviesFindModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    rating = json['rating'];
    duration = json['duration'];
    overview = json['overview'];
    genres = json['genres'];
    adult = json['adult'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['rating'] = rating;
    data['duration'] = duration;
    data['overview'] = overview;
    data['genres'] = genres;
    data['adult'] = adult;
    data['deleted'] = deleted;
    return data;
  }
}