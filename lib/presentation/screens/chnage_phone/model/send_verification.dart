class SendVerifiacationModel {
  int? statusCode;
  String? message;
  int? code;

  SendVerifiacationModel({this.statusCode, this.message, this.code});

  SendVerifiacationModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    code = json['code'];
  }
}
