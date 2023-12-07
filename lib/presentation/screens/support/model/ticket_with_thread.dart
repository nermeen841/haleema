class TicketWithThreadModel {
  int? statusCode;
  List<Tickets>? tickets;

  TicketWithThreadModel({this.statusCode, this.tickets});

  TicketWithThreadModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['tickets'] != null) {
      tickets = <Tickets>[];
      json['tickets'].forEach((v) {
        tickets!.add(Tickets.fromJson(v));
      });
    }
  }
}

class Tickets {
  int? id;
  int? userId;
  int? setterId;
  String? problem;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<TicketThreads>? ticketThreads;

  Tickets(
      {this.id,
      this.userId,
      this.setterId,
      this.problem,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.ticketThreads});

  Tickets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    setterId = json['setter_id'];
    problem = json['problem'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ticket_threads'] != null) {
      ticketThreads = <TicketThreads>[];
      json['ticket_threads'].forEach((v) {
        ticketThreads!.add(TicketThreads.fromJson(v));
      });
    }
  }
}

class TicketThreads {
  int? id;
  int? ticketId;
  int? userId;
  String? message;
  String? createdAt;

  TicketThreads({
    this.id,
    this.ticketId,
    this.userId,
    this.message,
    this.createdAt,
  });

  TicketThreads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    userId = json['user_id'];
    message = json['message'];
    createdAt = json['created_at'];
  }
}
