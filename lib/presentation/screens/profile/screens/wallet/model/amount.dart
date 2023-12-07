class TotalAmountModel {
  int? statusCode;
  var totalAmount;

  TotalAmountModel({this.statusCode, this.totalAmount});

  TotalAmountModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    totalAmount = json['total_amount'];
  }
}
