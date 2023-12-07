class MessageModel {
  int? statusCode;
  int? conversationId;
  Data? data;

  MessageModel({this.statusCode, this.conversationId, this.data});

  MessageModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    conversationId = json['conversation_id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<DataChat>? data;

  Data({
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataChat>[];
      json['data'].forEach((v) {
        data!.add(DataChat.fromJson(v));
      });
    }
  }
}

class DataChat {
  int? id;
  String? text;
  int? conversationId;
  int? userId;
  String? createdAt;

  DataChat({
    this.id,
    this.text,
    this.conversationId,
    this.userId,
    this.createdAt,
  });

  DataChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    conversationId = json['conversation_id'];
    userId = json['user_id'];
  }
}
