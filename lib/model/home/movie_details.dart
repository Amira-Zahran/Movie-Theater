class MovieDetails {
  int? id;
  String? seatNumber;
  int? movieDateId;
  int? ticketId;

  MovieDetails({this.id, this.seatNumber, this.movieDateId, this.ticketId});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seatNumber = json['seatNumber'];
    movieDateId = json['movieDateId'];
    ticketId = json['ticketId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seatNumber'] = seatNumber;
    data['movieDateId'] = movieDateId;
    data['ticketId'] = ticketId;
    return data;
  }
}