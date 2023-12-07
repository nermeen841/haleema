class ReportMessageModel {
  int? statusCode;
  List<TicketThreads>? ticketThreads;

  ReportMessageModel({this.statusCode, this.ticketThreads});

  ReportMessageModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['ticketThreads'] != null) {
      ticketThreads = <TicketThreads>[];
      json['ticketThreads'].forEach((v) {
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
  String? updatedAt;

  TicketThreads(
      {this.id,
      this.ticketId,
      this.userId,
      this.message,
      this.createdAt,
      this.updatedAt});

  TicketThreads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    userId = json['user_id'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
