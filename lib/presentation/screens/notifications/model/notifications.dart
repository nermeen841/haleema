class NotificationModel {
  int? statusCode;
  Notifications? notifications;

  NotificationModel({this.statusCode, this.notifications});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    notifications = json['notifications'] != null
        ? Notifications.fromJson(json['notifications'])
        : null;
  }
}

class Notifications {
  List<Data>? data;

  Notifications({
    this.data,
  });

  Notifications.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? title;
  String? body;
  int? orderId;
  String? createdAt;
  Order? order;

  Data(
      {this.id,
      this.userId,
      this.title,
      this.body,
      this.orderId,
      this.createdAt,
      this.order});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
}

class Order {
  int? id;
  String? date;
  String? time;
  int? days;
  String? long;
  String? lat;
  int? hours;
  String? createdAt;
  String? orderActivity;
  String? discount;
  String? status;

  Order(
      {this.id,
      this.date,
      this.time,
      this.days,
      this.long,
      this.lat,
      this.hours,
      this.createdAt,
      this.orderActivity,
      this.discount,
      this.status});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    days = json['days'];
    long = json['long'];
    lat = json['lat'];
    hours = json['hours'];
    createdAt = json['created_at'];
    orderActivity = json['order_activity'];
    discount = json['discount'];
    status = json['status'];
  }
}
