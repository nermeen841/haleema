// ignore_for_file: file_names

class BaseModel {
  String? message;

  BaseModel({
    this.message,
  });

  BaseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
