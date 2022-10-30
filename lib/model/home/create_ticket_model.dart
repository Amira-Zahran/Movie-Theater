class CreateTicketModel {
  int? id;
  int? price;
  int? userId;
  int? movieDateId;
  String? createdAt;
  List<ReservedSeats>? reservedSeats;

  CreateTicketModel(
      {this.id,
        this.price,
        this.userId,
        this.movieDateId,
        this.createdAt,
        this.reservedSeats});

  CreateTicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    userId = json['userId'];
    movieDateId = json['movieDateId'];
    createdAt = json['createdAt'];
    if (json['reservedSeats'] != null) {
      reservedSeats = <ReservedSeats>[];
      json['reservedSeats'].forEach((v) {
        reservedSeats!.add(new ReservedSeats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['price'] = price;
    data['userId'] = userId;
    data['movieDateId'] = movieDateId;
    data['createdAt'] = createdAt;
    if (reservedSeats != null) {
      data['reservedSeats'] =
          reservedSeats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReservedSeats {
  int? id;
  String? seatNumber;
  int? movieDateId;
  int? ticketId;

  ReservedSeats({this.id, this.seatNumber, this.movieDateId, this.ticketId});

  ReservedSeats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seatNumber = json['seatNumber'];
    movieDateId = json['movieDateId'];
    ticketId = json['ticketId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['seatNumber'] = seatNumber;
    data['movieDateId'] = movieDateId;
    data['ticketId'] = ticketId;
    return data;
  }
}