// ignore_for_file: prefer_typing_uninitialized_variables

class ProfileModel {
  int? statusCode;
  User? user;

  ProfileModel({this.statusCode, this.user});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? phoneCode;
  String? email;
  String? nationalId;
  String? nationality;
  String? address;
  String? dateOfBirth;
  String? gender;
  var totalRates;
  var lat;
  var long;
  var avgNumOfStars;
  String? imageUrl;

  User({
    this.id,
    this.name,
    this.totalRates,
    this.phone,
    this.phoneCode,
    this.email,
    this.nationalId,
    this.nationality,
    this.address,
    this.dateOfBirth,
    this.gender,
    this.lat,
    this.long,
    this.imageUrl,
    this.avgNumOfStars,
  });

  User.fromJson(Map<String, dynamic> json) {
    totalRates = json['total_rates'];
    id = json['id'];
    avgNumOfStars = json['avg_num_of_stars'];
    name = json['name'];
    phone = json['phone'];
    phoneCode = json['phone_code'];
    email = json['email'];
    nationalId = json['national_id'];
    nationality = json['nationality'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    lat = json['lat'];
    long = json['long'];
    imageUrl = json['image_url'];
  }
}
