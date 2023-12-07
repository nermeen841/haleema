class ChildDetailModel {
  int? statusCode;
  ChildrenDetails? childrenDetails;

  ChildDetailModel({this.statusCode, this.childrenDetails});

  ChildDetailModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    childrenDetails = json['children_details'] != null
        ? ChildrenDetails.fromJson(json['children_details'])
        : null;
  }
}

class ChildrenDetails {
  int? id;
  String? name;
  String? hobby;
  String? image;
  String? dateOfBirth;
  int? parentId;
  int? isDiseased;
  String? disease;
  String? gender;
  String? note;
  String? age;
  String? imageUrl;

  ChildrenDetails(
      {this.id,
      this.name,
      this.hobby,
      this.image,
      this.dateOfBirth,
      this.parentId,
      this.isDiseased,
      this.disease,
      this.gender,
      this.note,
      this.age,
      this.imageUrl});

  ChildrenDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hobby = json['hobby'];
    image = json['image'];
    dateOfBirth = json['date_of_birth'];
    parentId = json['parent_id'];
    isDiseased = json['is_diseased'];
    disease = json['disease'];
    gender = json['gender'];
    note = json['note'];
    age = json['age'];
    imageUrl = json['image_url'];
  }
}
