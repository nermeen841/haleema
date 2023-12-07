class VerifyCodeModel {
  User? user;
  String? message;

  VerifyCodeModel({this.user, this.message});

  VerifyCodeModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
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
  String? role;
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
      this.role,
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
    role = json['role'];
    imageUrl = json['image_url'];
    nationalIdUrl = json['national_id_url'];
  }
}
