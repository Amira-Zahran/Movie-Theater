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
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['rating'] = this.rating;
    data['duration'] = this.duration;
    data['overview'] = this.overview;
    data['genres'] = this.genres;
    data['adult'] = this.adult;
    data['deleted'] = this.deleted;
    return data;
  }
}