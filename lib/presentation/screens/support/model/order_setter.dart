class OrderSetterModel {
  int? statusCode;
  List<OrderSetters>? setters;

  OrderSetterModel({this.statusCode, this.setters});

  OrderSetterModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['setters'] != null) {
      setters = <OrderSetters>[];
      json['setters'].forEach((v) {
        setters!.add(OrderSetters.fromJson(v));
      });
    }
  }
}

class OrderSetters {
  int? id;
  User? user;

  OrderSetters({this.id, this.user});

  OrderSetters.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;
  String? name;

  String? imageUrl;

  User({this.id, this.name, this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }
}
