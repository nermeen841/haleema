class LatestTransactionModel {
  int? statusCode;
  List<Transactions>? transactions;

  LatestTransactionModel({this.statusCode, this.transactions});

  LatestTransactionModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transactions.fromJson(v));
      });
    }
  }
}

class Transactions {
  int? id;
  int? userId;
  String? amount;
  String? createdAt;
  String? updatedAt;
  String? type;

  Transactions(
      {this.id,
      this.userId,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.type});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }
}
