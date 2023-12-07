// ignore_for_file: prefer_typing_uninitialized_variables

class GetSettersModel {
  int? statusCode;
  Setters? setters;

  GetSettersModel({this.statusCode, this.setters});

  GetSettersModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    setters =
        json['setters'] != null ? Setters.fromJson(json['setters']) : null;
  }
}

class Setters {
  List<Data>? data;

  Setters({
    this.data,
  });

  Setters.fromJson(Map<String, dynamic> json) {
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
  String? hourPrice;
  String? lat;
  String? long;
  int? completedOrders;
  int? receiveOrder;
  User? user;

  Data({
    this.id,
    this.hourPrice,
    this.completedOrders,
    this.receiveOrder,
    this.user,
    this.lat,
    this.long,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hourPrice = json['hour_price'];
    completedOrders = json['completed_orders'];
    receiveOrder = json['receive_order'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    lat = json['lat'];
    long = json['long'];
  }
}

class User {
  int? id;
  String? name;
  String? nationality;
  int? isVerified;
  int? isActive;
  int? totalRates;
  var avgNumOfStars;
  String? imageUrl;
  String? nationalIdUrl;
  String? address;

  User({
    this.id,
    this.name,
    this.nationality,
    this.isVerified,
    this.isActive,
    this.totalRates,
    this.avgNumOfStars,
    this.imageUrl,
    this.nationalIdUrl,
    this.address,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nationality = json['nationality'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    totalRates = json['total_rates'];
    avgNumOfStars = json['avg_num_of_stars'];
    imageUrl = json['image_url'];
    nationalIdUrl = json['national_id_url'];
    address = json['address'];
  }
}
