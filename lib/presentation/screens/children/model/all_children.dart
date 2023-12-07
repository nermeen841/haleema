class AllChildrenModel {
  int? statusCode;
  List<Childrens>? childrens;

  AllChildrenModel({this.statusCode, this.childrens});

  AllChildrenModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['childrens'] != null) {
      childrens = <Childrens>[];
      json['childrens'].forEach((v) {
        childrens!.add(Childrens.fromJson(v));
      });
    }
  }
}

class Childrens {
  int? id;
  String? name;
  String? nationality;
  String? hobby;
  String? dateOfBirth;
  int? isDiseased;
  String? disease;
  String? gender;
  String? note;
  var age;
  String? imageUrl;

  Childrens(
      {this.id,
      this.name,
      this.nationality,
      this.hobby,
      this.dateOfBirth,
      this.isDiseased,
      this.disease,
      this.gender,
      this.note,
      this.age,
      this.imageUrl});

  Childrens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nationality = json['nationality'];
    hobby = json['hobby'];
    dateOfBirth = json['date_of_birth'];
    isDiseased = json['is_diseased'];
    disease = json['disease'];
    gender = json['gender'];
    note = json['note'];
    age = json['age'];
    imageUrl = json['image_url'];
  }
}
