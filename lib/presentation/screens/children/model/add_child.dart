class AddChildModel {
  int? statusCode;
  String? message;

  AddChildModel({this.statusCode, this.message});

  AddChildModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
  }
}
