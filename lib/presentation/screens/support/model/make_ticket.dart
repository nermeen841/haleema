class MakeTicketModel {
  String? message;
  Ticket? ticket;

  MakeTicketModel({this.message, this.ticket});

  MakeTicketModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    ticket = json['ticket'] != null ? Ticket.fromJson(json['ticket']) : null;
  }
}

class Ticket {
  int? userId;
  String? problem;
  String? description;

  int? id;

  Ticket({
    this.userId,
    this.problem,
    this.description,
    this.id,
  });

  Ticket.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    problem = json['problem'];
    description = json['description'];

    id = json['id'];
  }
}
