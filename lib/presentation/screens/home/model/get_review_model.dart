// ignore_for_file: prefer_typing_uninitialized_variables

class GetReviewModel {
  int? statusCode;
  Data? data;

  GetReviewModel({this.statusCode, this.data});

  GetReviewModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  User? user;
  List<Reviews>? reviews;

  Data({this.user, this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  int? totalRates;
  var avgNumOfStars;
  int? isCompleteProfile;
  String? imageUrl;

  User(
      {this.id,
      this.name,
      this.phone,
      this.totalRates,
      this.avgNumOfStars,
      this.isCompleteProfile,
      this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    totalRates = json['total_rates'];
    avgNumOfStars = json['avg_num_of_stars'];
    isCompleteProfile = json['is_complete_profile'];
    imageUrl = json['image_url'];
  }
}

class Reviews {
  int? id;
  int? numOfStars;
  String? review;
  String? type;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? rateFromId;
  RateFrom? rateFrom;

  Reviews(
      {this.id,
      this.numOfStars,
      this.review,
      this.type,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.rateFromId,
      this.rateFrom});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numOfStars = json['num_of_stars'];
    review = json['review'];
    type = json['type'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rateFromId = json['rate_from_id'];
    rateFrom =
        json['rate_from'] != null ? RateFrom.fromJson(json['rate_from']) : null;
  }
}

class RateFrom {
  int? id;
  String? name;

  RateFrom({
    this.id,
    this.name,
  });

  RateFrom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
