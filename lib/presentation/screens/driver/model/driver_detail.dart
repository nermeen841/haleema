class DriverDetailModel {
  int? statusCode;
  DriverDetails? driverDetails;

  DriverDetailModel({this.statusCode, this.driverDetails});

  DriverDetailModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    driverDetails = json['driver_details'] != null
        ? DriverDetails.fromJson(json['driver_details'])
        : null;
  }
}

class DriverDetails {
  int? id;
  String? name;
  String? phone;
  String? phoneCode;
  String? email;
  String? nationality;
  String? image;
  String? dateOfBirth;
  int? parentId;
  String? gender;
  String? imageUrl;

  DriverDetails(
      {this.id,
      this.name,
      this.phone,
      this.phoneCode,
      this.email,
      this.nationality,
      this.image,
      this.dateOfBirth,
      this.parentId,
      this.gender,
      this.imageUrl});

  DriverDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    phoneCode = json['phone_code'];
    email = json['email'];
    nationality = json['nationality'];
    image = json['image'];
    dateOfBirth = json['date_of_birth'];
    parentId = json['parent_id'];
    gender = json['gender'];
    imageUrl = json['image_url'];
  }
}
