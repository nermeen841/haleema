class UserModel {
  User? user;

  UserModel({this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  String? image;
  String? role;
  int? isVerified;
  int? isActive;
  int? totalRates;
  String? token;
  String? imageUrl;
  String? nationalIdUrl;

  User(
      {this.id,
      this.name,
      this.phone,
      this.phoneCode,
      this.email,
      this.nationalId,
      this.nationality,
      this.address,
      this.dateOfBirth,
      this.gender,
      this.image,
      this.role,
      this.isVerified,
      this.isActive,
      this.totalRates,
      this.token,
      this.imageUrl,
      this.nationalIdUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    phoneCode = json['phone_code'];
    email = json['email'];
    nationalId = json['national_id'];
    nationality = json['nationality'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    image = json['image'];
    role = json['role'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    totalRates = json['total_rates'];
    token = json['token'];
    imageUrl = json['image_url'];
    nationalIdUrl = json['national_id_url'];
  }
}
