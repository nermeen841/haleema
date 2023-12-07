class DeleteAccountModel {
  int? statusCode;
  String? message;

  DeleteAccountModel({this.statusCode, this.message});

  DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
  }
}
