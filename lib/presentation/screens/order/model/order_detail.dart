import 'package:halema/presentation/screens/order/model/all_orders.dart';

class OrderDetailModel {
  int? statusCode;
  Order? order;

  OrderDetailModel({this.statusCode, this.order});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
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
  int? parentId;
  int? setterId;
  int? driverId;
  String? orderActivity;
  String? discount;
  String? status;
  List<Children>? children;
  Parent? parent;
  Setter? setter;

  Order({
    this.id,
    this.date,
    this.time,
    this.days,
    this.long,
    this.lat,
    this.hours,
    this.parentId,
    this.setterId,
    this.driverId,
    this.orderActivity,
    this.discount,
    this.status,
    this.children,
    this.parent,
    this.setter,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    days = json['days'];
    long = json['long'];
    lat = json['lat'];
    hours = json['hours'];
    parentId = json['parent_id'];
    setterId = json['setter_id'];
    driverId = json['driver_id'];
    orderActivity = json['order_activity'];
    discount = json['discount'];
    status = json['status'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    setter = json['setter'] != null ? Setter.fromJson(json['setter']) : null;
  }
}
