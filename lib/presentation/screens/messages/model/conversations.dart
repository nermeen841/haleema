class ConversationModel {
  int? statusCode;
  List<Data>? data;

  ConversationModel({this.statusCode, this.data});

  ConversationModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  LastMessage? lastMessage;
  User? user;
  int? unreadCount;

  Data({this.id, this.lastMessage, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unreadCount = json['unread_count'];
    lastMessage = json['last_message'] != null
        ? LastMessage.fromJson(json['last_message'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class LastMessage {
  int? id;
  String? text;
  int? conversationId;
  int? userId;
  String? createdAt;

  LastMessage({
    this.id,
    this.text,
    this.conversationId,
    this.userId,
    this.createdAt,
  });

  LastMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    conversationId = json['conversation_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
  }
}

class User {
  int? id;
  String? name;

  String? imageUrl;

  User({
    this.id,
    this.name,
    this.imageUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }
}
