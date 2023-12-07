class DriversModel {
  int? statusCode;
  List<Drivers>? drivers;

  DriversModel({this.statusCode, this.drivers});

  DriversModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['drivers'] != null) {
      drivers = <Drivers>[];
      json['drivers'].forEach((v) {
        drivers!.add(Drivers.fromJson(v));
      });
    }
  }
}

class Drivers {
  int? id;
  String? name;
  String? phone;
  String? phoneCode;
  String? email;
  String? nationality;
  String? image;
  String? dateOfBirth;
  String? gender;
  String? imageUrl;

  Drivers(
      {this.id,
      this.name,
      this.phone,
      this.phoneCode,
      this.email,
      this.nationality,
      this.image,
      this.dateOfBirth,
      this.gender,
      this.imageUrl});

  Drivers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    phoneCode = json['phone_code'];
    email = json['email'];
    nationality = json['nationality'];
    image = json['image'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    imageUrl = json['image_url'];
  }
}
