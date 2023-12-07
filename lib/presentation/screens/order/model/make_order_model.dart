class MakeOrderModel {
  int? statusCode;
  Order? order;

  MakeOrderModel({this.statusCode, this.order});

  MakeOrderModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
}

class Order {
  int? setterId;
  String? date;
  String? time;
  int? days;
  double? long;
  double? lat;
  int? hours;
  int? driverId;
  int? parentId;
  String? orderActivity;
  int? id;

  Order(
      {this.setterId,
      this.date,
      this.time,
      this.days,
      this.long,
      this.lat,
      this.hours,
      this.driverId,
      this.parentId,
      this.orderActivity,
      this.id});

  Order.fromJson(Map<String, dynamic> json) {
    setterId = json['setter_id'];
    date = json['date'];
    time = json['time'];
    days = json['days'];
    long = json['long'];
    lat = json['lat'];
    hours = json['hours'];
    driverId = json['driver_id'];
    parentId = json['parent_id'];
    orderActivity = json['order_activity'];
    id = json['id'];
  }
}
