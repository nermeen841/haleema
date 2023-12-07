class GetSetterDetailModel {
  int? statusCode;
  Setter? setter;

  GetSetterDetailModel({this.statusCode, this.setter});

  GetSetterDetailModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    setter = json['setter'] != null ? Setter.fromJson(json['setter']) : null;
  }
}

class Setter {
  int? id;
  String? hourPrice;
  String? lat;
  String? long;
  int? userId;
  String? hint;

  String? professionalLife;
  int? completedOrders;
  int? receiveOrder;
  int? isCareerComplete;
  int? isFacilityComplete;
  bool? isFavourite;
  List<Certificates>? certificates;
  List<Facility>? facility;
  User? user;

  Setter(
      {this.id,
      this.hourPrice,
      this.lat,
      this.long,
      this.userId,
      this.hint,
      this.professionalLife,
      this.completedOrders,
      this.receiveOrder,
      this.isCareerComplete,
      this.isFacilityComplete,
      this.isFavourite,
      this.certificates,
      this.facility,
      this.user});

  Setter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hourPrice = json['hour_price'];
    lat = json['lat'];
    long = json['long'];
    userId = json['user_id'];
    hint = json['hint'];

    professionalLife = json['Professional_life'];
    completedOrders = json['completed_orders'];
    receiveOrder = json['receive_order'];
    isCareerComplete = json['is_career_complete'];
    isFacilityComplete = json['is_facility_complete'];
    isFavourite = json['is_favourite'];
    if (json['certificates'] != null) {
      certificates = <Certificates>[];
      json['certificates'].forEach((v) {
        certificates!.add(Certificates.fromJson(v));
      });
    }
    if (json['facility'] != null) {
      facility = <Facility>[];
      json['facility'].forEach((v) {
        facility!.add(Facility.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class Certificates {
  int? id;
  int? setterId;
  String? certificateName;
  String? imageUrl;

  Certificates({this.id, this.setterId, this.certificateName, this.imageUrl});

  Certificates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    setterId = json['setter_id'];
    certificateName = json['certificate_name'];
    imageUrl = json['image_url'];
  }
}

class Facility {
  int? id;
  String? space;
  int? numOfRooms;
  int? setterId;
  String? createdAt;
  String? updatedAt;
  String? taxId;
  String? rentContract;
  String? name;
  String? status;
  String? taxIdUrl;
  String? rentContractUrl;
  List<Rooms>? rooms;

  Facility(
      {this.id,
      this.space,
      this.numOfRooms,
      this.setterId,
      this.createdAt,
      this.updatedAt,
      this.taxId,
      this.rentContract,
      this.name,
      this.status,
      this.taxIdUrl,
      this.rentContractUrl,
      this.rooms});

  Facility.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    space = json['space'];
    numOfRooms = json['num_of_rooms'];
    setterId = json['setter_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxId = json['tax_id'];
    rentContract = json['rent_contract'];
    name = json['name'];
    status = json['status'];
    taxIdUrl = json['tax_id_url'];
    rentContractUrl = json['rent_contract_url'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
      });
    }
  }
}

class Rooms {
  int? id;
  int? setterId;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? facilityId;
  List<RoomsImages>? roomsImages;

  Rooms(
      {this.id,
      this.setterId,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.facilityId,
      this.roomsImages});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    setterId = json['setter_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    facilityId = json['facility_id'];
    if (json['rooms_images'] != null) {
      roomsImages = <RoomsImages>[];
      json['rooms_images'].forEach((v) {
        roomsImages!.add(RoomsImages.fromJson(v));
      });
    }
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

  int? totalRates;
  var avgNumOfStars;

  String? imageUrl;

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
      this.totalRates,
      this.avgNumOfStars,
      this.imageUrl});

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
    totalRates = json['total_rates'];
    avgNumOfStars = json['avg_num_of_stars'];
    imageUrl = json['image_url'];
  }
}

class RoomsImages {
  int? id;
  Image? image;

  RoomsImages({
    this.id,
    this.image,
  });

  RoomsImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
}

class Image {
  int? id;
  String? imageUrl;

  Image({this.id, this.imageUrl});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    imageUrl = json['image_url'];
  }
}
