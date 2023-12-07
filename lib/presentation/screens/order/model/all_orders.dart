// ignore_for_file: prefer_typing_uninitialized_variables

class AllOrdersModel {
  int? statusCode;
  Order? order;

  AllOrdersModel({this.statusCode, this.order});

  AllOrdersModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
}

class Order {
  int? currentPage;
  List<Data>? data;

  Order({
    this.currentPage,
    this.data,
  });

  Order.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
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
  String? date;
  String? time;
  int? days;
  String? long;
  String? lat;
  int? hours;
  String? orderActivity;
  String? discount;
  String? status;
  List<Children>? children;
  Parent? parent;
  Setter? setter;

  Data({
    this.id,
    this.date,
    this.time,
    this.days,
    this.long,
    this.lat,
    this.hours,
    this.orderActivity,
    this.discount,
    this.status,
    this.children,
    this.parent,
    this.setter,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    days = json['days'];
    long = json['long'];
    lat = json['lat'];
    hours = json['hours'];
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

class Children {
  int? id;
  String? name;
  String? hobby;
  String? image;
  String? dateOfBirth;
  String? disease;
  String? gender;
  String? note;
  String? age;
  String? imageUrl;

  Children({
    this.id,
    this.name,
    this.hobby,
    this.image,
    this.dateOfBirth,
    this.disease,
    this.gender,
    this.note,
    this.age,
    this.imageUrl,
  });

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hobby = json['hobby'];
    image = json['image'];
    dateOfBirth = json['date_of_birth'];
    disease = json['disease'];
    gender = json['gender'];
    note = json['note'];
    age = json['age'];
    imageUrl = json['image_url'];
  }
}

class Parent {
  int? id;
  int? userId;
  User? user;
  List<Drivers>? drivers;

  Parent({
    this.id,
    this.userId,
    this.user,
    this.drivers,
  });

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['drivers'] != null) {
      drivers = <Drivers>[];
      json['drivers'].forEach((v) {
        drivers!.add(Drivers.fromJson(v));
      });
    }
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? nationalId;
  String? nationality;
  String? address;
  String? dateOfBirth;
  String? gender;
  int? totalRates;
  var avgNumOfStars;
  String? imageUrl;
  String? nationalIdUrl;

  User({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.nationalId,
    this.nationality,
    this.address,
    this.dateOfBirth,
    this.gender,
    this.totalRates,
    this.avgNumOfStars,
    this.imageUrl,
    this.nationalIdUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    nationalId = json['national_id'];
    nationality = json['nationality'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    totalRates = json['total_rates'];
    avgNumOfStars = json['avg_num_of_stars'];
    imageUrl = json['image_url'];
    nationalIdUrl = json['national_id_url'];
  }
}

class Drivers {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? nationality;
  String? image;
  String? dateOfBirth;
  String? imageUrl;

  Drivers(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.nationality,
      this.image,
      this.dateOfBirth,
      this.imageUrl});

  Drivers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    nationality = json['nationality'];
    image = json['image'];
    dateOfBirth = json['date_of_birth'];
    imageUrl = json['image_url'];
  }
}

class Setter {
  int? id;
  String? hourPrice;
  String? professionalLife;
  int? completedOrders;
  int? receiveOrder;
  User? user;

  Setter({
    this.id,
    this.hourPrice,
    this.professionalLife,
    this.completedOrders,
    this.receiveOrder,
    this.user,
  });

  Setter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hourPrice = json['hour_price'];
    professionalLife = json['Professional_life'];
    completedOrders = json['completed_orders'];
    receiveOrder = json['receive_order'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}
