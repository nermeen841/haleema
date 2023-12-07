class AllTransactionModel {
  int? statusCode;
  Transactions? transactions;

  AllTransactionModel({this.statusCode, this.transactions});

  AllTransactionModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    transactions = json['transactions'] != null
        ? Transactions.fromJson(json['transactions'])
        : null;
  }
}

class Transactions {
  List<Data>? data;

  Transactions({
    this.data,
  });

  Transactions.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  int? userId;
  String? amount;
  String? createdAt;
  String? updatedAt;
  String? type;

  Data(
      {this.id,
      this.userId,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }
}
