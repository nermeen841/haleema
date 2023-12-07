// ignore_for_file: prefer_typing_uninitialized_variables
class FavouriteModel {
  int? statusCode;
  List<Favourites>? favourites;

  FavouriteModel({this.statusCode, this.favourites});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['favourites'] != null) {
      favourites = <Favourites>[];
      json['favourites'].forEach((v) {
        favourites!.add(Favourites.fromJson(v));
      });
    }
  }
}

class Favourites {
  int? id;
  int? setterId;
  int? parentId;
  Setter? setter;

  Favourites({this.id, this.setterId, this.parentId, this.setter});

  Favourites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    setterId = json['setter_id'];
    parentId = json['parent_id'];
    setter = json['setter'] != null ? Setter.fromJson(json['setter']) : null;
  }
}

class Setter {
  int? id;
  String? hourPrice;
  String? createdAt;
  String? updatedAt;
  int? completedOrders;
  int? receiveOrder;
  int? isCareerComplete;
  int? isFacilityComplete;
  User? user;

  Setter(
      {this.id,
      this.hourPrice,
      this.createdAt,
      this.updatedAt,
      this.completedOrders,
      this.receiveOrder,
      this.isCareerComplete,
      this.isFacilityComplete,
      this.user});

  Setter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hourPrice = json['hour_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    completedOrders = json['completed_orders'];
    receiveOrder = json['receive_order'];
    isCareerComplete = json['is_career_complete'];
    isFacilityComplete = json['is_facility_complete'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;
  String? name;
  String? phone;

  String? email;

  int? totalRates;
  var avgNumOfStars;

  String? imageUrl;

  User({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.totalRates,
    this.avgNumOfStars,
    this.imageUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    totalRates = json['total_rates'];
    avgNumOfStars = json['avg_num_of_stars'];
    imageUrl = json['image_url'];
  }
}
